// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainDTOImpl _$$MainDTOImplFromJson(Map<String, dynamic> json) =>
    _$MainDTOImpl(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      centers: (json['centers'] as List<dynamic>?)
          ?.map((e) => CentersDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MainDTOImplToJson(_$MainDTOImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'centers': instance.centers,
    };

_$CategoryDTOImpl _$$CategoryDTOImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      color: json['color'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$CategoryDTOImplToJson(_$CategoryDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'color': instance.color,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$CentersDTOImpl _$$CentersDTOImplFromJson(Map<String, dynamic> json) =>
    _$CentersDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      logo: json['logo'] as String?,
      banner: json['banner'] as String?,
      color: json['color'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      isActivet: (json['is_active'] as num?)?.toInt(),
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => BannerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      activities: (json['activities'] as List<dynamic>?)
          ?.map((e) => ActivityDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CentersDTOImplToJson(_$CentersDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'logo': instance.logo,
      'banner': instance.banner,
      'color': instance.color,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_active': instance.isActivet,
      'banners': instance.banners,
      'activities': instance.activities,
    };

_$BannerDTOImpl _$$BannerDTOImplFromJson(Map<String, dynamic> json) =>
    _$BannerDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$BannerDTOImplToJson(_$BannerDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };
