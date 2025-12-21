// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChildPayloadImpl _$$ChildPayloadImplFromJson(Map<String, dynamic> json) =>
    _$ChildPayloadImpl(
      fullName: json['full_name'] as String?,
      birthDate: json['birth_date'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$$ChildPayloadImplToJson(_$ChildPayloadImpl instance) =>
    <String, dynamic>{
      if (instance.fullName case final value?) 'full_name': value,
      if (instance.birthDate case final value?) 'birth_date': value,
      if (instance.gender case final value?) 'gender': value,
    };
