import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';

part 'schedule_dto.freezed.dart';
part 'schedule_dto.g.dart';

@freezed
class ScheduleItemsDTO with _$ScheduleItemsDTO {
  const factory ScheduleItemsDTO({
    List<ScheduleDTO>? items,
    PaginationDTO? pagination,
  }) = _ScheduleItemsDTO;

  factory ScheduleItemsDTO.fromJson(Map<String, dynamic> json) =>
      _$ScheduleItemsDTOFromJson(json);
}

@freezed
class ScheduleDTO with _$ScheduleDTO {
  const factory ScheduleDTO({
    int? id,
    @JsonKey(name: 'activity_id') int? activityId,
    @JsonKey(name: 'day_of_week') int? dayOfWeek,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'next_start_at') String? nextStartAt,
    @JsonKey(name: 'can_enroll') bool? canEnroll,
    @JsonKey(name: 'is_occupied') bool? isOccupied,
    ActivityDTO? activity,
  }) = _ScheduleDTO;

  factory ScheduleDTO.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDTOFromJson(json);
}

@freezed
class ActivityDTO with _$ActivityDTO {
  const factory ActivityDTO({
    int? id,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'center_id') int? centerId,
    String? title,
    String? name,
    String? description,
    @JsonKey(name: 'duration_minutes') int? durationMinutes,
    @JsonKey(name: 'min_age') int? minAge,
    @JsonKey(name: 'max_age') int? maxAge,
    String? image,
    @JsonKey(name: 'is_active') int? isActive,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    CentersDTO? center,
    CategoryDTO? category,
  }) = _ActivityDTO;

  factory ActivityDTO.fromJson(Map<String, dynamic> json) =>
      _$ActivityDTOFromJson(json);
}

@freezed
class PaginationDTO with _$PaginationDTO {
  const factory PaginationDTO({
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'has_more_pages') bool? hasMorePages,
    @JsonKey(name: 'last_page') int? lastPage,
    @JsonKey(name: 'per_page') int? perPage,
    int? total,
  }) = _PaginationDTO;

  factory PaginationDTO.fromJson(Map<String, dynamic> json) =>
      _$PaginationDTOFromJson(json);
}
