// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'child_dto.freezed.dart';
part 'child_dto.g.dart';

@freezed
class ChildDTO with _$ChildDTO {
  const factory ChildDTO({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'birth_date') String? birthDate,
    String? gender,
    @JsonKey(name: 'photo_path') String? photoPath,
    int? verified,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ChildDTO;
  factory ChildDTO.fromJson(Map<String, dynamic> json) =>
      _$ChildDTOFromJson(json);
}
