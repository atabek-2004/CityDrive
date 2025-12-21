// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleItemsDTO _$ScheduleItemsDTOFromJson(Map<String, dynamic> json) {
  return _ScheduleItemsDTO.fromJson(json);
}

/// @nodoc
mixin _$ScheduleItemsDTO {
  List<ScheduleDTO>? get items => throw _privateConstructorUsedError;
  PaginationDTO? get pagination => throw _privateConstructorUsedError;

  /// Serializes this ScheduleItemsDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleItemsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleItemsDTOCopyWith<ScheduleItemsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleItemsDTOCopyWith<$Res> {
  factory $ScheduleItemsDTOCopyWith(
          ScheduleItemsDTO value, $Res Function(ScheduleItemsDTO) then) =
      _$ScheduleItemsDTOCopyWithImpl<$Res, ScheduleItemsDTO>;
  @useResult
  $Res call({List<ScheduleDTO>? items, PaginationDTO? pagination});

  $PaginationDTOCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$ScheduleItemsDTOCopyWithImpl<$Res, $Val extends ScheduleItemsDTO>
    implements $ScheduleItemsDTOCopyWith<$Res> {
  _$ScheduleItemsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleItemsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_value.copyWith(
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ScheduleDTO>?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationDTO?,
    ) as $Val);
  }

  /// Create a copy of ScheduleItemsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationDTOCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationDTOCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleItemsDTOImplCopyWith<$Res>
    implements $ScheduleItemsDTOCopyWith<$Res> {
  factory _$$ScheduleItemsDTOImplCopyWith(_$ScheduleItemsDTOImpl value,
          $Res Function(_$ScheduleItemsDTOImpl) then) =
      __$$ScheduleItemsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ScheduleDTO>? items, PaginationDTO? pagination});

  @override
  $PaginationDTOCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$ScheduleItemsDTOImplCopyWithImpl<$Res>
    extends _$ScheduleItemsDTOCopyWithImpl<$Res, _$ScheduleItemsDTOImpl>
    implements _$$ScheduleItemsDTOImplCopyWith<$Res> {
  __$$ScheduleItemsDTOImplCopyWithImpl(_$ScheduleItemsDTOImpl _value,
      $Res Function(_$ScheduleItemsDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleItemsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_$ScheduleItemsDTOImpl(
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ScheduleDTO>?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleItemsDTOImpl implements _ScheduleItemsDTO {
  const _$ScheduleItemsDTOImpl(
      {final List<ScheduleDTO>? items, this.pagination})
      : _items = items;

  factory _$ScheduleItemsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleItemsDTOImplFromJson(json);

  final List<ScheduleDTO>? _items;
  @override
  List<ScheduleDTO>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PaginationDTO? pagination;

  @override
  String toString() {
    return 'ScheduleItemsDTO(items: $items, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleItemsDTOImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), pagination);

  /// Create a copy of ScheduleItemsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleItemsDTOImplCopyWith<_$ScheduleItemsDTOImpl> get copyWith =>
      __$$ScheduleItemsDTOImplCopyWithImpl<_$ScheduleItemsDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleItemsDTOImplToJson(
      this,
    );
  }
}

abstract class _ScheduleItemsDTO implements ScheduleItemsDTO {
  const factory _ScheduleItemsDTO(
      {final List<ScheduleDTO>? items,
      final PaginationDTO? pagination}) = _$ScheduleItemsDTOImpl;

  factory _ScheduleItemsDTO.fromJson(Map<String, dynamic> json) =
      _$ScheduleItemsDTOImpl.fromJson;

  @override
  List<ScheduleDTO>? get items;
  @override
  PaginationDTO? get pagination;

  /// Create a copy of ScheduleItemsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleItemsDTOImplCopyWith<_$ScheduleItemsDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScheduleDTO _$ScheduleDTOFromJson(Map<String, dynamic> json) {
  return _ScheduleDTO.fromJson(json);
}

/// @nodoc
mixin _$ScheduleDTO {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_id')
  int? get activityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_start_at')
  String? get nextStartAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_enroll')
  bool? get canEnroll => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_occupied')
  bool? get isOccupied => throw _privateConstructorUsedError;
  ActivityDTO? get activity => throw _privateConstructorUsedError;

  /// Serializes this ScheduleDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleDTOCopyWith<ScheduleDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleDTOCopyWith<$Res> {
  factory $ScheduleDTOCopyWith(
          ScheduleDTO value, $Res Function(ScheduleDTO) then) =
      _$ScheduleDTOCopyWithImpl<$Res, ScheduleDTO>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'activity_id') int? activityId,
      @JsonKey(name: 'day_of_week') int? dayOfWeek,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'next_start_at') String? nextStartAt,
      @JsonKey(name: 'can_enroll') bool? canEnroll,
      @JsonKey(name: 'is_occupied') bool? isOccupied,
      ActivityDTO? activity});

  $ActivityDTOCopyWith<$Res>? get activity;
}

