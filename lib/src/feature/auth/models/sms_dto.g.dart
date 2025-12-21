// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmsDTOImpl _$$SmsDTOImplFromJson(Map<String, dynamic> json) => _$SmsDTOImpl(
      message: json['message'] as String?,
      debugCode: json['debug_code'] as String?,
      expiresInMinutes: (json['expires_in_minutes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SmsDTOImplToJson(_$SmsDTOImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'debug_code': instance.debugCode,
      'expires_in_minutes': instance.expiresInMinutes,
    };
