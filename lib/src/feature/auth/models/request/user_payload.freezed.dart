// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPayload _$UserPayloadFromJson(Map<String, dynamic> json) {
  return _UserPayload.fromJson(json);
}

/// @nodoc
mixin _$UserPayload {
  @JsonKey(includeIfNull: false, name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false, name: 'birth_date')
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false, name: 'city_id')
  int? get cityId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false, name: 'password_confirmation')
  String? get passwordConfirmation => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false, name: 'device_type')
  String? get deviceType => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false, name: 'device_token')
  String? get deviceToken => throw _privateConstructorUsedError;

  /// Serializes this UserPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPayloadCopyWith<UserPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPayloadCopyWith<$Res> {
  factory $UserPayloadCopyWith(
          UserPayload value, $Res Function(UserPayload) then) =
      _$UserPayloadCopyWithImpl<$Res, UserPayload>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false, name: 'full_name') String? fullName,
      @JsonKey(includeIfNull: false, name: 'birth_date') String? birthDate,
      @JsonKey(includeIfNull: false, name: 'city_id') int? cityId,
      @JsonKey(includeIfNull: false) String? phone,
      @JsonKey(includeIfNull: false) String? password,
      @JsonKey(includeIfNull: false, name: 'password_confirmation')
      String? passwordConfirmation,
      @JsonKey(includeIfNull: false, name: 'device_type') String? deviceType,
      @JsonKey(includeIfNull: false, name: 'device_token')
      String? deviceToken});
}

/// @nodoc
class _$UserPayloadCopyWithImpl<$Res, $Val extends UserPayload>
    implements $UserPayloadCopyWith<$Res> {
  _$UserPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? birthDate = freezed,
    Object? cityId = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
    Object? deviceType = freezed,
    Object? deviceToken = freezed,
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
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmation: freezed == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPayloadImplCopyWith<$Res>
    implements $UserPayloadCopyWith<$Res> {
  factory _$$UserPayloadImplCopyWith(
          _$UserPayloadImpl value, $Res Function(_$UserPayloadImpl) then) =
      __$$UserPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false, name: 'full_name') String? fullName,
      @JsonKey(includeIfNull: false, name: 'birth_date') String? birthDate,
      @JsonKey(includeIfNull: false, name: 'city_id') int? cityId,
      @JsonKey(includeIfNull: false) String? phone,
      @JsonKey(includeIfNull: false) String? password,
      @JsonKey(includeIfNull: false, name: 'password_confirmation')
      String? passwordConfirmation,
      @JsonKey(includeIfNull: false, name: 'device_type') String? deviceType,
      @JsonKey(includeIfNull: false, name: 'device_token')
      String? deviceToken});
}

/// @nodoc
class __$$UserPayloadImplCopyWithImpl<$Res>
    extends _$UserPayloadCopyWithImpl<$Res, _$UserPayloadImpl>
    implements _$$UserPayloadImplCopyWith<$Res> {
  __$$UserPayloadImplCopyWithImpl(
      _$UserPayloadImpl _value, $Res Function(_$UserPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? birthDate = freezed,
    Object? cityId = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
    Object? deviceType = freezed,
    Object? deviceToken = freezed,
  }) {
    return _then(_$UserPayloadImpl(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmation: freezed == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPayloadImpl implements _UserPayload {
  const _$UserPayloadImpl(
      {@JsonKey(includeIfNull: false, name: 'full_name') this.fullName,
      @JsonKey(includeIfNull: false, name: 'birth_date') this.birthDate,
      @JsonKey(includeIfNull: false, name: 'city_id') this.cityId,
      @JsonKey(includeIfNull: false) this.phone,
      @JsonKey(includeIfNull: false) this.password,
      @JsonKey(includeIfNull: false, name: 'password_confirmation')
      this.passwordConfirmation,
      @JsonKey(includeIfNull: false, name: 'device_type') this.deviceType,
      @JsonKey(includeIfNull: false, name: 'device_token') this.deviceToken});

  factory _$UserPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPayloadImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false, name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(includeIfNull: false, name: 'birth_date')
  final String? birthDate;
  @override
  @JsonKey(includeIfNull: false, name: 'city_id')
  final int? cityId;
  @override
  @JsonKey(includeIfNull: false)
  final String? phone;
  @override
  @JsonKey(includeIfNull: false)
  final String? password;
  @override
  @JsonKey(includeIfNull: false, name: 'password_confirmation')
  final String? passwordConfirmation;
  @override
  @JsonKey(includeIfNull: false, name: 'device_type')
  final String? deviceType;
  @override
  @JsonKey(includeIfNull: false, name: 'device_token')
  final String? deviceToken;

  @override
  String toString() {
    return 'UserPayload(fullName: $fullName, birthDate: $birthDate, cityId: $cityId, phone: $phone, password: $password, passwordConfirmation: $passwordConfirmation, deviceType: $deviceType, deviceToken: $deviceToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPayloadImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, birthDate, cityId,
      phone, password, passwordConfirmation, deviceType, deviceToken);

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPayloadImplCopyWith<_$UserPayloadImpl> get copyWith =>
      __$$UserPayloadImplCopyWithImpl<_$UserPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPayloadImplToJson(
      this,
    );
  }
}

abstract class _UserPayload implements UserPayload {
  const factory _UserPayload(
      {@JsonKey(includeIfNull: false, name: 'full_name') final String? fullName,
      @JsonKey(includeIfNull: false, name: 'birth_date')
      final String? birthDate,
      @JsonKey(includeIfNull: false, name: 'city_id') final int? cityId,
      @JsonKey(includeIfNull: false) final String? phone,
      @JsonKey(includeIfNull: false) final String? password,
      @JsonKey(includeIfNull: false, name: 'password_confirmation')
      final String? passwordConfirmation,
      @JsonKey(includeIfNull: false, name: 'device_type')
      final String? deviceType,
      @JsonKey(includeIfNull: false, name: 'device_token')
      final String? deviceToken}) = _$UserPayloadImpl;

  factory _UserPayload.fromJson(Map<String, dynamic> json) =
      _$UserPayloadImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false, name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(includeIfNull: false, name: 'birth_date')
  String? get birthDate;
  @override
  @JsonKey(includeIfNull: false, name: 'city_id')
  int? get cityId;
  @override
  @JsonKey(includeIfNull: false)
  String? get phone;
  @override
  @JsonKey(includeIfNull: false)
  String? get password;
  @override
  @JsonKey(includeIfNull: false, name: 'password_confirmation')
  String? get passwordConfirmation;
  @override
  @JsonKey(includeIfNull: false, name: 'device_type')
  String? get deviceType;
  @override
  @JsonKey(includeIfNull: false, name: 'device_token')
  String? get deviceToken;

  /// Create a copy of UserPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPayloadImplCopyWith<_$UserPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