/// @nodoc
class _$ScheduleDTOCopyWithImpl<$Res, $Val extends ScheduleDTO>
    implements $ScheduleDTOCopyWith<$Res> {
  _$ScheduleDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? activityId = freezed,
    Object? dayOfWeek = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nextStartAt = freezed,
    Object? canEnroll = freezed,
    Object? isOccupied = freezed,
    Object? activity = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as int?,
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      nextStartAt: freezed == nextStartAt
          ? _value.nextStartAt
          : nextStartAt // ignore: cast_nullable_to_non_nullable
              as String?,
      canEnroll: freezed == canEnroll
          ? _value.canEnroll
          : canEnroll // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOccupied: freezed == isOccupied
          ? _value.isOccupied
          : isOccupied // ignore: cast_nullable_to_non_nullable
              as bool?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityDTO?,
    ) as $Val);
  }

  /// Create a copy of ScheduleDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivityDTOCopyWith<$Res>? get activity {
    if (_value.activity == null) {
      return null;
    }

    return $ActivityDTOCopyWith<$Res>(_value.activity!, (value) {
      return _then(_value.copyWith(activity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleDTOImplCopyWith<$Res>
    implements $ScheduleDTOCopyWith<$Res> {
  factory _$$ScheduleDTOImplCopyWith(
          _$ScheduleDTOImpl value, $Res Function(_$ScheduleDTOImpl) then) =
      __$$ScheduleDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'activity_id') int? activityId,
      @JsonKey(name: 'day_of_week') int? dayOfWeek,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'next_start_at') String? nextStartAt,
      @JsonKey(name: 'can_enroll') bool? canEnroll,
      @JsonKey(name: 'is_occupied') bool? isOccupied,
      ActivityDTO? activity});

  @override
  $ActivityDTOCopyWith<$Res>? get activity;
}

/// @nodoc
class __$$ScheduleDTOImplCopyWithImpl<$Res>
    extends _$ScheduleDTOCopyWithImpl<$Res, _$ScheduleDTOImpl>
    implements _$$ScheduleDTOImplCopyWith<$Res> {
  __$$ScheduleDTOImplCopyWithImpl(
      _$ScheduleDTOImpl _value, $Res Function(_$ScheduleDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? activityId = freezed,
    Object? dayOfWeek = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nextStartAt = freezed,
    Object? canEnroll = freezed,
    Object? isOccupied = freezed,
    Object? activity = freezed,
  }) {
    return _then(_$ScheduleDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as int?,
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      nextStartAt: freezed == nextStartAt
          ? _value.nextStartAt
          : nextStartAt // ignore: cast_nullable_to_non_nullable
              as String?,
      canEnroll: freezed == canEnroll
          ? _value.canEnroll
          : canEnroll // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOccupied: freezed == isOccupied
          ? _value.isOccupied
          : isOccupied // ignore: cast_nullable_to_non_nullable
              as bool?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleDTOImpl implements _ScheduleDTO {
  const _$ScheduleDTOImpl(
      {this.id,
      @JsonKey(name: 'activity_id') this.activityId,
      @JsonKey(name: 'day_of_week') this.dayOfWeek,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'next_start_at') this.nextStartAt,
      @JsonKey(name: 'can_enroll') this.canEnroll,
      @JsonKey(name: 'is_occupied') this.isOccupied,
      this.activity});

  factory _$ScheduleDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleDTOImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'activity_id')
  final int? activityId;
  @override
  @JsonKey(name: 'day_of_week')
  final int? dayOfWeek;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'next_start_at')
  final String? nextStartAt;
  @override
  @JsonKey(name: 'can_enroll')
  final bool? canEnroll;
  @override
  @JsonKey(name: 'is_occupied')
  final bool? isOccupied;
  @override
  final ActivityDTO? activity;

  @override
  String toString() {
    return 'ScheduleDTO(id: $id, activityId: $activityId, dayOfWeek: $dayOfWeek, startTime: $startTime, endTime: $endTime, createdAt: $createdAt, updatedAt: $updatedAt, nextStartAt: $nextStartAt, canEnroll: $canEnroll, isOccupied: $isOccupied, activity: $activity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.nextStartAt, nextStartAt) ||
                other.nextStartAt == nextStartAt) &&
            (identical(other.canEnroll, canEnroll) ||
                other.canEnroll == canEnroll) &&
            (identical(other.isOccupied, isOccupied) ||
                other.isOccupied == isOccupied) &&
            (identical(other.activity, activity) ||
                other.activity == activity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      activityId,
      dayOfWeek,
      startTime,
      endTime,
      createdAt,
      updatedAt,
      nextStartAt,
      canEnroll,
      isOccupied,
      activity);

  /// Create a copy of ScheduleDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleDTOImplCopyWith<_$ScheduleDTOImpl> get copyWith =>
      __$$ScheduleDTOImplCopyWithImpl<_$ScheduleDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleDTOImplToJson(
      this,
    );
  }
}

