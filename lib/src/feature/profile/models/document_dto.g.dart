// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentDTOImpl _$$DocumentDTOImplFromJson(Map<String, dynamic> json) =>
    _$DocumentDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      url: json['url'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$DocumentDTOImplToJson(_$DocumentDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'content': instance.content,
      'type': instance.type,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
