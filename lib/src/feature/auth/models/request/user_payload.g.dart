// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPayloadImpl _$$UserPayloadImplFromJson(Map<String, dynamic> json) =>
    _$UserPayloadImpl(
      fullName: json['full_name'] as String?,
      birthDate: json['birth_date'] as String?,
      cityId: (json['city_id'] as num?)?.toInt(),
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
      deviceType: json['device_type'] as String?,
      deviceToken: json['device_token'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$$UserPayloadImplToJson(_$UserPayloadImpl instance) =>
    <String, dynamic>{
      if (instance.fullName case final value?) 'full_name': value,
      if (instance.birthDate case final value?) 'birth_date': value,
      if (instance.cityId case final value?) 'city_id': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.password case final value?) 'password': value,
      if (instance.passwordConfirmation case final value?)
        'password_confirmation': value,
      if (instance.deviceType case final value?) 'device_type': value,
      if (instance.deviceToken case final value?) 'device_token': value,
      if (instance.lang case final value?) 'lang': value,
    };