abstract class _ScheduleDTO implements ScheduleDTO {
  const factory _ScheduleDTO(
      {final int? id,
      @JsonKey(name: 'activity_id') final int? activityId,
      @JsonKey(name: 'day_of_week') final int? dayOfWeek,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      @JsonKey(name: 'next_start_at') final String? nextStartAt,
      @JsonKey(name: 'can_enroll') final bool? canEnroll,
      @JsonKey(name: 'is_occupied') final bool? isOccupied,
      final ActivityDTO? activity}) = _$ScheduleDTOImpl;

  factory _ScheduleDTO.fromJson(Map<String, dynamic> json) =
      _$ScheduleDTOImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'activity_id')
  int? get activityId;
  @override
  @JsonKey(name: 'day_of_week')
  int? get dayOfWeek;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'next_start_at')
  String? get nextStartAt;
  @override
  @JsonKey(name: 'can_enroll')
  bool? get canEnroll;
  @override
  @JsonKey(name: 'is_occupied')
  bool? get isOccupied;
  @override
  ActivityDTO? get activity;

  /// Create a copy of ScheduleDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleDTOImplCopyWith<_$ScheduleDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActivityDTO _$ActivityDTOFromJson(Map<String, dynamic> json) {
  return _ActivityDTO.fromJson(json);
}

/// @nodoc
mixin _$ActivityDTO {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'center_id')
  int? get centerId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  int? get durationMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_age')
  int? get minAge => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_age')
  int? get maxAge => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  int? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  CentersDTO? get center => throw _privateConstructorUsedError;
  CategoryDTO? get category => throw _privateConstructorUsedError;

  /// Serializes this ActivityDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityDTOCopyWith<ActivityDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityDTOCopyWith<$Res> {
  factory $ActivityDTOCopyWith(
          ActivityDTO value, $Res Function(ActivityDTO) then) =
      _$ActivityDTOCopyWithImpl<$Res, ActivityDTO>;
  @useResult
  $Res call(
      {int? id,
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
      CategoryDTO? category});

  $CentersDTOCopyWith<$Res>? get center;
  $CategoryDTOCopyWith<$Res>? get category;
}

/// @nodoc
class _$ActivityDTOCopyWithImpl<$Res, $Val extends ActivityDTO>
    implements $ActivityDTOCopyWith<$Res> {
  _$ActivityDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? centerId = freezed,
    Object? title = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? durationMinutes = freezed,
    Object? minAge = freezed,
    Object? maxAge = freezed,
    Object? image = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? center = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      centerId: freezed == centerId
          ? _value.centerId
          : centerId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      minAge: freezed == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int?,
      maxAge: freezed == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      center: freezed == center
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as CentersDTO?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDTO?,
    ) as $Val);
  }

  /// Create a copy of ActivityDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CentersDTOCopyWith<$Res>? get center {
    if (_value.center == null) {
      return null;
    }

    return $CentersDTOCopyWith<$Res>(_value.center!, (value) {
      return _then(_value.copyWith(center: value) as $Val);
    });
  }

  /// Create a copy of ActivityDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDTOCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryDTOCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActivityDTOImplCopyWith<$Res>
    implements $ActivityDTOCopyWith<$Res> {
  factory _$$ActivityDTOImplCopyWith(
          _$ActivityDTOImpl value, $Res Function(_$ActivityDTOImpl) then) =
      __$$ActivityDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
      CategoryDTO? category});

  @override
  $CentersDTOCopyWith<$Res>? get center;
  @override
  $CategoryDTOCopyWith<$Res>? get category;
}

