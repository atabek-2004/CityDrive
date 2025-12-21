// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementDTOImpl _$$AchievementDTOImplFromJson(Map<String, dynamic> json) =>
    _$AchievementDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      colorHex: json['color_hex'] as String?,
      iconUrl: json['icon_url'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$AchievementDTOImplToJson(
        _$AchievementDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color_hex': instance.colorHex,
      'icon_url': instance.iconUrl,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
