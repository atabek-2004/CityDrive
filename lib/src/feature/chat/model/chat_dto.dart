// // ignore_for_file: invalid_annotation_target

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'chat_dto.g.dart';
// part 'chat_dto.freezed.dart';

// @freezed
// class ChatDTO with _$ChatDTO {
//   const factory ChatDTO({
//     int? id,
//     String? name,
//     // @JsonKey(name: 'user_id') int? partnerId,
//     String? avatar,
//     @JsonKey(name: 'user_id') int? userId,
//     @JsonKey(name: 'unread_count') int? unreadCount,
//     @JsonKey(name: 'latest_message') String? latestMessage,
//     // @JsonKey(name: 'my_userable_id') int? myUserableId,
//     @JsonKey(name: 'created_at') DateTime? createdAt,
//   }) = _ChatDTO;

//   factory ChatDTO.fromJson(Map<String, dynamic> json) => _$ChatDTOFromJson(json);
// }

// @freezed
// class ImagesDTO with _$ImagesDTO {
//   const factory ImagesDTO({
//     int? id,
//     @JsonKey(name: 'product_id') int? productId,
//     String? image,
//     String? name,
//     @JsonKey(name: 'created_at') DateTime? createdAt,
//     @JsonKey(name: 'updated_at') DateTime? updatedAt,
//     String? path,
//     String? type,
//   }) = _ImagesDTO;

//   factory ImagesDTO.fromJson(Map<String, dynamic> json) => _$ImagesDTOFromJson(json);
// }

// @freezed
// class PhotoDTO with _$PhotoDTO {
//   const factory PhotoDTO({
//     int? id,
//     @JsonKey(name: 'review_id') int? reviewId,
//     String? image,
//   }) = _PhotoDTO;

//   factory PhotoDTO.fromJson(Map<String, dynamic> json) => _$PhotoDTOFromJson(json);
// }