/// @nodoc
class __$$ActivityDTOImplCopyWithImpl<$Res>
    extends _$ActivityDTOCopyWithImpl<$Res, _$ActivityDTOImpl>
    implements _$$ActivityDTOImplCopyWith<$Res> {
  __$$ActivityDTOImplCopyWithImpl(
      _$ActivityDTOImpl _value, $Res Function(_$ActivityDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? centerId = freezed,
    Object? title = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? durationMinutes = freezed,
    Object? minAge = freezed,
    Object? maxAge = freezed,
    Object? image = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? center = freezed,
    Object? category = freezed,
  }) {
    return _then(_$ActivityDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      centerId: freezed == centerId
          ? _value.centerId
          : centerId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      minAge: freezed == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int?,
      maxAge: freezed == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      center: freezed == center
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as CentersDTO?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityDTOImpl implements _ActivityDTO {
  const _$ActivityDTOImpl(
      {this.id,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'center_id') this.centerId,
      this.title,
      this.name,
      this.description,
      @JsonKey(name: 'duration_minutes') this.durationMinutes,
      @JsonKey(name: 'min_age') this.minAge,
      @JsonKey(name: 'max_age') this.maxAge,
      this.image,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.center,
      this.category});

  factory _$ActivityDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityDTOImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'center_id')
  final int? centerId;
  @override
  final String? title;
  @override
  final String? name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'duration_minutes')
  final int? durationMinutes;
  @override
  @JsonKey(name: 'min_age')
  final int? minAge;
  @override
  @JsonKey(name: 'max_age')
  final int? maxAge;
  @override
  final String? image;
  @override
  @JsonKey(name: 'is_active')
  final int? isActive;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  final CentersDTO? center;
  @override
  final CategoryDTO? category;

  @override
  String toString() {
    return 'ActivityDTO(id: $id, categoryId: $categoryId, centerId: $centerId, title: $title, name: $name, description: $description, durationMinutes: $durationMinutes, minAge: $minAge, maxAge: $maxAge, image: $image, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, center: $center, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.centerId, centerId) ||
                other.centerId == centerId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.maxAge, maxAge) || other.maxAge == maxAge) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.center, center) || other.center == center) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      categoryId,
      centerId,
      title,
      name,
      description,
      durationMinutes,
      minAge,
      maxAge,
      image,
      isActive,
      createdAt,
      updatedAt,
      center,
      category);

  /// Create a copy of ActivityDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityDTOImplCopyWith<_$ActivityDTOImpl> get copyWith =>
      __$$ActivityDTOImplCopyWithImpl<_$ActivityDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityDTOImplToJson(
      this,
    );
  }
}

abstract class _ActivityDTO implements ActivityDTO {
  const factory _ActivityDTO(
      {final int? id,
      @JsonKey(name: 'category_id') final int? categoryId,
      @JsonKey(name: 'center_id') final int? centerId,
      final String? title,
      final String? name,
      final String? description,
      @JsonKey(name: 'duration_minutes') final int? durationMinutes,
      @JsonKey(name: 'min_age') final int? minAge,
      @JsonKey(name: 'max_age') final int? maxAge,
      final String? image,
      @JsonKey(name: 'is_active') final int? isActive,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final CentersDTO? center,
      final CategoryDTO? category}) = _$ActivityDTOImpl;

