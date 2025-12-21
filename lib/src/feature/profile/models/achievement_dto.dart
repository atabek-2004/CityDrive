// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_dto.freezed.dart';
part 'achievement_dto.g.dart';

@freezed
class AchievementDTO with _$AchievementDTO {
  const factory AchievementDTO({
    int? id,
    String? name,
    @JsonKey(name: 'color_hex') String? colorHex,
    @JsonKey(name: 'icon_url') String? iconUrl,
    @JsonKey(name: 'is_active') int? isActive,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _AchievementDTO;

  factory AchievementDTO.fromJson(Map<String, dynamic> json) =>
      _$AchievementDTOFromJson(json);
}
