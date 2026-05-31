import 'package:hive_flutter/hive_flutter.dart';
import 'package:city_drive/src/core/local_storage/hive_json_util.dart';

/// Локальное хранилище Hive без демо-данных — только реальные записи пользователей.
class HiveService {
  static const usersBoxName = 'users';
  static const problemsBoxName = 'road_problems';
  static const sessionBoxName = 'session';
  static const companiesBoxName = 'companies';
  static const metaBoxName = 'meta';

  static const storageVersionKey = 'storage_version';
  static const currentStorageVersion = 4;

  /// Демо-отметки из ранних сборок (удаляются при миграции).
  static const demoProblemIds = {1001, 1002, 1003, 1004};
  static const demoUserPhones = {'+77777777777', '+77007007070'};

  late final Box<dynamic> usersBox;
  late final Box<dynamic> problemsBox;
  late final Box<dynamic> sessionBox;
  late final Box<dynamic> companiesBox;
  late final Box<dynamic> metaBox;

  Future<void> init() async {
    await Hive.initFlutter();
    usersBox = await Hive.openBox(usersBoxName);
    problemsBox = await Hive.openBox(problemsBoxName);
    sessionBox = await Hive.openBox(sessionBoxName);
    companiesBox = await Hive.openBox(companiesBoxName);
    metaBox = await Hive.openBox(metaBoxName);

    await _migrateIfNeeded();
  }

  Future<void> _migrateIfNeeded() async {
    final version = metaBox.get(storageVersionKey) as int? ?? 0;
    if (version >= currentStorageVersion) return;

    for (final id in demoProblemIds) {
      await problemsBox.delete(id);
    }
    for (final phone in demoUserPhones) {
      await usersBox.delete(phone);
    }

    await metaBox.delete('seeded_v1');

    if (version < 4) {
      await _fixOrphanAuthorIds();
    }

    await metaBox.put(storageVersionKey, currentStorageVersion);
  }

  /// Старые отметки могли сохраниться с authorUserId = 0 — привязываем к пользователю по имени.
  Future<void> _fixOrphanAuthorIds() async {
    final nameToId = <String, int>{};
    for (final key in usersBox.keys) {
      final raw = usersBox.get(key);
      if (raw is! Map) continue;
      final map = hiveMap(raw);
      final id = (map['id'] as num?)?.toInt();
      final name = map['fullName'] as String?;
      if (id != null && name != null && name.isNotEmpty) {
        nameToId[name] = id;
      }
    }

    for (final key in problemsBox.keys) {
      final raw = problemsBox.get(key);
      if (raw is! Map) continue;
      final map = Map<String, dynamic>.from(hiveMap(raw));
      final authorUserId = (map['authorUserId'] as num?)?.toInt() ?? 0;
      if (authorUserId != 0) continue;
      final author = map['author'] as String?;
      final userId = author != null ? nameToId[author] : null;
      if (userId == null) continue;
      map['authorUserId'] = userId;
      await problemsBox.put(key, map);
    }
  }

  Future<void> close() async {
    await Hive.close();
  }
}
