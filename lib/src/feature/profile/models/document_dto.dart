// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_dto.freezed.dart';
part 'document_dto.g.dart';

@freezed
class DocumentDTO with _$DocumentDTO {
  const factory DocumentDTO({
    int? id,
    String? title,
    String? content,
    String? type,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _DocumentDTO;
  factory DocumentDTO.fromJson(Map<String, dynamic> json) =>
      _$DocumentDTOFromJson(json);
}
