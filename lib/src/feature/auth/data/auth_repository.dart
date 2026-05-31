import 'dart:convert';
import 'dart:io';

import 'package:city_drive/src/core/rest_client/models/basic_response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:city_drive/src/feature/auth/data/auth_remote_ds.dart';
import 'package:city_drive/src/feature/auth/database/auth_dao.dart';
import 'package:city_drive/src/feature/auth/models/common_dto.dart';
import 'package:city_drive/src/feature/auth/models/common_lists_dto.dart';
import 'package:city_drive/src/feature/auth/models/request/user_payload.dart';
import 'package:city_drive/src/feature/auth/models/user_dto.dart';

abstract interface class IAuthRepository {
  bool get isAuthenticated;

  UserDTO? get user;

  Future<List<Map<String, dynamic>>> getForceUpdateVersion();

  Future sendDeviceToken();

  Future registerVerify({
    required String phone,
    required String code,
  });

  Future<void> clearUser();

  // Forgot password API's
  Future forgotPasswordSmsSend({
    required String phone,
  });

  Future<String> forgotPasswordSmsCheck({
    required String phone,
    required String code,
  });

  Future forgotPasswordChangePassword({
    required String resetToken,
    required String password,
    required String passwordConf,
  });

  /// Auth
  Future<UserDTO> login({
    required String phone,
    required String password,
    String? deviceType,
  });

  Future<List<CommonDTO>> getCity();

  // Future registration1({
  //   required String name,
  //   required String surname,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required int cityId,
  //   File? avatar,
  //   String? deviceType,
  // });

  Future<UserDTO> registration({
    required String? fullName,
    required String? birthDate,
    required int? cityId,
    required String? phone,
    required String? password,
    required String? passwordConfirmation,
  });

  Future<CommonListsDTO> getRegisterFormOptions();

  // Future<int> registerSmsSend({
  //   required UserPayload payload,
  // });

  Future<UserDTO> registerSmsCheck({
    required String phone,
    required String code,
  });

  Future<BasicResponse> logout();
}

class AuthRepositoryImpl implements IAuthRepository {
  const AuthRepositoryImpl({
    required IAuthRemoteDS remoteDS,
    required IAuthDao authDao,
  })  : _remoteDS = remoteDS,
        _authDao = authDao;
  final IAuthRemoteDS _remoteDS;
  final IAuthDao _authDao;

  @override
  UserDTO? get user {
    try {
      final userStr = _authDao.user.value;
      if (userStr != null) {
        return UserDTO.fromJson(
          jsonDecode(userStr) as Map<String, dynamic>,
        );
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  bool get isAuthenticated => _authDao.user.value != null;

  // @override
  // Future registration1({
  //   required String name,
  //   required String surname,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required int cityId,
  //   File? avatar,
  //   String? deviceType,
  // }) async {
  //   final String? dv = _authDao.deviceToken.value;
  //   try {
  //     return await _remoteDS.registration1(
  //       name: name,
  //       surname: surname,
  //       phone: phone,
  //       email: email,
  //       password: password,
  //       cityId: cityId,
  //       avatar: avatar,
  //       deviceToken: dv,
  //       deviceType: deviceType,
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<UserDTO> registration({
    required String? fullName,
    required String? birthDate,
    required int? cityId,
    required String? phone,
    required String? password,
    required String? passwordConfirmation,
  }) async {
    try {
      final user = await _remoteDS.registration(
        fullName: fullName,
        birthDate: birthDate,
        cityId: cityId,
        phone: phone,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      await _authDao.user.setValue(jsonEncode(user.toJson()));
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> clearUser() async {
    try {
      await _authDao.user.remove();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getForceUpdateVersion() async {
    // TODO:
    return [
      {
        'key': 'force_update_version',
        'value': '1.0.0',
      },
      {
        'key': 'store_review_version',
        'value': '1.0.0',
      },
    ];
  }

  @override
  Future sendDeviceToken() async {
    try {
      final deviceToken = _authDao.deviceToken.value ??
          'device_token'; // await NotificationService.getUserId(_authDao);

      await _remoteDS.sendDeviceToken(deviceToken: deviceToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserDTO> login({
    required String phone,
    required String password,
    String? deviceType,
  }) async {
    final String? dv = _authDao.deviceToken.value;
    try {
      final user = await _remoteDS.login(
        phone: phone,
        password: password,
        deviceToken: dv,
        deviceType: deviceType,
      );

      await _authDao.user.setValue(jsonEncode(user.toJson()));

      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future forgotPasswordSmsSend({
    required String phone,
  }) async {
    try {
      return _remoteDS.forgotPasswordSmsSend(phone: phone);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> forgotPasswordSmsCheck({
    required String phone,
    required String code,
  }) async {
    try {
      return await _remoteDS.forgotPasswordSmsCheck(
        phone: phone,
        code: code,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CommonDTO>> getCity() async {
    try {
      final cities = await _remoteDS.getCity();
      return cities;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future forgotPasswordChangePassword({
    required String resetToken,
    required String password,
    required String passwordConf,
  }) async {
    try {
      return await _remoteDS.forgotPasswordChangePassword(
        resetToken: resetToken,
        password: password,
        passwordConf: passwordConf,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CommonListsDTO> getRegisterFormOptions() async {
    try {
      return _remoteDS.getRegisterFormOptions();
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<int> registerSmsSend({
  //   required UserPayload payload,
  // }) async {
  //   try {
  //     return _remoteDS.registerSmsSend(payload: payload);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<UserDTO> registerSmsCheck({
    required String phone,
    required String code,
  }) async {
    try {
      final user = await _remoteDS.registerSmsCheck(phone: phone, code: code);

      await _authDao.user.setValue(jsonEncode(user.toJson()));

      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future registerVerify({required String phone, required String code}) async {
    try {
      return _remoteDS.registerVerify(
        phone: phone,
        code: code,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BasicResponse> logout() async {
    try {
      return await _remoteDS.logout();
    } catch (e) {
      rethrow;
    }
  }
}
