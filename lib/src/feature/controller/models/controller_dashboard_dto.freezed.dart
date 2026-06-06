// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'controller_dashboard_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ControllerDashboardStatsDTO _$ControllerDashboardStatsDTOFromJson(
    Map<String, dynamic> json) {
  return _ControllerDashboardStatsDTO.fromJson(json);
}

/// @nodoc
mixin _$ControllerDashboardStatsDTO {
  @JsonKey(name: 'new_count')
  int get newCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'applications_count')
  int get applicationsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_work_count')
  int get inWorkCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'done_count')
  int get doneCount => throw _privateConstructorUsedError;

  /// Serializes this ControllerDashboardStatsDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ControllerDashboardStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ControllerDashboardStatsDTOCopyWith<ControllerDashboardStatsDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControllerDashboardStatsDTOCopyWith<$Res> {
  factory $ControllerDashboardStatsDTOCopyWith(
          ControllerDashboardStatsDTO value,
          $Res Function(ControllerDashboardStatsDTO) then) =
      _$ControllerDashboardStatsDTOCopyWithImpl<$Res,
          ControllerDashboardStatsDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'new_count') int newCount,
      @JsonKey(name: 'applications_count') int applicationsCount,
      @JsonKey(name: 'in_work_count') int inWorkCount,
      @JsonKey(name: 'done_count') int doneCount});
}

/// @nodoc
class _$ControllerDashboardStatsDTOCopyWithImpl<$Res,
        $Val extends ControllerDashboardStatsDTO>
    implements $ControllerDashboardStatsDTOCopyWith<$Res> {
  _$ControllerDashboardStatsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ControllerDashboardStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newCount = null,
    Object? applicationsCount = null,
    Object? inWorkCount = null,
    Object? doneCount = null,
  }) {
    return _then(_value.copyWith(
      newCount: null == newCount
          ? _value.newCount
          : newCount // ignore: cast_nullable_to_non_nullable
              as int,
      applicationsCount: null == applicationsCount
          ? _value.applicationsCount
          : applicationsCount // ignore: cast_nullable_to_non_nullable
              as int,
      inWorkCount: null == inWorkCount
          ? _value.inWorkCount
          : inWorkCount // ignore: cast_nullable_to_non_nullable
              as int,
      doneCount: null == doneCount
          ? _value.doneCount
          : doneCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ControllerDashboardStatsDTOImplCopyWith<$Res>
    implements $ControllerDashboardStatsDTOCopyWith<$Res> {
  factory _$$ControllerDashboardStatsDTOImplCopyWith(
          _$ControllerDashboardStatsDTOImpl value,
          $Res Function(_$ControllerDashboardStatsDTOImpl) then) =
      __$$ControllerDashboardStatsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'new_count') int newCount,
      @JsonKey(name: 'applications_count') int applicationsCount,
      @JsonKey(name: 'in_work_count') int inWorkCount,
      @JsonKey(name: 'done_count') int doneCount});
}

/// @nodoc
class __$$ControllerDashboardStatsDTOImplCopyWithImpl<$Res>
    extends _$ControllerDashboardStatsDTOCopyWithImpl<$Res,
        _$ControllerDashboardStatsDTOImpl>
    implements _$$ControllerDashboardStatsDTOImplCopyWith<$Res> {
  __$$ControllerDashboardStatsDTOImplCopyWithImpl(
      _$ControllerDashboardStatsDTOImpl _value,
      $Res Function(_$ControllerDashboardStatsDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ControllerDashboardStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newCount = null,
    Object? applicationsCount = null,
    Object? inWorkCount = null,
    Object? doneCount = null,
  }) {
    return _then(_$ControllerDashboardStatsDTOImpl(
      newCount: null == newCount
          ? _value.newCount
          : newCount // ignore: cast_nullable_to_non_nullable
              as int,
      applicationsCount: null == applicationsCount
          ? _value.applicationsCount
          : applicationsCount // ignore: cast_nullable_to_non_nullable
              as int,
      inWorkCount: null == inWorkCount
          ? _value.inWorkCount
          : inWorkCount // ignore: cast_nullable_to_non_nullable
              as int,
      doneCount: null == doneCount
          ? _value.doneCount
          : doneCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ControllerDashboardStatsDTOImpl
    implements _ControllerDashboardStatsDTO {
  const _$ControllerDashboardStatsDTOImpl(
      {@JsonKey(name: 'new_count') this.newCount = 0,
      @JsonKey(name: 'applications_count') this.applicationsCount = 0,
      @JsonKey(name: 'in_work_count') this.inWorkCount = 0,
      @JsonKey(name: 'done_count') this.doneCount = 0});

  factory _$ControllerDashboardStatsDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ControllerDashboardStatsDTOImplFromJson(json);

  @override
  @JsonKey(name: 'new_count')
  final int newCount;
  @override
  @JsonKey(name: 'applications_count')
  final int applicationsCount;
  @override
  @JsonKey(name: 'in_work_count')
  final int inWorkCount;
  @override
  @JsonKey(name: 'done_count')
  final int doneCount;

  @override
  String toString() {
    return 'ControllerDashboardStatsDTO(newCount: $newCount, applicationsCount: $applicationsCount, inWorkCount: $inWorkCount, doneCount: $doneCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ControllerDashboardStatsDTOImpl &&
            (identical(other.newCount, newCount) ||
                other.newCount == newCount) &&
            (identical(other.applicationsCount, applicationsCount) ||
                other.applicationsCount == applicationsCount) &&
            (identical(other.inWorkCount, inWorkCount) ||
                other.inWorkCount == inWorkCount) &&
            (identical(other.doneCount, doneCount) ||
                other.doneCount == doneCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, newCount, applicationsCount, inWorkCount, doneCount);

  /// Create a copy of ControllerDashboardStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ControllerDashboardStatsDTOImplCopyWith<_$ControllerDashboardStatsDTOImpl>
      get copyWith => __$$ControllerDashboardStatsDTOImplCopyWithImpl<
          _$ControllerDashboardStatsDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ControllerDashboardStatsDTOImplToJson(
      this,
    );
  }
}

abstract class _ControllerDashboardStatsDTO
    implements ControllerDashboardStatsDTO {
  const factory _ControllerDashboardStatsDTO(
          {@JsonKey(name: 'new_count') final int newCount,
          @JsonKey(name: 'applications_count') final int applicationsCount,
          @JsonKey(name: 'in_work_count') final int inWorkCount,
          @JsonKey(name: 'done_count') final int doneCount}) =
      _$ControllerDashboardStatsDTOImpl;

  factory _ControllerDashboardStatsDTO.fromJson(Map<String, dynamic> json) =
      _$ControllerDashboardStatsDTOImpl.fromJson;

  @override
  @JsonKey(name: 'new_count')
  int get newCount;
  @override
  @JsonKey(name: 'applications_count')
  int get applicationsCount;
  @override
  @JsonKey(name: 'in_work_count')
  int get inWorkCount;
  @override
  @JsonKey(name: 'done_count')
  int get doneCount;

  /// Create a copy of ControllerDashboardStatsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ControllerDashboardStatsDTOImplCopyWith<_$ControllerDashboardStatsDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