  factory _ActivityDTO.fromJson(Map<String, dynamic> json) =
      _$ActivityDTOImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'center_id')
  int? get centerId;
  @override
  String? get title;
  @override
  String? get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'duration_minutes')
  int? get durationMinutes;
  @override
  @JsonKey(name: 'min_age')
  int? get minAge;
  @override
  @JsonKey(name: 'max_age')
  int? get maxAge;
  @override
  String? get image;
  @override
  @JsonKey(name: 'is_active')
  int? get isActive;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  CentersDTO? get center;
  @override
  CategoryDTO? get category;

  /// Create a copy of ActivityDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityDTOImplCopyWith<_$ActivityDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationDTO _$PaginationDTOFromJson(Map<String, dynamic> json) {
  return _PaginationDTO.fromJson(json);
}

/// @nodoc
mixin _$PaginationDTO {
  @JsonKey(name: 'current_page')
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_more_pages')
  bool? get hasMorePages => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int? get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  /// Serializes this PaginationDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationDTOCopyWith<PaginationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationDTOCopyWith<$Res> {
  factory $PaginationDTOCopyWith(
          PaginationDTO value, $Res Function(PaginationDTO) then) =
      _$PaginationDTOCopyWithImpl<$Res, PaginationDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'has_more_pages') bool? hasMorePages,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'per_page') int? perPage,
      int? total});
}

/// @nodoc
class _$PaginationDTOCopyWithImpl<$Res, $Val extends PaginationDTO>
    implements $PaginationDTOCopyWith<$Res> {
  _$PaginationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? hasMorePages = freezed,
    Object? lastPage = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      hasMorePages: freezed == hasMorePages
          ? _value.hasMorePages
          : hasMorePages // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationDTOImplCopyWith<$Res>
    implements $PaginationDTOCopyWith<$Res> {
  factory _$$PaginationDTOImplCopyWith(
          _$PaginationDTOImpl value, $Res Function(_$PaginationDTOImpl) then) =
      __$$PaginationDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int? currentPage,
      @JsonKey(name: 'has_more_pages') bool? hasMorePages,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'per_page') int? perPage,
      int? total});
}

/// @nodoc
class __$$PaginationDTOImplCopyWithImpl<$Res>
    extends _$PaginationDTOCopyWithImpl<$Res, _$PaginationDTOImpl>
    implements _$$PaginationDTOImplCopyWith<$Res> {
  __$$PaginationDTOImplCopyWithImpl(
      _$PaginationDTOImpl _value, $Res Function(_$PaginationDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = freezed,
    Object? hasMorePages = freezed,
    Object? lastPage = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
  }) {
    return _then(_$PaginationDTOImpl(
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      hasMorePages: freezed == hasMorePages
          ? _value.hasMorePages
          : hasMorePages // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationDTOImpl implements _PaginationDTO {
  const _$PaginationDTOImpl(
      {@JsonKey(name: 'current_page') this.currentPage,
      @JsonKey(name: 'has_more_pages') this.hasMorePages,
      @JsonKey(name: 'last_page') this.lastPage,
      @JsonKey(name: 'per_page') this.perPage,
      this.total});

  factory _$PaginationDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationDTOImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @override
  @JsonKey(name: 'has_more_pages')
  final bool? hasMorePages;
  @override
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  final int? total;

  @override
  String toString() {
    return 'PaginationDTO(currentPage: $currentPage, hasMorePages: $hasMorePages, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationDTOImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasMorePages, hasMorePages) ||
                other.hasMorePages == hasMorePages) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPage, hasMorePages, lastPage, perPage, total);

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationDTOImplCopyWith<_$PaginationDTOImpl> get copyWith =>
      __$$PaginationDTOImplCopyWithImpl<_$PaginationDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationDTOImplToJson(
      this,
    );
  }
}

abstract class _PaginationDTO implements PaginationDTO {
  const factory _PaginationDTO(
      {@JsonKey(name: 'current_page') final int? currentPage,
      @JsonKey(name: 'has_more_pages') final bool? hasMorePages,
      @JsonKey(name: 'last_page') final int? lastPage,
      @JsonKey(name: 'per_page') final int? perPage,
      final int? total}) = _$PaginationDTOImpl;

  factory _PaginationDTO.fromJson(Map<String, dynamic> json) =
      _$PaginationDTOImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int? get currentPage;
  @override
  @JsonKey(name: 'has_more_pages')
  bool? get hasMorePages;
  @override
  @JsonKey(name: 'last_page')
  int? get lastPage;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  int? get total;

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationDTOImplCopyWith<_$PaginationDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
