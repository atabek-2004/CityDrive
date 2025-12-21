// import 'package:image_picker/image_picker.dart';
// import 'package:ikidz/src/core/rest_client/models/basic_response.dart';
// import 'package:ikidz/src/feature/chat/data/chat_remote_ds.dart';
// import 'package:ikidz/src/feature/chat/model/chat_dto.dart';
// import 'package:ikidz/src/feature/chat/model/message_dto.dart';

// abstract interface class IChatRepository {
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

// class ChatRepositoryImpl implements IChatRepository {
//   const ChatRepositoryImpl({
//     required IChatRemoteDS remoteDS,
//   }) : _remoteDS = remoteDS;
//   final IChatRemoteDS _remoteDS;

//   @override
//   Future<List<ChatDTO>> chatList({String? search}) async {
//     try {
//       return await _remoteDS.chatList(search: search);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<List<MessageDTO>> chatDetailMessages({required int chatId}) async {
//     try {
//       return await _remoteDS.chatDetailMessages(chatId: chatId);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<List<PhotoDTO>> chatUploadImage({List<XFile>? images}) async {
//     try {
//       return await _remoteDS.chatUploadImage(images: images);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
