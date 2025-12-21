// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MainDTO _$MainDTOFromJson(Map<String, dynamic> json) {
  return _MainDTO.fromJson(json);
}

/// @nodoc
mixin _$MainDTO {
  List<CategoryDTO>? get categories => throw _privateConstructorUsedError;
  List<CentersDTO>? get centers => throw _privateConstructorUsedError;

  /// Serializes this MainDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MainDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainDTOCopyWith<MainDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainDTOCopyWith<$Res> {
  factory $MainDTOCopyWith(MainDTO value, $Res Function(MainDTO) then) =
      _$MainDTOCopyWithImpl<$Res, MainDTO>;
  @useResult
  $Res call({List<CategoryDTO>? categories, List<CentersDTO>? centers});
}

/// @nodoc
class _$MainDTOCopyWithImpl<$Res, $Val extends MainDTO>
    implements $MainDTOCopyWith<$Res> {
  _$MainDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? centers = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>?,
      centers: freezed == centers
          ? _value.centers
          : centers // ignore: cast_nullable_to_non_nullable
              as List<CentersDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainDTOImplCopyWith<$Res> implements $MainDTOCopyWith<$Res> {
  factory _$$MainDTOImplCopyWith(
          _$MainDTOImpl value, $Res Function(_$MainDTOImpl) then) =
      __$$MainDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryDTO>? categories, List<CentersDTO>? centers});
}

