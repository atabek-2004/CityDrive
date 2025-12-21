// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BalanceDTO _$BalanceDTOFromJson(Map<String, dynamic> json) {
  return _BalanceDTO.fromJson(json);
}

/// @nodoc
mixin _$BalanceDTO {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_id')
  int? get walletId => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this BalanceDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BalanceDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BalanceDTOCopyWith<BalanceDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceDTOCopyWith<$Res> {
  factory $BalanceDTOCopyWith(
          BalanceDTO value, $Res Function(BalanceDTO) then) =
      _$BalanceDTOCopyWithImpl<$Res, BalanceDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'wallet_id') int? walletId,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$BalanceDTOCopyWithImpl<$Res, $Val extends BalanceDTO>
    implements $BalanceDTOCopyWith<$Res> {
  _$BalanceDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BalanceDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? walletId = freezed,
    Object? amount = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceDTOImplCopyWith<$Res>
    implements $BalanceDTOCopyWith<$Res> {
  factory _$$BalanceDTOImplCopyWith(
          _$BalanceDTOImpl value, $Res Function(_$BalanceDTOImpl) then) =
      __$$BalanceDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'wallet_id') int? walletId,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$BalanceDTOImplCopyWithImpl<$Res>
    extends _$BalanceDTOCopyWithImpl<$Res, _$BalanceDTOImpl>
    implements _$$BalanceDTOImplCopyWith<$Res> {
  __$$BalanceDTOImplCopyWithImpl(
      _$BalanceDTOImpl _value, $Res Function(_$BalanceDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of BalanceDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? walletId = freezed,
    Object? amount = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BalanceDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BalanceDTOImpl implements _BalanceDTO {
  const _$BalanceDTOImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'wallet_id') this.walletId,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$BalanceDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceDTOImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'wallet_id')
  final int? walletId;
  @override
  @JsonKey(name: 'amount')
  final int? amount;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'BalanceDTO(id: $id, walletId: $walletId, amount: $amount, type: $type, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, walletId, amount, type,
      description, createdAt, updatedAt);

  /// Create a copy of BalanceDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceDTOImplCopyWith<_$BalanceDTOImpl> get copyWith =>
      __$$BalanceDTOImplCopyWithImpl<_$BalanceDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceDTOImplToJson(
      this,
    );
  }
}

abstract class _BalanceDTO implements BalanceDTO {
  const factory _BalanceDTO(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'wallet_id') final int? walletId,
      @JsonKey(name: 'amount') final int? amount,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$BalanceDTOImpl;

  factory _BalanceDTO.fromJson(Map<String, dynamic> json) =
      _$BalanceDTOImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'wallet_id')
  int? get walletId;
  @override
  @JsonKey(name: 'amount')
  int? get amount;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of BalanceDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BalanceDTOImplCopyWith<_$BalanceDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
