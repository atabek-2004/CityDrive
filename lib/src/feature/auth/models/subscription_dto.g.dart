// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionDTOImpl _$$SubscriptionDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionDTOImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      price: const StringToIntConverter().fromJson(json['price']),
      discountedPrice:
          const StringToIntConverter().fromJson(json['discounted_price']),
      discountPercent:
          const StringToIntConverter().fromJson(json['discount_percent']),
      isActive: const StringToIntConverter().fromJson(json['is_active']),
      titleKK: json['title_kk'] as String?,
      titleEN: json['title_en'] as String?,
      durationMonths: (json['duration_months'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$SubscriptionDTOImplToJson(
        _$SubscriptionDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': const StringToIntConverter().toJson(instance.price),
      'discounted_price':
          const StringToIntConverter().toJson(instance.discountedPrice),
      'discount_percent':
          const StringToIntConverter().toJson(instance.discountPercent),
      'is_active': const StringToIntConverter().toJson(instance.isActive),
      'title_kk': instance.titleKK,
      'title_en': instance.titleEN,
      'duration_months': instance.durationMonths,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
