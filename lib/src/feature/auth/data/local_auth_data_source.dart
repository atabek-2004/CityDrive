import 'package:city_drive/src/core/local_storage/hive_json_util.dart';
import 'package:city_drive/src/core/local_storage/hive_service.dart';
import 'package:city_drive/src/core/utils/phone_util.dart';
import 'package:city_drive/src/core/local_storage/models/local_user.dart';
import 'package:city_drive/src/core/local_storage/user_role.dart';
import 'package:city_drive/src/feature/auth/models/common_dto.dart';
import 'package:city_drive/src/feature/auth/models/common_lists_dto.dart';

class LocalAuthDataSource {
  LocalAuthDataSource(this._hive);

  final HiveService _hive;

  Future<LocalUser?> findByPhone(String phone) async {
    final key = PhoneUtil.normalize(phone);
    final raw = _hive.usersBox.get(key);
    if (raw is! Map) return null;
    return LocalUser.fromJson(hiveMap(raw));
  }

  Future<LocalUser?> findById(int id) async {
    for (final key in _hive.usersBox.keys) {
      final raw = _hive.usersBox.get(key);
      if (raw is! Map) continue;
      final user = LocalUser.fromJson(hiveMap(raw));
      if (user.id == id) return user;
    }
    return null;
  }

  Future<LocalUser> createUser({
    required String phone,
    required String password,
    required String fullName,
    required UserRole role,
    int? cityId,
  }) async {
    final key = PhoneUtil.normalize(phone);
    final existing = await findByPhone(phone);
    if (existing != null) {
      throw Exception('Пользователь с таким телефоном уже зарегистрирован');
    }

    var nextId = 1;
    for (final k in _hive.usersBox.keys) {
      final raw = _hive.usersBox.get(k);
      if (raw is! Map) continue;
      final id = (raw['id'] as num?)?.toInt() ?? 0;
      if (id >= nextId) nextId = id + 1;
    }

    final user = LocalUser(
      id: nextId,
      phone: key,
      password: password,
      fullName: fullName,
      role: role,
      cityId: cityId,
    );
    await _hive.usersBox.put(key, user.toJson());
    return user;
  }

  Future<LocalUser> updateUser(LocalUser user) async {
    await _hive.usersBox.put(user.phone, user.toJson());
    return user;
  }

  List<CommonDTO> get cities => const [
        CommonDTO(id: 1, name: 'Алматы'),
        CommonDTO(id: 2, name: 'Астана'),
        CommonDTO(id: 3, name: 'Шымкент'),
      ];

  CommonListsDTO get registerFormOptions => CommonListsDTO(
        cities: cities,
        classes: const [],
      );
}
