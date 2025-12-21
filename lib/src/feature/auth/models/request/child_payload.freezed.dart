// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'child_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChildPayload _$ChildPayloadFromJson(Map<String, dynamic> json) {
  return _ChildPayload.fromJson(json);
}

/// @nodoc
mixin _$ChildPayload {
  @JsonKey(includeIfNull: false, name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false, name: 'birth_date')
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get gender => throw _privateConstructorUsedError;

  /// Serializes this ChildPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChildPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChildPayloadCopyWith<ChildPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildPayloadCopyWith<$Res> {
  factory $ChildPayloadCopyWith(
          ChildPayload value, $Res Function(ChildPayload) then) =
      _$ChildPayloadCopyWithImpl<$Res, ChildPayload>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false, name: 'full_name') String? fullName,
      @JsonKey(includeIfNull: false, name: 'birth_date') String? birthDate,
      @JsonKey(includeIfNull: false) String? gender});
}

/// @nodoc
class _$ChildPayloadCopyWithImpl<$Res, $Val extends ChildPayload>
    implements $ChildPayloadCopyWith<$Res> {
  _$ChildPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChildPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? birthDate = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChildPayloadImplCopyWith<$Res>
    implements $ChildPayloadCopyWith<$Res> {
  factory _$$ChildPayloadImplCopyWith(
          _$ChildPayloadImpl value, $Res Function(_$ChildPayloadImpl) then) =
      __$$ChildPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false, name: 'full_name') String? fullName,
      @JsonKey(includeIfNull: false, name: 'birth_date') String? birthDate,
      @JsonKey(includeIfNull: false) String? gender});
}

/// @nodoc
class __$$ChildPayloadImplCopyWithImpl<$Res>
    extends _$ChildPayloadCopyWithImpl<$Res, _$ChildPayloadImpl>
    implements _$$ChildPayloadImplCopyWith<$Res> {
  __$$ChildPayloadImplCopyWithImpl(
      _$ChildPayloadImpl _value, $Res Function(_$ChildPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChildPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? birthDate = freezed,
    Object? gender = freezed,
  }) {
    return _then(_$ChildPayloadImpl(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChildPayloadImpl implements _ChildPayload {
  const _$ChildPayloadImpl(
      {@JsonKey(includeIfNull: false, name: 'full_name') this.fullName,
      @JsonKey(includeIfNull: false, name: 'birth_date') this.birthDate,
      @JsonKey(includeIfNull: false) this.gender});

  factory _$ChildPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChildPayloadImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false, name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(includeIfNull: false, name: 'birth_date')
  final String? birthDate;
  @override
  @JsonKey(includeIfNull: false)
  final String? gender;

  @override
  String toString() {
    return 'ChildPayload(fullName: $fullName, birthDate: $birthDate, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChildPayloadImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, birthDate, gender);

  /// Create a copy of ChildPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChildPayloadImplCopyWith<_$ChildPayloadImpl> get copyWith =>
      __$$ChildPayloadImplCopyWithImpl<_$ChildPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChildPayloadImplToJson(
      this,
    );
  }
}

abstract class _ChildPayload implements ChildPayload {
  const factory _ChildPayload(
      {@JsonKey(includeIfNull: false, name: 'full_name') final String? fullName,
      @JsonKey(includeIfNull: false, name: 'birth_date')
      final String? birthDate,
      @JsonKey(includeIfNull: false)
      final String? gender}) = _$ChildPayloadImpl;

  factory _ChildPayload.fromJson(Map<String, dynamic> json) =
      _$ChildPayloadImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false, name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(includeIfNull: false, name: 'birth_date')
  String? get birthDate;
  @override
  @JsonKey(includeIfNull: false)
  String? get gender;

  /// Create a copy of ChildPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChildPayloadImplCopyWith<_$ChildPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
