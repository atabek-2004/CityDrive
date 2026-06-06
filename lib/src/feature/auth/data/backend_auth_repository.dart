import 'dart:convert';

import 'package:city_drive/src/core/data/session_repository.dart';
import 'package:city_drive/src/core/local_storage/user_role.dart';
import 'package:city_drive/src/core/rest_client/models/basic_response.dart';
import 'package:city_drive/src/core/utils/phone_util.dart';
import 'package:city_drive/src/feature/auth/data/api_login_result.dart';
import 'package:city_drive/src/feature/auth/data/company_repository.dart';
import 'package:city_drive/src/feature/auth/data/auth_remote_ds.dart';
import 'package:city_drive/src/feature/auth/data/auth_repository.dart';
import 'package:city_drive/src/feature/auth/database/auth_dao.dart';
import 'package:city_drive/src/feature/auth/models/common_dto.dart';
import 'package:city_drive/src/feature/auth/models/common_lists_dto.dart';
import 'package:city_drive/src/feature/auth/models/company_dto.dart';
import 'package:city_drive/src/feature/auth/models/user_dto.dart';

/// Auth via Spring Boot API (`POST /api/auth/login`).
class BackendAuthRepository implements IAuthRepository {
  BackendAuthRepository({
    required IAuthRemoteDS remoteDS,
    required IAuthDao authDao,
    required ISessionRepository sessionRepository,
    required ICompanyRepository companyRepository,
  })  : _remoteDS = remoteDS,
        _authDao = authDao,
        _session = sessionRepository,
        _companyRepository = companyRepository;

  final IAuthRemoteDS _remoteDS;
  final IAuthDao _authDao;
  final ISessionRepository _session;
  final ICompanyRepository _companyRepository;

  @override
  UserDTO? get user {
    try {
      final userStr = _authDao.user.value;
      if (userStr != null) {
        return UserDTO.fromJson(jsonDecode(userStr) as Map<String, dynamic>);
      }
    } catch (_) {}
    return null;
  }

  @override
  bool get isAuthenticated => _authDao.user.value != null;

  @override
  bool get isApproved {
    try {
      final userStr = _authDao.user.value;
      if (userStr == null) return false;
      final map = jsonDecode(userStr) as Map<String, dynamic>;
      return map['_isApproved'] as bool? ?? true;
    } catch (_) {
      return true;
    }
  }

  Future<void> _updateIsApproved(bool isApproved) async {
    final userStr = _authDao.user.value;
    if (userStr == null) return;
    final stored = Map<String, dynamic>.from(
      jsonDecode(userStr) as Map<String, dynamic>,
    )..['_isApproved'] = isApproved;
    await _authDao.user.setValue(jsonEncode(stored));
  }

  @override
  Future<ApprovalStatusDTO> fetchApprovalStatus() async {
    final status = await _companyRepository.getApprovalStatus();
    await _updateIsApproved(status.isApproved);
    return status;
  }

  Future<void> restoreSessionRole() async {
    final roleName = _authDao.user.value != null
        ? (jsonDecode(_authDao.user.value!) as Map<String, dynamic>)['_role']
            as String?
        : null;
    if (roleName != null) {
      await _session.setCurrentRole(UserRole.fromString(roleName));
    }
  }

  @override
  Future<UserDTO> login({
    required String phone,
    required String password,
    String? deviceType,
  }) async {
    final result = await _remoteDS.login(
      phone: PhoneUtil.normalize(phone),
      password: password,
    );
    return _persistSession(result);
  }

  Future<UserDTO> _persistSession(ApiLoginResult result) async {
    final role = UserRole.fromString(result.role);
    final stored = Map<String, dynamic>.from(result.user.toJson())
      ..['_role'] = role.value
      ..['_isApproved'] = result.isApproved;

    await _authDao.user.setValue(jsonEncode(stored));
    await _session.setCurrentRole(role);
    await _session.clearPendingRole();

    return result.user;
  }

  @override
  Future<void> clearUser() async {
    await _authDao.user.remove();
    await _session.clearCurrentRole();
  }

  @override
  Future<void> updateStoredUser(UserDTO user) async {
    final userStr = _authDao.user.value;
    String? token = user.token;
    String? role;
    bool isApproved = true;

    if (userStr != null) {
      final stored = jsonDecode(userStr) as Map<String, dynamic>;
      token ??= stored['token'] as String?;
      role = stored['_role'] as String?;
      isApproved = stored['_isApproved'] as bool? ?? true;
    }

    final merged = Map<String, dynamic>.from(user.toJson())
      ..['token'] = token
      ..['_role'] = role
      ..['_isApproved'] = isApproved;

    await _authDao.user.setValue(jsonEncode(merged));
  }

  @override
  Future<List<Map<String, dynamic>>> getForceUpdateVersion() async => [
        {'key': 'force_update_version', 'value': '1.0.0'},
      ];

  @override
  Future sendDeviceToken() async {}

  @override
  Future<UserDTO> registration({
    required String? fullName,
    required String? birthDate,
    required int? cityId,
    required String? phone,
    required String? password,
    required String? passwordConfirmation,
    String? role,
  }) async {
    final normalizedPhone =
        phone != null ? PhoneUtil.normalize(phone) : null;
    return _remoteDS.registration(
      fullName: fullName,
      birthDate: birthDate,
      cityId: cityId,
      phone: normalizedPhone,
      password: password,
      passwordConfirmation: passwordConfirmation,
      role: role,
    );
  }

  @override
  Future<CommonListsDTO> getRegisterFormOptions() async {
    throw UnsupportedError('Register form options not on backend');
  }

  @override
  Future registerVerify({
    required String phone,
    required String code,
  }) async {
    final result = await _remoteDS.registerVerify(
      phone: PhoneUtil.normalize(phone),
      code: code,
    );
    await _persistSession(result);
  }

  @override
  Future<UserDTO> registerSmsCheck({
    required String phone,
    required String code,
  }) async {
    throw UnsupportedError('SMS registration not wired to API yet');
  }

  @override
  Future<BasicResponse> logout() async {
    await clearUser();
    return const BasicResponse(message: 'ok');
  }

  @override
  Future forgotPasswordSmsSend({required String phone}) async {
    throw UnsupportedError('Not implemented');
  }

  @override
  Future<String> forgotPasswordSmsCheck({
    required String phone,
    required String code,
  }) async {
    throw UnsupportedError('Not implemented');
  }

  @override
  Future forgotPasswordChangePassword({
    required String resetToken,
    required String password,
    required String passwordConf,
  }) async {
    throw UnsupportedError('Not implemented');
  }

  @override
  Future<List<CommonDTO>> getCity() async => [];
}
