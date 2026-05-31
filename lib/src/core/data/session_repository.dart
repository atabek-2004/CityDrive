import 'package:city_drive/src/core/local_storage/hive_service.dart';
import 'package:city_drive/src/core/local_storage/user_role.dart';

abstract interface class ISessionRepository {
  UserRole? get pendingRole;
  Future<void> setPendingRole(UserRole role);
  Future<void> clearPendingRole();

  UserRole? get currentRole;
  Future<void> setCurrentRole(UserRole role);

  Future<void> clearCurrentRole();
}

class SessionRepository implements ISessionRepository {
  SessionRepository(this._hive);

  final HiveService _hive;

  static const _pendingRoleKey = 'pending_role';
  static const _currentRoleKey = 'current_role';

  @override
  UserRole? get pendingRole {
    final value = _hive.sessionBox.get(_pendingRoleKey) as String?;
    return value == null ? null : UserRole.fromString(value);
  }

  @override
  Future<void> setPendingRole(UserRole role) async {
    await _hive.sessionBox.put(_pendingRoleKey, role.value);
  }

  @override
  Future<void> clearPendingRole() async {
    await _hive.sessionBox.delete(_pendingRoleKey);
  }

  @override
  UserRole? get currentRole {
    final value = _hive.sessionBox.get(_currentRoleKey) as String?;
    return value == null ? null : UserRole.fromString(value);
  }

  @override
  Future<void> setCurrentRole(UserRole role) async {
    await _hive.sessionBox.put(_currentRoleKey, role.value);
  }

  @override
  Future<void> clearCurrentRole() async {
    await _hive.sessionBox.delete(_currentRoleKey);
  }
}
