import 'package:flutter/foundation.dart';
import 'package:ikidz/src/core/rest_client/models/basic_response.dart';
import 'package:ikidz/src/feature/auth/models/subscription_dto.dart';
import 'package:ikidz/src/core/rest_client/src/dio_rest_client/rest_client_dio.dart';
import 'package:ikidz/src/core/utils/talker_logger_util.dart';
import 'package:ikidz/src/feature/auth/models/common_dto.dart';
import 'package:ikidz/src/feature/auth/models/common_lists_dto.dart';
import 'package:ikidz/src/feature/auth/models/user_dto.dart';

abstract interface class IAuthRemoteDS {
  // Future registration1({
  //   required String name,
  //   required String surname,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required int cityId,
  //   File? avatar,
  //   String? deviceToken,
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

  Future<UserDTO> login({
    required String phone,
    required String password,
    String? deviceToken,
    String? deviceType,
  });

  Future<List<CommonDTO>> getCity();

  Future<CommonListsDTO> getRegisterFormOptions();

  // Future<int> registerSmsSend({
  //   required UserPayload payload,
  // });

  Future<UserDTO> registerSmsCheck({
    required String phone,
    required String code,
  });

  // Forgot password
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

  //
  Future sendDeviceToken({
    required String deviceToken,
  });

  // Subscription
  Future<List<SubscriptionDTO>> getSubscriptions();

  Future registerVerify({
    required String phone,
    required String code,
  });

  Future<BasicResponse> logout();
}

class AuthRemoteDSImpl implements IAuthRemoteDS {
  const AuthRemoteDSImpl({
    required this.restClient,
  });
  final IRestClient restClient;

  @override
  Future<UserDTO> login({
    required String phone,
    required String password,
    String? deviceToken,
    String? deviceType,
  }) async {
    try {
      final Map<String, dynamic> response = await restClient.post(
        'login',
        body: {
          'phone': phone,
          'password': password,
          if (deviceToken != null) 'device_token': deviceToken,
          if (deviceType != null) 'device_type': deviceType,
        },
      );

      return UserDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#login - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<List<CommonDTO>> getCity() async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        '/cities',
        queryParams: {},
      );

      if (response['data'] == null) {
        throw Exception();
      }
      final list = await compute<List<dynamic>, List<CommonDTO>>(
        (list) => list
            .map(
              (e) => CommonDTO.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        response['data'] as List,
      );
      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#getAddressList - $e', e, st);
      rethrow;
    }
  }

  // @override
  // Future<UserDTO> registration1({
  //   required String name,
  //   required String surname,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required int cityId,
  //   File? avatar,
  //   String? deviceToken,
  //   String? deviceType,
  // }) async {
  //   try {
  //     final UserPayload userPayload = UserPayload(
  //       name: name,
  //       surname: surname,
  //       phone: phone,
  //       email: email,
  //       password: password,
  //       cityId: cityId,
  //       deviceToken: deviceToken,
  //       deviceType: deviceType,
  //     );

  //     final FormData formData = FormData.fromMap(userPayload.toJson());
  //     if (avatar != null) {
  //       //  log(photo.length.toString());

  //       formData.files.add(
  //         MapEntry(
  //           'avatar',
  //           await MultipartFile.fromFile(avatar.path),
  //         ),
  //       );
  //     }
  //     final Map<String, dynamic> response = await restClient.post(
  //       '/partner/auth/register',
  //       body: formData,
  //     );

