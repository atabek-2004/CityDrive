// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sms_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SmsDTO _$SmsDTOFromJson(Map<String, dynamic> json) {
  return _SmsDTO.fromJson(json);
}

/// @nodoc
mixin _$SmsDTO {
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'debug_code')
  String? get debugCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_in_minutes')
  int? get expiresInMinutes => throw _privateConstructorUsedError;

  /// Serializes this SmsDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmsDTOCopyWith<SmsDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmsDTOCopyWith<$Res> {
  factory $SmsDTOCopyWith(SmsDTO value, $Res Function(SmsDTO) then) =
      _$SmsDTOCopyWithImpl<$Res, SmsDTO>;
  @useResult
  $Res call(
      {String? message,
      @JsonKey(name: 'debug_code') String? debugCode,
      @JsonKey(name: 'expires_in_minutes') int? expiresInMinutes});
}

/// @nodoc
class _$SmsDTOCopyWithImpl<$Res, $Val extends SmsDTO>
    implements $SmsDTOCopyWith<$Res> {
  _$SmsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? debugCode = freezed,
    Object? expiresInMinutes = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      debugCode: freezed == debugCode
          ? _value.debugCode
          : debugCode // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresInMinutes: freezed == expiresInMinutes
          ? _value.expiresInMinutes
          : expiresInMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmsDTOImplCopyWith<$Res> implements $SmsDTOCopyWith<$Res> {
  factory _$$SmsDTOImplCopyWith(
          _$SmsDTOImpl value, $Res Function(_$SmsDTOImpl) then) =
      __$$SmsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message,
      @JsonKey(name: 'debug_code') String? debugCode,
      @JsonKey(name: 'expires_in_minutes') int? expiresInMinutes});
}

/// @nodoc
class __$$SmsDTOImplCopyWithImpl<$Res>
    extends _$SmsDTOCopyWithImpl<$Res, _$SmsDTOImpl>
    implements _$$SmsDTOImplCopyWith<$Res> {
  __$$SmsDTOImplCopyWithImpl(
      _$SmsDTOImpl _value, $Res Function(_$SmsDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? debugCode = freezed,
    Object? expiresInMinutes = freezed,
  }) {
    return _then(_$SmsDTOImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      debugCode: freezed == debugCode
          ? _value.debugCode
          : debugCode // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresInMinutes: freezed == expiresInMinutes
          ? _value.expiresInMinutes
          : expiresInMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmsDTOImpl implements _SmsDTO {
  const _$SmsDTOImpl(
      {this.message,
      @JsonKey(name: 'debug_code') this.debugCode,
      @JsonKey(name: 'expires_in_minutes') this.expiresInMinutes});

  factory _$SmsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmsDTOImplFromJson(json);

  @override
  final String? message;
  @override
  @JsonKey(name: 'debug_code')
  final String? debugCode;
  @override
  @JsonKey(name: 'expires_in_minutes')
  final int? expiresInMinutes;

  @override
  String toString() {
    return 'SmsDTO(message: $message, debugCode: $debugCode, expiresInMinutes: $expiresInMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmsDTOImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.debugCode, debugCode) ||
                other.debugCode == debugCode) &&
            (identical(other.expiresInMinutes, expiresInMinutes) ||
                other.expiresInMinutes == expiresInMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, debugCode, expiresInMinutes);

  /// Create a copy of SmsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmsDTOImplCopyWith<_$SmsDTOImpl> get copyWith =>
      __$$SmsDTOImplCopyWithImpl<_$SmsDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmsDTOImplToJson(
      this,
    );
  }
}

abstract class _SmsDTO implements SmsDTO {
  const factory _SmsDTO(
          {final String? message,
          @JsonKey(name: 'debug_code') final String? debugCode,
          @JsonKey(name: 'expires_in_minutes') final int? expiresInMinutes}) =
      _$SmsDTOImpl;

  factory _SmsDTO.fromJson(Map<String, dynamic> json) = _$SmsDTOImpl.fromJson;

  @override
  String? get message;
  @override
  @JsonKey(name: 'debug_code')
  String? get debugCode;
  @override
  @JsonKey(name: 'expires_in_minutes')
  int? get expiresInMinutes;

  /// Create a copy of SmsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmsDTOImplCopyWith<_$SmsDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
