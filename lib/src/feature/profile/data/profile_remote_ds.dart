import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ikidz/src/core/rest_client/models/basic_response.dart';
import 'package:ikidz/src/core/rest_client/rest_client.dart';
import 'package:ikidz/src/core/utils/talker_logger_util.dart';
import 'package:ikidz/src/feature/auth/models/common_dto.dart';
import 'package:ikidz/src/feature/auth/models/request/child_payload.dart';
import 'package:ikidz/src/feature/auth/models/request/user_payload.dart';
import 'package:ikidz/src/feature/auth/models/user_dto.dart';
import 'package:ikidz/src/feature/profile/models/child_dto.dart';
import 'package:ikidz/src/feature/profile/models/document_dto.dart';
import 'package:image_picker/image_picker.dart';

abstract interface class IProfileRemoteDS {
  // profile data
  Future<UserDTO> profileData();

  Future<List<CommonDTO>> cityList();

  Future<List<DocumentDTO>> getDocuments();

  // // balance transfers
  // Future<List<BalanceDTO>> getBalanceTransfer({required String type});

  // // achievements
  // Future<List<AchievementDTO>> getAchievementList();

  // // edit profile
  Future<UserDTO> editAccount({
    required UserPayload userPayload,
    XFile? avatar,
  });

  // // delete account
  Future<BasicResponse> deleteAccount();

  Future<BasicResponse> logOut();

  Future<List<ChildDTO>> myChildren();

  Future<ChildDTO> addChild({
    required ChildPayload payload,
    XFile? photoPath,
  });

  // ///
  // /// `diagnostics`
  // ///
  // // available
  // Future<AvailableDiagnosticsDTO> availableDiagnostic();

  // // history
  // Future<List<DiagnosticsAIDTO>> historyDiagnostics(
  //     {required int participantId});

  // // begin test
  // Future<List<DiagnosticsQuestionsDTO>> beginDiagnostics(
  //     {required int page});

  // // complete test
  // Future<DiagnosticsAIDTO> completeDiagnostics(
  //     {required List<int> selectedImageIds});
}

class ProfileRemoteDSImpl implements IProfileRemoteDS {
  const ProfileRemoteDSImpl({
    required this.restClient,
  });
  final IRestClient restClient;

