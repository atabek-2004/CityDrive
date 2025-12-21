// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ikidz/src/core/rest_client/models/basic_response.dart';
// import 'package:ikidz/src/core/rest_client/rest_client.dart';
// import 'package:ikidz/src/core/utils/talker_logger_util.dart';
// import 'package:ikidz/src/feature/chat/model/chat_dto.dart';
// import 'package:ikidz/src/feature/chat/model/message_dto.dart';

// abstract interface class IChatRemoteDS {
//   Future<List<ChatDTO>> chatList({
//     String? search,
//   });

//   Future<List<MessageDTO>> chatDetailMessages({
//     required int chatId,
//   });

//   Future<List<PhotoDTO>> chatUploadImage({
//     List<XFile>? images,
//   });
// }

// class ChatRemoteDSImpl implements IChatRemoteDS {
//   const ChatRemoteDSImpl({
//     required this.restClient,
//   });
//   final IRestClient restClient;

//   @override
//   Future<List<ChatDTO>> chatList({String? search}) async {
//     try {
//       final Map<String, dynamic> response = await restClient.get(
//         '/partner/chat',
//         queryParams: {
//           if (search != null) 'search': search,
//         },
//       );

//       if (response['data'] == null) {
//         throw Exception();
//       }
//       final list = await compute<List<dynamic>, List<ChatDTO>>(
//         (list) => list
//             .map(
//               (e) => ChatDTO.fromJson(e as Map<String, dynamic>),
//             )
//             .toList(),
//         response['data'] as List,
//       );
//       return list;
//     } catch (e, st) {
//       TalkerLoggerUtil.talker.error('#getChatList - $e', e, st);
//       rethrow;
//     }
//   }

//   @override
//   Future<List<MessageDTO>> chatDetailMessages({required int chatId}) async {
//     try {
//       final Map<String, dynamic> response = await restClient.get(
//         '/partner/chat/$chatId',
//         queryParams: {},
//       );

//       if (response['data'] == null) {
//         throw Exception();
//       }
//       final list = await compute<List<dynamic>, List<MessageDTO>>(
//         (list) => list
//             .map(
//               (e) => MessageDTO.fromJson(e as Map<String, dynamic>),
//             )
//             .toList(),
//         response['data'] as List,
//       );
//       return list;
//     } catch (e, st) {
//       TalkerLoggerUtil.talker.error('#getChatDetailMessages - $e', e, st);
//       rethrow;
//     }
//   }

//   @override
//   Future<List<PhotoDTO>> chatUploadImage({List<XFile>? images}) async {
//     try {
//       final FormData formData = FormData.fromMap({});
//       if (images != null && images.isNotEmpty) {
//         for (int i = 0; i < images.length; i++) {
//           formData.files.add(
//             MapEntry(
//               'images[]',
//               await MultipartFile.fromFile(images[i].path),
//             ),
//           );
//         }
//       }

//       final Map<String, dynamic> response = await restClient.post(
//         '/upload_file',
//         body: formData,
//       );
//       if (response['data'] == null) {
//         throw Exception();
//       }
//       final list = await compute<List<dynamic>, List<PhotoDTO>>(
//         (list) => list
//             .map(
//               (e) => PhotoDTO.fromJson(e as Map<String, dynamic>),
//             )
//             .toList(),
//         response['data'] as List,
//       );

//       return list;
//     } catch (e, st) {
//       TalkerLoggerUtil.talker.error('#chatUploadImage - $e', e, st);
//       rethrow;
//     }
//   }
// }
