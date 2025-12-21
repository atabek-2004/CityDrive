// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubscriptionDTO _$SubscriptionDTOFromJson(Map<String, dynamic> json) {
  return _SubscriptionDTO.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionDTO {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @StringToIntConverter()
  int? get price => throw _privateConstructorUsedError;
  @StringToIntConverter()
  @JsonKey(name: 'discounted_price')
  int? get discountedPrice => throw _privateConstructorUsedError;
  @StringToIntConverter()
  @JsonKey(name: 'discount_percent')
  int? get discountPercent => throw _privateConstructorUsedError;
  @StringToIntConverter()
  @JsonKey(name: 'is_active')
  int? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'title_kk')
  String? get titleKK => throw _privateConstructorUsedError;
  @JsonKey(name: 'title_en')
  String? get titleEN => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_months')
  int? get durationMonths => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionDTOCopyWith<SubscriptionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionDTOCopyWith<$Res> {
  factory $SubscriptionDTOCopyWith(
          SubscriptionDTO value, $Res Function(SubscriptionDTO) then) =
      _$SubscriptionDTOCopyWithImpl<$Res, SubscriptionDTO>;
  @useResult
  $Res call(
      {int id,
      String? title,
      @StringToIntConverter() int? price,
      @StringToIntConverter()
      @JsonKey(name: 'discounted_price')
      int? discountedPrice,
      @StringToIntConverter()
      @JsonKey(name: 'discount_percent')
      int? discountPercent,
      @StringToIntConverter() @JsonKey(name: 'is_active') int? isActive,
      @JsonKey(name: 'title_kk') String? titleKK,
      @JsonKey(name: 'title_en') String? titleEN,
      @JsonKey(name: 'duration_months') int? durationMonths,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$SubscriptionDTOCopyWithImpl<$Res, $Val extends SubscriptionDTO>
    implements $SubscriptionDTOCopyWith<$Res> {
  _$SubscriptionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? price = freezed,
    Object? discountedPrice = freezed,
    Object? discountPercent = freezed,
    Object? isActive = freezed,
    Object? titleKK = freezed,
    Object? titleEN = freezed,
    Object? durationMonths = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPercent: freezed == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      titleKK: freezed == titleKK
          ? _value.titleKK
          : titleKK // ignore: cast_nullable_to_non_nullable
              as String?,
      titleEN: freezed == titleEN
          ? _value.titleEN
          : titleEN // ignore: cast_nullable_to_non_nullable
              as String?,
      durationMonths: freezed == durationMonths
          ? _value.durationMonths
          : durationMonths // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$SubscriptionDTOImplCopyWith<$Res>
    implements $SubscriptionDTOCopyWith<$Res> {
  factory _$$SubscriptionDTOImplCopyWith(_$SubscriptionDTOImpl value,
          $Res Function(_$SubscriptionDTOImpl) then) =
      __$$SubscriptionDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? title,
      @StringToIntConverter() int? price,
      @StringToIntConverter()
      @JsonKey(name: 'discounted_price')
      int? discountedPrice,
      @StringToIntConverter()
      @JsonKey(name: 'discount_percent')
      int? discountPercent,
      @StringToIntConverter() @JsonKey(name: 'is_active') int? isActive,
      @JsonKey(name: 'title_kk') String? titleKK,
      @JsonKey(name: 'title_en') String? titleEN,
      @JsonKey(name: 'duration_months') int? durationMonths,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$SubscriptionDTOImplCopyWithImpl<$Res>
    extends _$SubscriptionDTOCopyWithImpl<$Res, _$SubscriptionDTOImpl>
    implements _$$SubscriptionDTOImplCopyWith<$Res> {
  __$$SubscriptionDTOImplCopyWithImpl(
      _$SubscriptionDTOImpl _value, $Res Function(_$SubscriptionDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? price = freezed,
    Object? discountedPrice = freezed,
    Object? discountPercent = freezed,
    Object? isActive = freezed,
    Object? titleKK = freezed,
    Object? titleEN = freezed,
    Object? durationMonths = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SubscriptionDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPercent: freezed == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      titleKK: freezed == titleKK
          ? _value.titleKK
          : titleKK // ignore: cast_nullable_to_non_nullable
              as String?,
      titleEN: freezed == titleEN
          ? _value.titleEN
          : titleEN // ignore: cast_nullable_to_non_nullable
              as String?,
      durationMonths: freezed == durationMonths
          ? _value.durationMonths
          : durationMonths // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$SubscriptionDTOImpl implements _SubscriptionDTO {
  const _$SubscriptionDTOImpl(
      {required this.id,
      this.title,
      @StringToIntConverter() this.price,
      @StringToIntConverter()
      @JsonKey(name: 'discounted_price')
      this.discountedPrice,
      @StringToIntConverter()
      @JsonKey(name: 'discount_percent')
      this.discountPercent,
      @StringToIntConverter() @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'title_kk') this.titleKK,
      @JsonKey(name: 'title_en') this.titleEN,
      @JsonKey(name: 'duration_months') this.durationMonths,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$SubscriptionDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionDTOImplFromJson(json);

  @override
  final int id;
  @override
  final String? title;
  @override
  @StringToIntConverter()
  final int? price;
  @override
  @StringToIntConverter()
  @JsonKey(name: 'discounted_price')
  final int? discountedPrice;
  @override
  @StringToIntConverter()
  @JsonKey(name: 'discount_percent')
  final int? discountPercent;
  @override
  @StringToIntConverter()
  @JsonKey(name: 'is_active')
  final int? isActive;
  @override
  @JsonKey(name: 'title_kk')
  final String? titleKK;
  @override
  @JsonKey(name: 'title_en')
  final String? titleEN;
  @override
  @JsonKey(name: 'duration_months')
  final int? durationMonths;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'SubscriptionDTO(id: $id, title: $title, price: $price, discountedPrice: $discountedPrice, discountPercent: $discountPercent, isActive: $isActive, titleKK: $titleKK, titleEN: $titleEN, durationMonths: $durationMonths, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.titleKK, titleKK) || other.titleKK == titleKK) &&
            (identical(other.titleEN, titleEN) || other.titleEN == titleEN) &&
            (identical(other.durationMonths, durationMonths) ||
                other.durationMonths == durationMonths) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      price,
      discountedPrice,
      discountPercent,
      isActive,
      titleKK,
      titleEN,
      durationMonths,
      createdAt,
      updatedAt);

  /// Create a copy of SubscriptionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionDTOImplCopyWith<_$SubscriptionDTOImpl> get copyWith =>
      __$$SubscriptionDTOImplCopyWithImpl<_$SubscriptionDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionDTOImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionDTO implements SubscriptionDTO {
  const factory _SubscriptionDTO(
      {required final int id,
      final String? title,
      @StringToIntConverter() final int? price,
      @StringToIntConverter()
      @JsonKey(name: 'discounted_price')
      final int? discountedPrice,
      @StringToIntConverter()
      @JsonKey(name: 'discount_percent')
      final int? discountPercent,
      @StringToIntConverter() @JsonKey(name: 'is_active') final int? isActive,
      @JsonKey(name: 'title_kk') final String? titleKK,
      @JsonKey(name: 'title_en') final String? titleEN,
      @JsonKey(name: 'duration_months') final int? durationMonths,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at')
      final String? updatedAt}) = _$SubscriptionDTOImpl;

  factory _SubscriptionDTO.fromJson(Map<String, dynamic> json) =
      _$SubscriptionDTOImpl.fromJson;

  @override
  int get id;
  @override
  String? get title;
  @override
  @StringToIntConverter()
  int? get price;
  @override
  @StringToIntConverter()
  @JsonKey(name: 'discounted_price')
  int? get discountedPrice;
  @override
  @StringToIntConverter()
  @JsonKey(name: 'discount_percent')
  int? get discountPercent;
  @override
  @StringToIntConverter()
  @JsonKey(name: 'is_active')
  int? get isActive;
  @override
  @JsonKey(name: 'title_kk')
  String? get titleKK;
  @override
  @JsonKey(name: 'title_en')
  String? get titleEN;
  @override
  @JsonKey(name: 'duration_months')
  int? get durationMonths;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of SubscriptionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionDTOImplCopyWith<_$SubscriptionDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
