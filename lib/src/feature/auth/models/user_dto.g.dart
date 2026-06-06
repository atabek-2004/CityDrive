// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDTOImpl _$$UserDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserDTOImpl(
      message: json['message'] as String?,
      lang: json['lang'] as String?,
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      birthDate: json['birth_date'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
      cityId: (json['city_id'] as num?)?.toInt(),
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      token: json['token'] as String?,
      role: json['role'] as String?,
      isApproved: json['isApproved'] as bool?,
      deviceToken: json['device_token'] as String?,
      deviceType: json['device_type'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserDTOImplToJson(_$UserDTOImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'lang': instance.lang,
      'id': instance.id,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'birth_date': instance.birthDate,
      'password_confirmation': instance.passwordConfirmation,
      'city_id': instance.cityId,
      'phone': instance.phone,
      'password': instance.password,
      'token': instance.token,
      'role': instance.role,
      'isApproved': instance.isApproved,
      'device_token': instance.deviceToken,
      'device_type': instance.deviceType,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
