import 'dart:convert';

import 'package:city_drive/src/core/data/session_repository.dart';
import 'package:city_drive/src/core/local_storage/hive_service.dart';
import 'package:city_drive/src/core/local_storage/models/company_entity.dart';
import 'package:city_drive/src/core/local_storage/models/local_user.dart';
import 'package:city_drive/src/core/local_storage/user_role.dart';
import 'package:city_drive/src/core/rest_client/models/basic_response.dart';
import 'package:city_drive/src/core/utils/phone_util.dart';
import 'package:city_drive/src/feature/auth/data/auth_repository.dart';
import 'package:city_drive/src/feature/auth/data/local_auth_data_source.dart';
import 'package:city_drive/src/feature/auth/database/auth_dao.dart';
import 'package:city_drive/src/feature/auth/models/common_dto.dart';
import 'package:city_drive/src/feature/auth/models/common_lists_dto.dart';
import 'package:city_drive/src/feature/auth/models/user_dto.dart';

/// Полностью локальная авторизация через Hive.
class LocalAuthRepository implements IAuthRepository {
  LocalAuthRepository({
    required IAuthDao authDao,
    required LocalAuthDataSource localDS,
    required ISessionRepository sessionRepository,
    required HiveService hiveService,
  })  : _authDao = authDao,
        _localDS = localDS,
        _session = sessionRepository,
        _hive = hiveService;

  final IAuthDao _authDao;
  final LocalAuthDataSource _localDS;
  final ISessionRepository _session;
  final HiveService _hive;

  static const _localSmsCode = '1111';

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

  Future<void> restoreSessionRole() async {
    final current = user;
    if (current?.id == null) return;
    final local = await _localDS.findById(current!.id!);
    if (local != null) {
      await _session.setCurrentRole(local.role);
    }
  }

  UserDTO _toDto(LocalUser local, {String? password, String? birthDate}) =>
      UserDTO(
        id: local.id,
        fullName: local.fullName,
        phone: local.phone,
        cityId: local.cityId,
        password: password,
        token: 'local_${local.id}',
        birthDate: birthDate,
      );

  Future<void> _persistUser(LocalUser localUser) async {
    await _authDao.user.setValue(jsonEncode(_toDto(localUser).toJson()));
    await _session.setCurrentRole(localUser.role);
    await _session.clearPendingRole();
  }

  UserRole _roleForRegistration() =>
      _session.pendingRole ?? UserRole.resident;

  @override
  Future<UserDTO> login({
    required String phone,
    required String password,
    String? deviceType,
  }) async {
    final found = await _localDS.findByPhone(phone);
    if (found == null) {
      throw Exception('Пользователь не найден. Сначала зарегистрируйтесь.');
    }
    if (found.password != password) {
      throw Exception('Неверный пароль');
    }
    await _persistUser(found);
    return user!;
  }

  /// Создаёт пользователя в Hive, сессию не открывает — вход после SMS.
  @override
  Future<UserDTO> registration({
    required String? fullName,
    required String? birthDate,
    required int? cityId,
    required String? phone,
    required String? password,
    required String? passwordConfirmation,
  }) async {
    if (phone == null || phone.isEmpty) {
      throw Exception('Укажите номер телефона');
    }
    if (password == null || password.isEmpty) {
      throw Exception('Укажите пароль');
    }
    if (password != passwordConfirmation) {
      throw Exception('Пароли не совпадают');
    }

    final localUser = await _localDS.createUser(
      phone: phone,
      password: password,
      fullName: fullName ?? 'Пользователь',
      role: _roleForRegistration(),
      cityId: cityId,
    );

    return _toDto(
      localUser,
      password: password,
      birthDate: birthDate,
    );
  }

  /// Локальный SMS: код 1111 или любой 4+ цифры.
  @override
  Future registerVerify({
    required String phone,
    required String code,
  }) async {
    if (code.trim().length < 4) {
      throw Exception('Введите код из SMS (минимум 4 цифры)');
    }

    final normalized = PhoneUtil.normalize(phone);
    final localUser = await _localDS.findByPhone(normalized);
    if (localUser == null) {
      throw Exception('Сначала заполните форму регистрации');
    }

    await _persistUser(localUser);
  }

  @override
  Future<UserDTO> registerSmsCheck({
    required String phone,
    required String code,
  }) async {
    await registerVerify(phone: phone, code: code);
    return user!;
  }

  @override
  Future<void> clearUser() async {
    await _authDao.user.remove();
    await _session.clearCurrentRole();
  }

  @override
  Future<List<Map<String, dynamic>>> getForceUpdateVersion() async => [
        {'key': 'force_update_version', 'value': '1.0.0'},
        {'key': 'store_review_version', 'value': '1.0.0'},
      ];

  @override
  Future sendDeviceToken() async {}

  @override
  Future<List<CommonDTO>> getCity() async => _localDS.cities;

  @override
  Future<CommonListsDTO> getRegisterFormOptions() async =>
      _localDS.registerFormOptions;

  @override
  Future forgotPasswordSmsSend({required String phone}) async {
    final found = await _localDS.findByPhone(phone);
    if (found == null) {
      throw Exception('Пользователь с таким номером не найден');
    }
  }

  @override
  Future<String> forgotPasswordSmsCheck({
    required String phone,
    required String code,
  }) async {
    if (code.trim().length < 4) {
      throw Exception('Введите код из SMS');
    }
    final found = await _localDS.findByPhone(phone);
    if (found == null) {
      throw Exception('Пользователь не найден');
    }
    return 'local_reset_${found.id}';
  }

  @override
  Future forgotPasswordChangePassword({
    required String resetToken,
    required String password,
    required String passwordConf,
  }) async {
    if (password != passwordConf) {
      throw Exception('Пароли не совпадают');
    }
    final idStr = resetToken.replaceFirst('local_reset_', '');
    final id = int.tryParse(idStr);
    if (id == null) throw Exception('Недействительный токен');

    final local = await _localDS.findById(id);
    if (local == null) throw Exception('Пользователь не найден');

    await _localDS.updateUser(local.copyWith(password: password));
  }

  @override
  Future<BasicResponse> logout() async {
    await clearUser();
    return const BasicResponse(statusCode: 200, message: 'ok');
  }

  Future<void> saveCompany({
    required int userId,
    required String name,
    required String bin,
    required String address,
    required String foundedYear,
  }) async {
    final entity = CompanyEntity(
      userId: userId,
      name: name,
      bin: bin,
      address: address,
      foundedYear: foundedYear,
      createdAt: DateTime.now(),
    );
    await _hive.companiesBox.put(userId, entity.toJson());
  }

  /// Подсказка для экрана SMS в dev-режиме.
  String get devSmsHint => 'Локальный код: $_localSmsCode (или любые 4+ цифры)';
}
