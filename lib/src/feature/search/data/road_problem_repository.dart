import 'package:city_drive/src/core/local_storage/mappers/road_problem_mapper.dart';
import 'package:city_drive/src/core/local_storage/models/road_problem_entity.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/feature/search/data/road_problem_local_ds.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

abstract interface class IRoadProblemRepository {
  List<RoadProblemDTO> getAll();
  List<RoadProblemDTO> getByAuthorId(int authorUserId, {String? authorName});
  List<RoadProblemDTO> getPendingForController();
  List<RoadProblemDTO> getAssignedToController(int controllerId);
  RoadProblemDTO? getById(int id);
  Future<RoadProblemDTO> add(RoadProblemDTO problem);
  Future<RoadProblemDTO> update(RoadProblemDTO problem);
  Future<void> delete(int id);
  Future<RoadProblemDTO> updateStatus({
    required int id,
    required String status,
    int? assignedControllerId,
  });
}

class RoadProblemRepository implements IRoadProblemRepository {
  RoadProblemRepository(this._localDS);

  final RoadProblemLocalDataSource _localDS;

  @override
  List<RoadProblemDTO> getAll() =>
      _localDS.getAll().map(RoadProblemMapper.toDto).toList();

  @override
  List<RoadProblemDTO> getByAuthorId(
    int authorUserId, {
    String? authorName,
  }) =>
      _localDS
          .getAll()
          .where(
            (p) =>
                p.authorUserId == authorUserId ||
                (p.authorUserId == 0 &&
                    authorName != null &&
                    p.author == authorName),
          )
          .map(RoadProblemMapper.toDto)
          .toList();

  @override
  List<RoadProblemDTO> getPendingForController() => _localDS
      .getAll()
      .where(
        (p) =>
            p.status == ReportStatus.newReport ||
            p.status == ReportStatus.pending,
      )
      .map(RoadProblemMapper.toDto)
      .toList();

  @override
  List<RoadProblemDTO> getAssignedToController(int controllerId) => _localDS
      .getAll()
      .where(
        (p) =>
            p.assignedControllerId == controllerId &&
            (p.status == ReportStatus.confirmed ||
                p.status == ReportStatus.inProgress ||
                p.status == ReportStatus.fixed),
      )
      .map(RoadProblemMapper.toDto)
      .toList();

  @override
  RoadProblemDTO? getById(int id) {
    final entity = _localDS.getById(id);
    return entity == null ? null : RoadProblemMapper.toDto(entity);
  }

  @override
  Future<RoadProblemDTO> add(RoadProblemDTO problem) async {
    final id = problem.id == 0 ? _localDS.nextId() : problem.id;
    final entity = RoadProblemMapper.fromDto(problem).copyWith(
      id: id,
      status: problem.status ?? ReportStatus.newReport,
    );
    await _localDS.save(entity);
    return RoadProblemMapper.toDto(entity);
  }

  @override
  Future<RoadProblemDTO> update(RoadProblemDTO problem) async {
    final entity = RoadProblemMapper.fromDto(problem);
    await _localDS.save(entity);
    return RoadProblemMapper.toDto(entity);
  }

  @override
  Future<void> delete(int id) => _localDS.delete(id);

  @override
  Future<RoadProblemDTO> updateStatus({
    required int id,
    required String status,
    int? assignedControllerId,
  }) async {
    final current = _localDS.getById(id);
    if (current == null) {
      throw Exception('Отметка не найдена');
    }
    final updated = current.copyWith(
      status: status,
      assignedControllerId: assignedControllerId ?? current.assignedControllerId,
    );
    await _localDS.save(updated);
    return RoadProblemMapper.toDto(updated);
  }
}