  //     return UserDTO.fromJson(response);
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#login - $e', e, st);
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
      final Map<String, dynamic> response = await restClient.post(
        'register',
        body: {
          'full_name': fullName,
          'birth_date': birthDate,
          'city_id': cityId,
          'phone': phone,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

      return UserDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#registration - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<CommonListsDTO> getRegisterFormOptions() async {
    try {
      final Map<String, dynamic> response =
          await restClient.get('/v1/auth/register');

      return CommonListsDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#getRegisterFormOptions - $e', e, st);
      rethrow;
    }
  }

  @override
  Future sendDeviceToken({
    required String deviceToken,
  }) async {
    try {
      await restClient.get(
        '/partner/orders/edit_device_token',
        queryParams: {
          'device_token': deviceToken,
        },
      );
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#sendDeviceToken - $e', e, st);
      rethrow;
    }
  }

  @override
  Future forgotPasswordSmsSend({
    required String phone,
  }) async {
    try {
      await restClient.post(
        'send-reset-code',
        body: {
          'phone': phone,
        },
      );
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#forgotPasswordSmsSend - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<String> forgotPasswordSmsCheck({
    required String phone,
    required String code,
  }) async {
    try {
      final result = await restClient.post(
        'verify-reset-code',
        body: {
          'phone': phone,
          'code': code,
        },
      ) as Map<String, dynamic>;

      return result['reset_token'];
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#forgotPasswordSmsSend - $e', e, st);
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
      await restClient.post(
        'reset-password',
        body: {
          'reset_token': resetToken,
          'password': password,
          'password_confirmation': passwordConf,
        },
      );
    } catch (e, st) {
      TalkerLoggerUtil.talker
          .error('#forgotPasswordChangePassword - $e', e, st);
      rethrow;
    }
  }

  // @override
  // Future<int> registerSmsSend({
  //   required UserPayload payload,
  // }) async {
  //   try {
  //     final Map<String, dynamic> response = await restClient.post(
  //       '/v1/auth/register/sms/send',
  //       body: payload.toJson(),
  //     );

  //     final int? smsDelay = response['sms_delay'] as int?;

  //     if (smsDelay != null) {
  //       return smsDelay;
  //     } else {
  //       throw WrongResponseTypeException(
  //         message: '''Unexpected response body type: ${response.runtimeType}\n$response''',
  //       );
  //     }
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#registerSmsSend - $e', e, st);
  //     rethrow;
  //   }
  // }

  @override
  Future<UserDTO> registerSmsCheck({
    required String phone,
    required String code,
  }) async {
    try {
      final Map<String, dynamic> response = await restClient.post(
        '/v1/auth/register/sms/check',
        body: {
          'phone': phone,
          'code': code,
        },
      );

      if (response['user'] == null || response['token'] == null) {
        return throw WrongResponseTypeException(
          message:
              '''Unexpected response body type: ${response.runtimeType}\n$response''',
        );
      }

      if (response case {'token': final Map<String, Object?> tokenObject}) {
        final accessToken = tokenObject['token'];

        if (accessToken == null) {
          return throw WrongResponseTypeException(
            message:
                '''Unexpected response body type: ${response.runtimeType}\n$response''',
          );
        }

        final user =
            UserDTO.fromJson(response['user']! as Map<String, dynamic>);

        return user;
      } else {
        throw WrongResponseTypeException(
          message:
              '''Unexpected response body type: ${response.runtimeType}\n$response''',
        );
      }
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#login - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<List<SubscriptionDTO>> getSubscriptions() async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'subscriptions',
        queryParams: {},
      );

      if (response['data'] == null) {
        throw Exception('No data field in response');
      }

      final List<dynamic> dataList = response['data'];

      final list = dataList
          .map((e) => SubscriptionDTO.fromJson(e as Map<String, dynamic>))
          .toList();

      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#getSubscriptions - $e', e, st);
      rethrow;
    }
  }

  @override
  Future registerVerify({required String phone, required String code}) async {
    try {
      await restClient.post(
        '/register/verify',
        body: {
          'phone': phone,
          'code': code,
        },
      );
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#registerVerify - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<BasicResponse> logout() async {
    try {
      final Map<String, dynamic> response =
          await restClient.post('logout', body: null);

      return BasicResponse.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#logout - $e', e, st);
      rethrow;
    }
  }
}
