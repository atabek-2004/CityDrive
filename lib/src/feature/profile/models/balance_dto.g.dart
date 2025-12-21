// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceDTOImpl _$$BalanceDTOImplFromJson(Map<String, dynamic> json) =>
    _$BalanceDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      walletId: (json['wallet_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      type: json['type'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$BalanceDTOImplToJson(_$BalanceDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wallet_id': instance.walletId,
      'amount': instance.amount,
      'type': instance.type,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
