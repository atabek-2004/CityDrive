// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleItemsDTOImpl _$$ScheduleItemsDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleItemsDTOImpl(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ScheduleDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationDTO.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScheduleItemsDTOImplToJson(
        _$ScheduleItemsDTOImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'pagination': instance.pagination,
    };

_$ScheduleDTOImpl _$$ScheduleDTOImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      activityId: (json['activity_id'] as num?)?.toInt(),
      dayOfWeek: (json['day_of_week'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      nextStartAt: json['next_start_at'] as String?,
      canEnroll: json['can_enroll'] as bool?,
      isOccupied: json['is_occupied'] as bool?,
      activity: json['activity'] == null
          ? null
          : ActivityDTO.fromJson(json['activity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScheduleDTOImplToJson(_$ScheduleDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activity_id': instance.activityId,
      'day_of_week': instance.dayOfWeek,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'next_start_at': instance.nextStartAt,
      'can_enroll': instance.canEnroll,
      'is_occupied': instance.isOccupied,
      'activity': instance.activity,
    };

_$ActivityDTOImpl _$$ActivityDTOImplFromJson(Map<String, dynamic> json) =>
    _$ActivityDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      centerId: (json['center_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
      minAge: (json['min_age'] as num?)?.toInt(),
      maxAge: (json['max_age'] as num?)?.toInt(),
      image: json['image'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      center: json['center'] == null
          ? null
          : CentersDTO.fromJson(json['center'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryDTO.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ActivityDTOImplToJson(_$ActivityDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'center_id': instance.centerId,
      'title': instance.title,
      'name': instance.name,
      'description': instance.description,
      'duration_minutes': instance.durationMinutes,
      'min_age': instance.minAge,
      'max_age': instance.maxAge,
      'image': instance.image,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'center': instance.center,
      'category': instance.category,
    };

_$PaginationDTOImpl _$$PaginationDTOImplFromJson(Map<String, dynamic> json) =>
    _$PaginationDTOImpl(
      currentPage: (json['current_page'] as num?)?.toInt(),
      hasMorePages: json['has_more_pages'] as bool?,
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaginationDTOImplToJson(_$PaginationDTOImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'has_more_pages': instance.hasMorePages,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };
