import 'package:city_drive/src/core/local_storage/hive_json_util.dart';
import 'package:city_drive/src/core/local_storage/hive_service.dart';
import 'package:city_drive/src/core/local_storage/models/road_problem_entity.dart';

class RoadProblemLocalDataSource {
  RoadProblemLocalDataSource(this._hive);

  final HiveService _hive;

  List<RoadProblemEntity> getAll() {
    final list = <RoadProblemEntity>[];
    for (final key in _hive.problemsBox.keys) {
      final raw = _hive.problemsBox.get(key);
      if (raw is Map) {
        list.add(RoadProblemEntity.fromJson(hiveMap(raw)));
      }
    }
    list.sort(
      (a, b) => (b.reportedDate ?? DateTime(0))
          .compareTo(a.reportedDate ?? DateTime(0)),
    );
    return list;
  }

  RoadProblemEntity? getById(int id) {
    final raw = _hive.problemsBox.get(id);
    if (raw is! Map) return null;
    return RoadProblemEntity.fromJson(hiveMap(raw));
  }

  Future<void> save(RoadProblemEntity entity) async {
    await _hive.problemsBox.put(entity.id, entity.toJson());
  }

  Future<void> delete(int id) async {
    await _hive.problemsBox.delete(id);
  }

  /// Hive допускает int-ключи только в диапазоне 0 … 0xFFFFFFFF.
  int nextId() {
    var maxId = 0;
    for (final key in _hive.problemsBox.keys) {
      final id = key is int ? key : int.tryParse(key.toString()) ?? 0;
      if (id > maxId) maxId = id;
    }
    return maxId + 1;
  }
}
