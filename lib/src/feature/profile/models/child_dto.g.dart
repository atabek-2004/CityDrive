// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChildDTOImpl _$$ChildDTOImplFromJson(Map<String, dynamic> json) =>
    _$ChildDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      birthDate: json['birth_date'] as String?,
      gender: json['gender'] as String?,
      photoPath: json['photo_path'] as String?,
      verified: (json['verified'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$ChildDTOImplToJson(_$ChildDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'full_name': instance.fullName,
      'birth_date': instance.birthDate,
      'gender': instance.gender,
      'photo_path': instance.photoPath,
      'verified': instance.verified,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
