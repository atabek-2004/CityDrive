import 'package:dio/dio.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/feature/auth/data/auth_repository.dart';
import 'package:city_drive/src/feature/controller/data/controller_remote_ds.dart';
import 'package:city_drive/src/feature/controller/models/controller_dashboard_dto.dart';
import 'package:city_drive/src/feature/search/data/road_problem_repository.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

abstract interface class IControllerRepository {
  Future<ControllerDashboardDTO> getDashboard({
    String? q,
    String? severity,
    String? type,
    int limit = 20,
    int offset = 0,
  });

  Future<RoadProblemDTO> getMark(int id);

  Future<RoadProblemDTO> updateMarkStatus({
    required int id,
    required String status,
    int? assignedControllerId,
    String? comment,
  });

  /// Only when a separate my-marks fetch is needed (tab refresh without full dashboard).
  Future<List<RoadProblemDTO>> refreshMyMarks();
}

class ControllerRepositoryImpl implements IControllerRepository {
  ControllerRepositoryImpl({
    required IControllerRemoteDS remoteDS,
    required IRoadProblemRepository roadProblemRepository,
    required IAuthRepository authRepository,
  })  : _remoteDS = remoteDS,
        _roadProblemRepository = roadProblemRepository,
        _authRepository = authRepository;

  final IControllerRemoteDS _remoteDS;
  final IRoadProblemRepository _roadProblemRepository;
  final IAuthRepository _authRepository;

  void _applyDashboardCaches(ControllerDashboardDTO dashboard) {
    _roadProblemRepository.cachePendingForController(dashboard.pendingMarks);
    _roadProblemRepository.cacheMineForController(dashboard.myMarks);
  }

  @override
  Future<ControllerDashboardDTO> getDashboard({
    String? q,
    String? severity,
    String? type,
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final dashboard = await _remoteDS.getDashboard(
        q: q,
        severity: severity,
        type: type,
        limit: limit,
        offset: offset,
      );
      _applyDashboardCaches(dashboard);
      return dashboard;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404 || e.response?.statusCode == 501) {
        return _dashboardFromLegacyEndpoints(
          q: q,
          severity: severity,
          type: type,
          limit: limit,
          offset: offset,
        );
      }
      rethrow;
    }
  }

  Future<ControllerDashboardDTO> _dashboardFromLegacyEndpoints({
    String? q,
    String? severity,
    String? type,
    int limit = 20,
    int offset = 0,
  }) async {
    await _roadProblemRepository.refresh();
    await _roadProblemRepository.refreshPending(
      q: q,
      severity: severity,
      type: type,
      limit: limit,
      offset: offset,
    );
    await _roadProblemRepository.refreshMineForController(
      controllerUserId: _authRepository.user?.id,
    );

    final pending = _roadProblemRepository.getPendingForController();
    final mine = _roadProblemRepository.getMineForController();
    final dashboard = ControllerDashboardDTO(
      stats: ControllerDashboardStatsDTO(
        newCount: pending.length,
        applicationsCount: pending.length,
        inWorkCount: mine
            .where(
              (m) =>
                  m.status == ReportStatus.confirmed ||
                  m.status == ReportStatus.inProgress,
            )
            .length,
        doneCount:
            mine.where((m) => m.status == ReportStatus.fixed).length,
      ),
      pendingMarks: pending,
      myMarks: mine,
    );
    _applyDashboardCaches(dashboard);
    return dashboard;
  }

  @override
  Future<RoadProblemDTO> getMark(int id) =>
      _roadProblemRepository.fetchMarkById(id);

  @override
  Future<List<RoadProblemDTO>> refreshMyMarks() async {
    try {
      final marks = await _remoteDS.getMyMarks();
      if (marks.isNotEmpty) {
        _roadProblemRepository.cacheMineForController(marks);
        return marks;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode != 404 && e.response?.statusCode != 501) {
        rethrow;
      }
    }

    // Fallback: single dashboard request → my_marks.
    final dashboard = await getDashboard();
    return dashboard.myMarks;
  }

  @override
  Future<RoadProblemDTO> updateMarkStatus({
    required int id,
    required String status,
    int? assignedControllerId,
    String? comment,
  }) =>
      _roadProblemRepository.updateStatus(
        id: id,
        status: status,
        assignedControllerId: assignedControllerId,
        comment: comment,
      );
}