  @override
  Future<UserDTO> profileData() async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        '/profile',
        queryParams: {},
      );

      return UserDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#getProfile - $e', e, st);
      rethrow;
    }
  }

  // @override
  // Future<List<BalanceDTO>> getBalanceTransfer({required String type}) async {
  //   try {
  //     final Map<String, dynamic> response = await restClient.get(
  //       '/wallet/history',
  //       queryParams: {'type': type},
  //     );
  //     final list = await compute<List<dynamic>, List<BalanceDTO>>(
  //       (list) => list
  //           .map(
  //             (e) => BalanceDTO.fromJson(e as Map<String, dynamic>),
  //           )
  //           .toList(),
  //       response['data'] as List,
  //     );
  //     return list;
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#getBalanceTransfer - $e', e, st);
  //     rethrow;
  //   }
  // }

  @override
  Future<BasicResponse> deleteAccount() async {
    try {
      final Map<String, dynamic> response = await restClient.delete(
        '/profile',
      );

      return BasicResponse.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#deleteAccount - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<List<CommonDTO>> cityList() async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'cities',
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
      TalkerLoggerUtil.talker.error('#getCityList - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<UserDTO> editAccount({
    required UserPayload userPayload,
    XFile? avatar,
  }) async {
    try {
      final FormData formData = FormData.fromMap(userPayload.toJson());
      if (avatar != null) {
        formData.files.add(
            MapEntry('avatar_url', await MultipartFile.fromFile(avatar.path)));
      }

      final Map<String, dynamic> response = await restClient.post(
        'profile',
        body: formData,
      );

      return UserDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#editAccount - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<BasicResponse> logOut() async {
    try {
      final Map<String, dynamic> response =
          await restClient.post('/auth/logout', body: null);

      return BasicResponse.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#logout - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<List<ChildDTO>> myChildren() async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'children/my',
        queryParams: {},
      );

      if (response['data'] == null) {
        throw Exception();
      }
      final list = await compute<List<dynamic>, List<ChildDTO>>(
        (list) => list
            .map(
              (e) => ChildDTO.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        response['data'] as List,
      );
      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#myChildren - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<ChildDTO> addChild({
    required ChildPayload payload,
    XFile? photoPath,
  }) async {
    try {
      final FormData formData = FormData.fromMap(payload.toJson());
      if (photoPath != null) {
        formData.files.add(MapEntry(
            'photo_path', await MultipartFile.fromFile(photoPath.path)));
      }

      final Map<String, dynamic> response = await restClient.post(
        'children',
        body: formData,
      );

      return ChildDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#addChild - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<List<DocumentDTO>> getDocuments() async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        'documents',
        queryParams: {},
      );
      final list = await compute<List<dynamic>, List<DocumentDTO>>(
        (list) => list
            .map(
              (e) => DocumentDTO.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        response['data'] as List,
      );
      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#getDocuments - $e', e, st);
      rethrow;
    }
  }

  // @override
  // Future<List<AchievementDTO>> getAchievementList() async {
  // try {
  //   final Map<String, dynamic> response = await restClient.get(
  //     '/achievements',
  //     queryParams: {},
  //   );

  //   if (response['data'] == null) {
  //     throw Exception();
  //   }
  //   final list = await compute<List<dynamic>, List<AchievementDTO>>(
  //     (list) => list
  //         .map(
  //           (e) => AchievementDTO.fromJson(e as Map<String, dynamic>),
  //         )
  //         .toList(),
  //     response['data'] as List,
  //   );
  //   return list;
  // } catch (e, st) {
  //   TalkerLoggerUtil.talker.error('#getAchievementList - $e', e, st);
  //   rethrow;
  // }
  // }

  // @override
  // Future<AvailableDiagnosticsDTO> availableDiagnostic() async {
  //   try {
  //     final Map<String, dynamic> response = await restClient.get(
  //       '/diagnostics/available',
  //       queryParams: {},
  //     );

  //     return AvailableDiagnosticsDTO.fromJson(response);
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#availableDiagnostic - $e', e, st);
  //     rethrow;
  //   }
  // }

  // @override
  // Future<List<DiagnosticsAIDTO>> historyDiagnostics({required int participantId})async {
  //   try {
  //     final Map<String, dynamic> response = await restClient.get(
  //       '/diagnostics/history',
  //       queryParams: {},
  //     );

  //     if (response['data'] == null) {
  //       throw Exception();
  //     }
  //     final list = await compute<List<dynamic>, List<DiagnosticsAIDTO>>(
  //       (list) => list
  //           .map(
  //             (e) => DiagnosticsAIDTO.fromJson(e as Map<String, dynamic>),
  //           )
  //           .toList(),
  //       response['data'] as List,
  //     );
  //     return list;
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#historyDiagnostics - $e', e, st);
  //     rethrow;
  //   }
  // }

  // @override
  // Future<List<DiagnosticsQuestionsDTO>> beginDiagnostics({required int page})async  {
  //   try {
  //     final Map<String, dynamic> response = await restClient.get(
  //       '/diagnostics/questions',
  //       queryParams: {'page': page},
  //     );

  //     if (response['data'] == null) {
  //       throw Exception();
  //     }
  //     final list = await compute<List<dynamic>, List<DiagnosticsQuestionsDTO>>(
  //       (list) => list
  //           .map(
  //             (e) => DiagnosticsQuestionsDTO.fromJson(e as Map<String, dynamic>),
  //           )
  //           .toList(),
  //       response['data'] as List,
  //     );
  //     return list;
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#beginDiagnostics - $e', e, st);
  //     rethrow;
  //   }
  // }

  // @override
  // Future<DiagnosticsAIDTO> completeDiagnostics({required List<int> selectedImageIds}) async {
  //   try {
  //     final Map<String, dynamic> response = await restClient.post(
  //       '/diagnostics/finish',
  //       body: {'selected_image_ids': selectedImageIds},
  //     );

  //     return DiagnosticsAIDTO.fromJson(response);
  //   } catch (e, st) {
  //     TalkerLoggerUtil.talker.error('#completeDiagnostics - $e', e, st);
  //     rethrow;
  //   }
  // }
}