/// @nodoc
class __$$MainDTOImplCopyWithImpl<$Res>
    extends _$MainDTOCopyWithImpl<$Res, _$MainDTOImpl>
    implements _$$MainDTOImplCopyWith<$Res> {
  __$$MainDTOImplCopyWithImpl(
      _$MainDTOImpl _value, $Res Function(_$MainDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? centers = freezed,
  }) {
    return _then(_$MainDTOImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>?,
      centers: freezed == centers
          ? _value._centers
          : centers // ignore: cast_nullable_to_non_nullable
              as List<CentersDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainDTOImpl implements _MainDTO {
  const _$MainDTOImpl(
      {final List<CategoryDTO>? categories, final List<CentersDTO>? centers})
      : _categories = categories,
        _centers = centers;

  factory _$MainDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainDTOImplFromJson(json);

  final List<CategoryDTO>? _categories;
  @override
  List<CategoryDTO>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CentersDTO>? _centers;
  @override
  List<CentersDTO>? get centers {
    final value = _centers;
    if (value == null) return null;
    if (_centers is EqualUnmodifiableListView) return _centers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MainDTO(categories: $categories, centers: $centers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainDTOImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._centers, _centers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_centers));

  /// Create a copy of MainDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainDTOImplCopyWith<_$MainDTOImpl> get copyWith =>
      __$$MainDTOImplCopyWithImpl<_$MainDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainDTOImplToJson(
      this,
    );
  }
}

abstract class _MainDTO implements MainDTO {
  const factory _MainDTO(
      {final List<CategoryDTO>? categories,
      final List<CentersDTO>? centers}) = _$MainDTOImpl;

  factory _MainDTO.fromJson(Map<String, dynamic> json) = _$MainDTOImpl.fromJson;

  @override
  List<CategoryDTO>? get categories;
  @override
  List<CentersDTO>? get centers;

  /// Create a copy of MainDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainDTOImplCopyWith<_$MainDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) {
  return _CategoryDTO.fromJson(json);
}

/// @nodoc
mixin _$CategoryDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CategoryDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDTOCopyWith<CategoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDTOCopyWith<$Res> {
  factory $CategoryDTOCopyWith(
          CategoryDTO value, $Res Function(CategoryDTO) then) =
      _$CategoryDTOCopyWithImpl<$Res, CategoryDTO>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? color,
      String? description,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$CategoryDTOCopyWithImpl<$Res, $Val extends CategoryDTO>
    implements $CategoryDTOCopyWith<$Res> {
  _$CategoryDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? color = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CategoryDTOImplCopyWith<$Res>
    implements $CategoryDTOCopyWith<$Res> {
  factory _$$CategoryDTOImplCopyWith(
          _$CategoryDTOImpl value, $Res Function(_$CategoryDTOImpl) then) =
      __$$CategoryDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? color,
      String? description,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$CategoryDTOImplCopyWithImpl<$Res>
    extends _$CategoryDTOCopyWithImpl<$Res, _$CategoryDTOImpl>
    implements _$$CategoryDTOImplCopyWith<$Res> {
  __$$CategoryDTOImplCopyWithImpl(
      _$CategoryDTOImpl _value, $Res Function(_$CategoryDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? color = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CategoryDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
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
class _$CategoryDTOImpl implements _CategoryDTO {
  const _$CategoryDTOImpl(
      {this.id,
      this.title,
      this.color,
      this.description,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$CategoryDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? color;
  @override
  final String? description;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'CategoryDTO(id: $id, title: $title, color: $color, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, color, description, createdAt, updatedAt);

  /// Create a copy of CategoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDTOImplCopyWith<_$CategoryDTOImpl> get copyWith =>
      __$$CategoryDTOImplCopyWithImpl<_$CategoryDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDTOImplToJson(
      this,
    );
  }
}

abstract class _CategoryDTO implements CategoryDTO {
  const factory _CategoryDTO(
          {final int? id,
          final String? title,
          final String? color,
          final String? description,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt}) =
      _$CategoryDTOImpl;

  factory _CategoryDTO.fromJson(Map<String, dynamic> json) =
      _$CategoryDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get color;
  @override
  String? get description;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of CategoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDTOImplCopyWith<_$CategoryDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CentersDTO _$CentersDTOFromJson(Map<String, dynamic> json) {
  return _CentersDTO.fromJson(json);
}

/// @nodoc
mixin _$CentersDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get banner => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  int? get isActivet => throw _privateConstructorUsedError;
  List<BannerDTO>? get banners => throw _privateConstructorUsedError;
  List<ActivityDTO>? get activities => throw _privateConstructorUsedError;

  /// Serializes this CentersDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CentersDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CentersDTOCopyWith<CentersDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CentersDTOCopyWith<$Res> {
  factory $CentersDTOCopyWith(
          CentersDTO value, $Res Function(CentersDTO) then) =
      _$CentersDTOCopyWithImpl<$Res, CentersDTO>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      String? description,
      double? latitude,
      double? longitude,
      String? logo,
      String? banner,
      String? color,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'is_active') int? isActivet,
      List<BannerDTO>? banners,
      List<ActivityDTO>? activities});
}

/// @nodoc
class _$CentersDTOCopyWithImpl<$Res, $Val extends CentersDTO>
    implements $CentersDTOCopyWith<$Res> {
  _$CentersDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CentersDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? description = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? logo = freezed,
    Object? banner = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActivet = freezed,
    Object? banners = freezed,
    Object? activities = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: freezed == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isActivet: freezed == isActivet
          ? _value.isActivet
          : isActivet // ignore: cast_nullable_to_non_nullable
              as int?,
      banners: freezed == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerDTO>?,
      activities: freezed == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<ActivityDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CentersDTOImplCopyWith<$Res>
    implements $CentersDTOCopyWith<$Res> {
  factory _$$CentersDTOImplCopyWith(
          _$CentersDTOImpl value, $Res Function(_$CentersDTOImpl) then) =
      __$$CentersDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      String? description,
      double? latitude,
      double? longitude,
      String? logo,
      String? banner,
      String? color,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'is_active') int? isActivet,
      List<BannerDTO>? banners,
      List<ActivityDTO>? activities});
}

/// @nodoc
class __$$CentersDTOImplCopyWithImpl<$Res>
    extends _$CentersDTOCopyWithImpl<$Res, _$CentersDTOImpl>
    implements _$$CentersDTOImplCopyWith<$Res> {
  __$$CentersDTOImplCopyWithImpl(
      _$CentersDTOImpl _value, $Res Function(_$CentersDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CentersDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? description = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? logo = freezed,
    Object? banner = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActivet = freezed,
    Object? banners = freezed,
    Object? activities = freezed,
  }) {
    return _then(_$CentersDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: freezed == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isActivet: freezed == isActivet
          ? _value.isActivet
          : isActivet // ignore: cast_nullable_to_non_nullable
              as int?,
      banners: freezed == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerDTO>?,
      activities: freezed == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<ActivityDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CentersDTOImpl implements _CentersDTO {
  const _$CentersDTOImpl(
      {this.id,
      this.name,
      this.address,
      this.description,
      this.latitude,
      this.longitude,
      this.logo,
      this.banner,
      this.color,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'is_active') this.isActivet,
      final List<BannerDTO>? banners,
      final List<ActivityDTO>? activities})
      : _banners = banners,
        _activities = activities;

  factory _$CentersDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CentersDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? description;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? logo;
  @override
  final String? banner;
  @override
  final String? color;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'is_active')
  final int? isActivet;
  final List<BannerDTO>? _banners;
  @override
  List<BannerDTO>? get banners {
    final value = _banners;
    if (value == null) return null;
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ActivityDTO>? _activities;
  @override
  List<ActivityDTO>? get activities {
    final value = _activities;
    if (value == null) return null;
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CentersDTO(id: $id, name: $name, address: $address, description: $description, latitude: $latitude, longitude: $longitude, logo: $logo, banner: $banner, color: $color, createdAt: $createdAt, updatedAt: $updatedAt, isActivet: $isActivet, banners: $banners, activities: $activities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CentersDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.banner, banner) || other.banner == banner) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActivet, isActivet) ||
                other.isActivet == isActivet) &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      description,
      latitude,
      longitude,
      logo,
      banner,
      color,
      createdAt,
      updatedAt,
      isActivet,
      const DeepCollectionEquality().hash(_banners),
      const DeepCollectionEquality().hash(_activities));

  /// Create a copy of CentersDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CentersDTOImplCopyWith<_$CentersDTOImpl> get copyWith =>
      __$$CentersDTOImplCopyWithImpl<_$CentersDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CentersDTOImplToJson(
      this,
    );
  }
}

abstract class _CentersDTO implements CentersDTO {
  const factory _CentersDTO(
      {final int? id,
      final String? name,
      final String? address,
      final String? description,
      final double? latitude,
      final double? longitude,
      final String? logo,
      final String? banner,
      final String? color,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      @JsonKey(name: 'is_active') final int? isActivet,
      final List<BannerDTO>? banners,
      final List<ActivityDTO>? activities}) = _$CentersDTOImpl;

  factory _CentersDTO.fromJson(Map<String, dynamic> json) =
      _$CentersDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get description;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get logo;
  @override
  String? get banner;
  @override
  String? get color;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'is_active')
  int? get isActivet;
  @override
  List<BannerDTO>? get banners;
  @override
  List<ActivityDTO>? get activities;

  /// Create a copy of CentersDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CentersDTOImplCopyWith<_$CentersDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BannerDTO _$BannerDTOFromJson(Map<String, dynamic> json) {
  return _BannerDTO.fromJson(json);
}

/// @nodoc
mixin _$BannerDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this BannerDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BannerDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BannerDTOCopyWith<BannerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerDTOCopyWith<$Res> {
  factory $BannerDTOCopyWith(BannerDTO value, $Res Function(BannerDTO) then) =
      _$BannerDTOCopyWithImpl<$Res, BannerDTO>;
  @useResult
  $Res call({int? id, String? title, String? image});
}

/// @nodoc
class _$BannerDTOCopyWithImpl<$Res, $Val extends BannerDTO>
    implements $BannerDTOCopyWith<$Res> {
  _$BannerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannerDTOImplCopyWith<$Res>
    implements $BannerDTOCopyWith<$Res> {
  factory _$$BannerDTOImplCopyWith(
          _$BannerDTOImpl value, $Res Function(_$BannerDTOImpl) then) =
      __$$BannerDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? title, String? image});
}

/// @nodoc
class __$$BannerDTOImplCopyWithImpl<$Res>
    extends _$BannerDTOCopyWithImpl<$Res, _$BannerDTOImpl>
    implements _$$BannerDTOImplCopyWith<$Res> {
  __$$BannerDTOImplCopyWithImpl(
      _$BannerDTOImpl _value, $Res Function(_$BannerDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
  }) {
    return _then(_$BannerDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BannerDTOImpl implements _BannerDTO {
  const _$BannerDTOImpl({this.id, this.title, this.image});

  factory _$BannerDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? image;

  @override
  String toString() {
    return 'BannerDTO(id: $id, title: $title, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, image);

  /// Create a copy of BannerDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerDTOImplCopyWith<_$BannerDTOImpl> get copyWith =>
      __$$BannerDTOImplCopyWithImpl<_$BannerDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerDTOImplToJson(
      this,
    );
  }
}

abstract class _BannerDTO implements BannerDTO {
  const factory _BannerDTO(
      {final int? id,
      final String? title,
      final String? image}) = _$BannerDTOImpl;

  factory _BannerDTO.fromJson(Map<String, dynamic> json) =
      _$BannerDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get image;

  /// Create a copy of BannerDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerDTOImplCopyWith<_$BannerDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
