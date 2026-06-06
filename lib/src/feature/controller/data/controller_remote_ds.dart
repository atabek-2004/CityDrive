import 'package:dio/dio.dart';
import 'package:city_drive/src/feature/controller/models/controller_dashboard_dto.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

abstract interface class IControllerRemoteDS {
  Future<ControllerDashboardDTO> getDashboard({
    String? q,
    String? severity,
    String? type,
    int limit = 20,
    int offset = 0,
  });

  /// Separate call only when dashboard is unavailable.
  /// Tries `GET /controller/marks/mine`, then alias `GET /marks/mine-for-controller`.
  Future<List<RoadProblemDTO>> getMyMarks();
}

class ControllerRemoteDS implements IControllerRemoteDS {
  ControllerRemoteDS(this._dio);

  final Dio _dio;

  @override
  Future<ControllerDashboardDTO> getDashboard({
    String? q,
    String? severity,
    String? type,
    int limit = 20,
    int offset = 0,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'controller/dashboard',
      queryParameters: {
        if (q != null && q.isNotEmpty) 'q': q,
        if (severity != null && severity.isNotEmpty) 'severity': severity,
        if (type != null && type.isNotEmpty) 'type': type,
        'limit': limit,
        'offset': offset,
      },
    );
    return ControllerDashboardDTO.fromJson(response.data!);
  }

  @override
  Future<List<RoadProblemDTO>> getMyMarks() async {
    try {
      final marks = await _fetchList('controller/marks/mine');
      if (marks.isNotEmpty) return marks;
    } on DioException catch (e) {
      if (!_isMissingEndpoint(e)) rethrow;
    }

    try {
      return await _fetchList('marks/mine-for-controller');
    } on DioException catch (e) {
      if (_isMissingEndpoint(e)) return [];
      rethrow;
    }
  }

  Future<List<RoadProblemDTO>> _fetchList(String path) async {
    final response = await _dio.get<dynamic>(path);
    return _parseList(response.data);
  }

  bool _isMissingEndpoint(DioException e) {
    final code = e.response?.statusCode;
    return code == 404 || code == 500 || code == 501;
  }

  List<RoadProblemDTO> _parseList(dynamic data) {
    if (data is! List) return [];
    return data
        .whereType<Map>()
        .map((e) => RoadProblemDTO.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}

String controllerApiErrorMessage(Object error) {
  if (error is DioException) {
    final data = error.response?.data;
    if (data is Map && data['message'] is String) {
      return data['message'] as String;
    }
    return error.message ?? 'Ошибка запроса';
  }
  return error.toString();
}

int? controllerApiStatusCode(Object error) {
  if (error is DioException) return error.response?.statusCode;
  return null;
}

String controllerActionErrorMessage(Object error) {
  final code = controllerApiStatusCode(error);
  final serverMsg = controllerApiErrorMessage(error);
  if (code != 409) return serverMsg;

  final lower = serverMsg.toLowerCase();
  if (lower.contains('not available')) {
    return 'Заявка недоступна: она уже принята или ещё не готова для контроллера. '
        'Обновите список и попробуйте другую отметку.';
  }
  if (lower.contains('another') ||
      lower.contains('already') ||
      lower.contains('already accepted')) {
    return 'Заявка уже принята другим контроллером';
  }
  return serverMsg;
}
