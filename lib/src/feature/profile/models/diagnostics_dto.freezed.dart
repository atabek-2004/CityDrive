// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnostics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AvailableDiagnosticsDTO _$AvailableDiagnosticsDTOFromJson(
    Map<String, dynamic> json) {
  return _AvailableDiagnosticsDTO.fromJson(json);
}

/// @nodoc
mixin _$AvailableDiagnosticsDTO {
  @JsonKey(name: 'can_take_diagnostic')
  bool? get canTakeDiagnostic => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_remaining')
  int? get daysRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_diagnostic_date')
  String? get lastDiagnosticDate => throw _privateConstructorUsedError;

  /// Serializes this AvailableDiagnosticsDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableDiagnosticsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableDiagnosticsDTOCopyWith<AvailableDiagnosticsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableDiagnosticsDTOCopyWith<$Res> {
  factory $AvailableDiagnosticsDTOCopyWith(AvailableDiagnosticsDTO value,
          $Res Function(AvailableDiagnosticsDTO) then) =
      _$AvailableDiagnosticsDTOCopyWithImpl<$Res, AvailableDiagnosticsDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'can_take_diagnostic') bool? canTakeDiagnostic,
      @JsonKey(name: 'days_remaining') int? daysRemaining,
      @JsonKey(name: 'last_diagnostic_date') String? lastDiagnosticDate});
}

/// @nodoc
class _$AvailableDiagnosticsDTOCopyWithImpl<$Res,
        $Val extends AvailableDiagnosticsDTO>
    implements $AvailableDiagnosticsDTOCopyWith<$Res> {
  _$AvailableDiagnosticsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableDiagnosticsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canTakeDiagnostic = freezed,
    Object? daysRemaining = freezed,
    Object? lastDiagnosticDate = freezed,
  }) {
    return _then(_value.copyWith(
      canTakeDiagnostic: freezed == canTakeDiagnostic
          ? _value.canTakeDiagnostic
          : canTakeDiagnostic // ignore: cast_nullable_to_non_nullable
              as bool?,
      daysRemaining: freezed == daysRemaining
          ? _value.daysRemaining
          : daysRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
      lastDiagnosticDate: freezed == lastDiagnosticDate
          ? _value.lastDiagnosticDate
          : lastDiagnosticDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailableDiagnosticsDTOImplCopyWith<$Res>
    implements $AvailableDiagnosticsDTOCopyWith<$Res> {
  factory _$$AvailableDiagnosticsDTOImplCopyWith(
          _$AvailableDiagnosticsDTOImpl value,
          $Res Function(_$AvailableDiagnosticsDTOImpl) then) =
      __$$AvailableDiagnosticsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'can_take_diagnostic') bool? canTakeDiagnostic,
      @JsonKey(name: 'days_remaining') int? daysRemaining,
      @JsonKey(name: 'last_diagnostic_date') String? lastDiagnosticDate});
}

/// @nodoc
class __$$AvailableDiagnosticsDTOImplCopyWithImpl<$Res>
    extends _$AvailableDiagnosticsDTOCopyWithImpl<$Res,
        _$AvailableDiagnosticsDTOImpl>
    implements _$$AvailableDiagnosticsDTOImplCopyWith<$Res> {
  __$$AvailableDiagnosticsDTOImplCopyWithImpl(
      _$AvailableDiagnosticsDTOImpl _value,
      $Res Function(_$AvailableDiagnosticsDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailableDiagnosticsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canTakeDiagnostic = freezed,
    Object? daysRemaining = freezed,
    Object? lastDiagnosticDate = freezed,
  }) {
    return _then(_$AvailableDiagnosticsDTOImpl(
      canTakeDiagnostic: freezed == canTakeDiagnostic
          ? _value.canTakeDiagnostic
          : canTakeDiagnostic // ignore: cast_nullable_to_non_nullable
              as bool?,
      daysRemaining: freezed == daysRemaining
          ? _value.daysRemaining
          : daysRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
      lastDiagnosticDate: freezed == lastDiagnosticDate
          ? _value.lastDiagnosticDate
          : lastDiagnosticDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableDiagnosticsDTOImpl implements _AvailableDiagnosticsDTO {
  const _$AvailableDiagnosticsDTOImpl(
      {@JsonKey(name: 'can_take_diagnostic') this.canTakeDiagnostic,
      @JsonKey(name: 'days_remaining') this.daysRemaining,
      @JsonKey(name: 'last_diagnostic_date') this.lastDiagnosticDate});

  factory _$AvailableDiagnosticsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableDiagnosticsDTOImplFromJson(json);

  @override
  @JsonKey(name: 'can_take_diagnostic')
  final bool? canTakeDiagnostic;
  @override
  @JsonKey(name: 'days_remaining')
  final int? daysRemaining;
  @override
  @JsonKey(name: 'last_diagnostic_date')
  final String? lastDiagnosticDate;

  @override
  String toString() {
    return 'AvailableDiagnosticsDTO(canTakeDiagnostic: $canTakeDiagnostic, daysRemaining: $daysRemaining, lastDiagnosticDate: $lastDiagnosticDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableDiagnosticsDTOImpl &&
            (identical(other.canTakeDiagnostic, canTakeDiagnostic) ||
                other.canTakeDiagnostic == canTakeDiagnostic) &&
            (identical(other.daysRemaining, daysRemaining) ||
                other.daysRemaining == daysRemaining) &&
            (identical(other.lastDiagnosticDate, lastDiagnosticDate) ||
                other.lastDiagnosticDate == lastDiagnosticDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, canTakeDiagnostic, daysRemaining, lastDiagnosticDate);

  /// Create a copy of AvailableDiagnosticsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableDiagnosticsDTOImplCopyWith<_$AvailableDiagnosticsDTOImpl>
      get copyWith => __$$AvailableDiagnosticsDTOImplCopyWithImpl<
          _$AvailableDiagnosticsDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableDiagnosticsDTOImplToJson(
      this,
    );
  }
}

abstract class _AvailableDiagnosticsDTO implements AvailableDiagnosticsDTO {
  const factory _AvailableDiagnosticsDTO(
      {@JsonKey(name: 'can_take_diagnostic') final bool? canTakeDiagnostic,
      @JsonKey(name: 'days_remaining') final int? daysRemaining,
      @JsonKey(name: 'last_diagnostic_date')
      final String? lastDiagnosticDate}) = _$AvailableDiagnosticsDTOImpl;

  factory _AvailableDiagnosticsDTO.fromJson(Map<String, dynamic> json) =
      _$AvailableDiagnosticsDTOImpl.fromJson;

  @override
  @JsonKey(name: 'can_take_diagnostic')
  bool? get canTakeDiagnostic;
  @override
  @JsonKey(name: 'days_remaining')
  int? get daysRemaining;
  @override
  @JsonKey(name: 'last_diagnostic_date')
  String? get lastDiagnosticDate;

  /// Create a copy of AvailableDiagnosticsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableDiagnosticsDTOImplCopyWith<_$AvailableDiagnosticsDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DiagnosticsQuestionsDTO _$DiagnosticsQuestionsDTOFromJson(
    Map<String, dynamic> json) {
  return _DiagnosticsQuestionsDTO.fromJson(json);
}

/// @nodoc
mixin _$DiagnosticsQuestionsDTO {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'diagnostic_id')
  int? get diagnosticId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  List<DiagnosticsImageDTO>? get images => throw _privateConstructorUsedError;

  /// Serializes this DiagnosticsQuestionsDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiagnosticsQuestionsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosticsQuestionsDTOCopyWith<DiagnosticsQuestionsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosticsQuestionsDTOCopyWith<$Res> {
  factory $DiagnosticsQuestionsDTOCopyWith(DiagnosticsQuestionsDTO value,
          $Res Function(DiagnosticsQuestionsDTO) then) =
      _$DiagnosticsQuestionsDTOCopyWithImpl<$Res, DiagnosticsQuestionsDTO>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'diagnostic_id') int? diagnosticId,
      String? title,
      String? description,
      int? order,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      List<DiagnosticsImageDTO>? images});
}

/// @nodoc
class _$DiagnosticsQuestionsDTOCopyWithImpl<$Res,
        $Val extends DiagnosticsQuestionsDTO>
    implements $DiagnosticsQuestionsDTOCopyWith<$Res> {
  _$DiagnosticsQuestionsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagnosticsQuestionsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? diagnosticId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? order = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      diagnosticId: freezed == diagnosticId
          ? _value.diagnosticId
          : diagnosticId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DiagnosticsImageDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiagnosticsQuestionsDTOImplCopyWith<$Res>
    implements $DiagnosticsQuestionsDTOCopyWith<$Res> {
  factory _$$DiagnosticsQuestionsDTOImplCopyWith(
          _$DiagnosticsQuestionsDTOImpl value,
          $Res Function(_$DiagnosticsQuestionsDTOImpl) then) =
      __$$DiagnosticsQuestionsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'diagnostic_id') int? diagnosticId,
      String? title,
      String? description,
      int? order,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      List<DiagnosticsImageDTO>? images});
}

/// @nodoc
class __$$DiagnosticsQuestionsDTOImplCopyWithImpl<$Res>
    extends _$DiagnosticsQuestionsDTOCopyWithImpl<$Res,
        _$DiagnosticsQuestionsDTOImpl>
    implements _$$DiagnosticsQuestionsDTOImplCopyWith<$Res> {
  __$$DiagnosticsQuestionsDTOImplCopyWithImpl(
      _$DiagnosticsQuestionsDTOImpl _value,
      $Res Function(_$DiagnosticsQuestionsDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagnosticsQuestionsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? diagnosticId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? order = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? images = freezed,
  }) {
    return _then(_$DiagnosticsQuestionsDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      diagnosticId: freezed == diagnosticId
          ? _value.diagnosticId
          : diagnosticId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DiagnosticsImageDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosticsQuestionsDTOImpl implements _DiagnosticsQuestionsDTO {
  const _$DiagnosticsQuestionsDTOImpl(
      {this.id,
      @JsonKey(name: 'diagnostic_id') this.diagnosticId,
      this.title,
      this.description,
      this.order,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      final List<DiagnosticsImageDTO>? images})
      : _images = images;

  factory _$DiagnosticsQuestionsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosticsQuestionsDTOImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'diagnostic_id')
  final int? diagnosticId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? order;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final List<DiagnosticsImageDTO>? _images;
  @override
  List<DiagnosticsImageDTO>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DiagnosticsQuestionsDTO(id: $id, diagnosticId: $diagnosticId, title: $title, description: $description, order: $order, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosticsQuestionsDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.diagnosticId, diagnosticId) ||
                other.diagnosticId == diagnosticId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      diagnosticId,
      title,
      description,
      order,
      isActive,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_images));

  /// Create a copy of DiagnosticsQuestionsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosticsQuestionsDTOImplCopyWith<_$DiagnosticsQuestionsDTOImpl>
      get copyWith => __$$DiagnosticsQuestionsDTOImplCopyWithImpl<
          _$DiagnosticsQuestionsDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosticsQuestionsDTOImplToJson(
      this,
    );
  }
}

abstract class _DiagnosticsQuestionsDTO implements DiagnosticsQuestionsDTO {
  const factory _DiagnosticsQuestionsDTO(
      {final int? id,
      @JsonKey(name: 'diagnostic_id') final int? diagnosticId,
      final String? title,
      final String? description,
      final int? order,
      @JsonKey(name: 'is_active') final bool? isActive,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final List<DiagnosticsImageDTO>? images}) = _$DiagnosticsQuestionsDTOImpl;

  factory _DiagnosticsQuestionsDTO.fromJson(Map<String, dynamic> json) =
      _$DiagnosticsQuestionsDTOImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'diagnostic_id')
  int? get diagnosticId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  int? get order;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  List<DiagnosticsImageDTO>? get images;

  /// Create a copy of DiagnosticsQuestionsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosticsQuestionsDTOImplCopyWith<_$DiagnosticsQuestionsDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DiagnosticsImageDTO _$DiagnosticsImageDTOFromJson(Map<String, dynamic> json) {
  return _DiagnosticsImageDTO.fromJson(json);
}

/// @nodoc
mixin _$DiagnosticsImageDTO {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'diagnostic_id')
  int? get diagnosticId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  int? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DiagnosticsImageDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiagnosticsImageDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosticsImageDTOCopyWith<DiagnosticsImageDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosticsImageDTOCopyWith<$Res> {
  factory $DiagnosticsImageDTOCopyWith(
          DiagnosticsImageDTO value, $Res Function(DiagnosticsImageDTO) then) =
      _$DiagnosticsImageDTOCopyWithImpl<$Res, DiagnosticsImageDTO>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'diagnostic_id') int? diagnosticId,
      @JsonKey(name: 'question_id') int? questionId,
      @JsonKey(name: 'image_url') String? imageUrl,
      String? description,
      int? order,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$DiagnosticsImageDTOCopyWithImpl<$Res, $Val extends DiagnosticsImageDTO>
    implements $DiagnosticsImageDTOCopyWith<$Res> {
  _$DiagnosticsImageDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagnosticsImageDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? diagnosticId = freezed,
    Object? questionId = freezed,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? order = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      diagnosticId: freezed == diagnosticId
          ? _value.diagnosticId
          : diagnosticId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$DiagnosticsImageDTOImplCopyWith<$Res>
    implements $DiagnosticsImageDTOCopyWith<$Res> {
  factory _$$DiagnosticsImageDTOImplCopyWith(_$DiagnosticsImageDTOImpl value,
          $Res Function(_$DiagnosticsImageDTOImpl) then) =
      __$$DiagnosticsImageDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'diagnostic_id') int? diagnosticId,
      @JsonKey(name: 'question_id') int? questionId,
      @JsonKey(name: 'image_url') String? imageUrl,
      String? description,
      int? order,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$DiagnosticsImageDTOImplCopyWithImpl<$Res>
    extends _$DiagnosticsImageDTOCopyWithImpl<$Res, _$DiagnosticsImageDTOImpl>
    implements _$$DiagnosticsImageDTOImplCopyWith<$Res> {
  __$$DiagnosticsImageDTOImplCopyWithImpl(_$DiagnosticsImageDTOImpl _value,
      $Res Function(_$DiagnosticsImageDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagnosticsImageDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? diagnosticId = freezed,
    Object? questionId = freezed,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? order = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DiagnosticsImageDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      diagnosticId: freezed == diagnosticId
          ? _value.diagnosticId
          : diagnosticId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$DiagnosticsImageDTOImpl implements _DiagnosticsImageDTO {
  const _$DiagnosticsImageDTOImpl(
      {this.id,
      @JsonKey(name: 'diagnostic_id') this.diagnosticId,
      @JsonKey(name: 'question_id') this.questionId,
      @JsonKey(name: 'image_url') this.imageUrl,
      this.description,
      this.order,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$DiagnosticsImageDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosticsImageDTOImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'diagnostic_id')
  final int? diagnosticId;
  @override
  @JsonKey(name: 'question_id')
  final int? questionId;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final String? description;
  @override
  final int? order;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'DiagnosticsImageDTO(id: $id, diagnosticId: $diagnosticId, questionId: $questionId, imageUrl: $imageUrl, description: $description, order: $order, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosticsImageDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.diagnosticId, diagnosticId) ||
                other.diagnosticId == diagnosticId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, diagnosticId, questionId,
      imageUrl, description, order, isActive, createdAt, updatedAt);

  /// Create a copy of DiagnosticsImageDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosticsImageDTOImplCopyWith<_$DiagnosticsImageDTOImpl> get copyWith =>
      __$$DiagnosticsImageDTOImplCopyWithImpl<_$DiagnosticsImageDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosticsImageDTOImplToJson(
      this,
    );
  }
}

abstract class _DiagnosticsImageDTO implements DiagnosticsImageDTO {
  const factory _DiagnosticsImageDTO(
          {final int? id,
          @JsonKey(name: 'diagnostic_id') final int? diagnosticId,
          @JsonKey(name: 'question_id') final int? questionId,
          @JsonKey(name: 'image_url') final String? imageUrl,
          final String? description,
          final int? order,
          @JsonKey(name: 'is_active') final bool? isActive,
          @JsonKey(name: 'created_at') final String? createdAt,
          @JsonKey(name: 'updated_at') final String? updatedAt}) =
      _$DiagnosticsImageDTOImpl;

  factory _DiagnosticsImageDTO.fromJson(Map<String, dynamic> json) =
      _$DiagnosticsImageDTOImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'diagnostic_id')
  int? get diagnosticId;
  @override
  @JsonKey(name: 'question_id')
  int? get questionId;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  String? get description;
  @override
  int? get order;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of DiagnosticsImageDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosticsImageDTOImplCopyWith<_$DiagnosticsImageDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultTestDTO _$ResultTestDTOFromJson(Map<String, dynamic> json) {
  return _ResultTestDTO.fromJson(json);
}

/// @nodoc
mixin _$ResultTestDTO {
  String? get message => throw _privateConstructorUsedError;
  ResultDTO? get result => throw _privateConstructorUsedError;

  /// Serializes this ResultTestDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultTestDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultTestDTOCopyWith<ResultTestDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultTestDTOCopyWith<$Res> {
  factory $ResultTestDTOCopyWith(
          ResultTestDTO value, $Res Function(ResultTestDTO) then) =
      _$ResultTestDTOCopyWithImpl<$Res, ResultTestDTO>;
  @useResult
  $Res call({String? message, ResultDTO? result});

  $ResultDTOCopyWith<$Res>? get result;
}

/// @nodoc
class _$ResultTestDTOCopyWithImpl<$Res, $Val extends ResultTestDTO>
    implements $ResultTestDTOCopyWith<$Res> {
  _$ResultTestDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultTestDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultDTO?,
    ) as $Val);
  }

  /// Create a copy of ResultTestDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultDTOCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $ResultDTOCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultTestDTOImplCopyWith<$Res>
    implements $ResultTestDTOCopyWith<$Res> {
  factory _$$ResultTestDTOImplCopyWith(
          _$ResultTestDTOImpl value, $Res Function(_$ResultTestDTOImpl) then) =
      __$$ResultTestDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, ResultDTO? result});

  @override
  $ResultDTOCopyWith<$Res>? get result;
}

/// @nodoc
class __$$ResultTestDTOImplCopyWithImpl<$Res>
    extends _$ResultTestDTOCopyWithImpl<$Res, _$ResultTestDTOImpl>
    implements _$$ResultTestDTOImplCopyWith<$Res> {
  __$$ResultTestDTOImplCopyWithImpl(
      _$ResultTestDTOImpl _value, $Res Function(_$ResultTestDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResultTestDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? result = freezed,
  }) {
    return _then(_$ResultTestDTOImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultTestDTOImpl implements _ResultTestDTO {
  const _$ResultTestDTOImpl({this.message, this.result});

  factory _$ResultTestDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultTestDTOImplFromJson(json);

  @override
  final String? message;
  @override
  final ResultDTO? result;

  @override
  String toString() {
    return 'ResultTestDTO(message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultTestDTOImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, result);

  /// Create a copy of ResultTestDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultTestDTOImplCopyWith<_$ResultTestDTOImpl> get copyWith =>
      __$$ResultTestDTOImplCopyWithImpl<_$ResultTestDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultTestDTOImplToJson(
      this,
    );
  }
}

abstract class _ResultTestDTO implements ResultTestDTO {
  const factory _ResultTestDTO(
      {final String? message, final ResultDTO? result}) = _$ResultTestDTOImpl;

  factory _ResultTestDTO.fromJson(Map<String, dynamic> json) =
      _$ResultTestDTOImpl.fromJson;

  @override
  String? get message;
  @override
  ResultDTO? get result;

  /// Create a copy of ResultTestDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultTestDTOImplCopyWith<_$ResultTestDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultDTO _$ResultDTOFromJson(Map<String, dynamic> json) {
  return _ResultDTO.fromJson(json);
}

/// @nodoc
mixin _$ResultDTO {
  int? get id => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'personality_type')
  PersonalityTypeDTO? get personalityType => throw _privateConstructorUsedError;

  /// Serializes this ResultDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultDTOCopyWith<ResultDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDTOCopyWith<$Res> {
  factory $ResultDTOCopyWith(ResultDTO value, $Res Function(ResultDTO) then) =
      _$ResultDTOCopyWithImpl<$Res, ResultDTO>;
  @useResult
  $Res call(
      {int? id,
      int? score,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'personality_type') PersonalityTypeDTO? personalityType});

  $PersonalityTypeDTOCopyWith<$Res>? get personalityType;
}

/// @nodoc
class _$ResultDTOCopyWithImpl<$Res, $Val extends ResultDTO>
    implements $ResultDTOCopyWith<$Res> {
  _$ResultDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? score = freezed,
    Object? createdAt = freezed,
    Object? personalityType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      personalityType: freezed == personalityType
          ? _value.personalityType
          : personalityType // ignore: cast_nullable_to_non_nullable
              as PersonalityTypeDTO?,
    ) as $Val);
  }

  /// Create a copy of ResultDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonalityTypeDTOCopyWith<$Res>? get personalityType {
    if (_value.personalityType == null) {
      return null;
    }

    return $PersonalityTypeDTOCopyWith<$Res>(_value.personalityType!, (value) {
      return _then(_value.copyWith(personalityType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultDTOImplCopyWith<$Res>
    implements $ResultDTOCopyWith<$Res> {
  factory _$$ResultDTOImplCopyWith(
          _$ResultDTOImpl value, $Res Function(_$ResultDTOImpl) then) =
      __$$ResultDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? score,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'personality_type') PersonalityTypeDTO? personalityType});

  @override
  $PersonalityTypeDTOCopyWith<$Res>? get personalityType;
}

/// @nodoc
class __$$ResultDTOImplCopyWithImpl<$Res>
    extends _$ResultDTOCopyWithImpl<$Res, _$ResultDTOImpl>
    implements _$$ResultDTOImplCopyWith<$Res> {
  __$$ResultDTOImplCopyWithImpl(
      _$ResultDTOImpl _value, $Res Function(_$ResultDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResultDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? score = freezed,
    Object? createdAt = freezed,
    Object? personalityType = freezed,
  }) {
    return _then(_$ResultDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      personalityType: freezed == personalityType
          ? _value.personalityType
          : personalityType // ignore: cast_nullable_to_non_nullable
              as PersonalityTypeDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDTOImpl implements _ResultDTO {
  const _$ResultDTOImpl(
      {this.id,
      this.score,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'personality_type') this.personalityType});

  factory _$ResultDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final int? score;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'personality_type')
  final PersonalityTypeDTO? personalityType;

  @override
  String toString() {
    return 'ResultDTO(id: $id, score: $score, createdAt: $createdAt, personalityType: $personalityType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.personalityType, personalityType) ||
                other.personalityType == personalityType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, score, createdAt, personalityType);

  /// Create a copy of ResultDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDTOImplCopyWith<_$ResultDTOImpl> get copyWith =>
      __$$ResultDTOImplCopyWithImpl<_$ResultDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDTOImplToJson(
      this,
    );
  }
}

abstract class _ResultDTO implements ResultDTO {
  const factory _ResultDTO(
      {final int? id,
      final int? score,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'personality_type')
      final PersonalityTypeDTO? personalityType}) = _$ResultDTOImpl;

  factory _ResultDTO.fromJson(Map<String, dynamic> json) =
      _$ResultDTOImpl.fromJson;

  @override
  int? get id;
  @override
  int? get score;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'personality_type')
  PersonalityTypeDTO? get personalityType;

  /// Create a copy of ResultDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultDTOImplCopyWith<_$ResultDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalityTypeDTO _$PersonalityTypeDTOFromJson(Map<String, dynamic> json) {
  return _PersonalityTypeDTO.fromJson(json);
}

/// @nodoc
mixin _$PersonalityTypeDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get strengths => throw _privateConstructorUsedError;
  List<String>? get weaknesses => throw _privateConstructorUsedError;
  List<String>? get recommendations => throw _privateConstructorUsedError;

  /// Serializes this PersonalityTypeDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonalityTypeDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalityTypeDTOCopyWith<PersonalityTypeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalityTypeDTOCopyWith<$Res> {
  factory $PersonalityTypeDTOCopyWith(
          PersonalityTypeDTO value, $Res Function(PersonalityTypeDTO) then) =
      _$PersonalityTypeDTOCopyWithImpl<$Res, PersonalityTypeDTO>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      List<String>? strengths,
      List<String>? weaknesses,
      List<String>? recommendations});
}

/// @nodoc
class _$PersonalityTypeDTOCopyWithImpl<$Res, $Val extends PersonalityTypeDTO>
    implements $PersonalityTypeDTOCopyWith<$Res> {
  _$PersonalityTypeDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalityTypeDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? strengths = freezed,
    Object? weaknesses = freezed,
    Object? recommendations = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      strengths: freezed == strengths
          ? _value.strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      weaknesses: freezed == weaknesses
          ? _value.weaknesses
          : weaknesses // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      recommendations: freezed == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalityTypeDTOImplCopyWith<$Res>
    implements $PersonalityTypeDTOCopyWith<$Res> {
  factory _$$PersonalityTypeDTOImplCopyWith(_$PersonalityTypeDTOImpl value,
          $Res Function(_$PersonalityTypeDTOImpl) then) =
      __$$PersonalityTypeDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      List<String>? strengths,
      List<String>? weaknesses,
      List<String>? recommendations});
}

/// @nodoc
class __$$PersonalityTypeDTOImplCopyWithImpl<$Res>
    extends _$PersonalityTypeDTOCopyWithImpl<$Res, _$PersonalityTypeDTOImpl>
    implements _$$PersonalityTypeDTOImplCopyWith<$Res> {
  __$$PersonalityTypeDTOImplCopyWithImpl(_$PersonalityTypeDTOImpl _value,
      $Res Function(_$PersonalityTypeDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonalityTypeDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? strengths = freezed,
    Object? weaknesses = freezed,
    Object? recommendations = freezed,
  }) {
    return _then(_$PersonalityTypeDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      strengths: freezed == strengths
          ? _value._strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      weaknesses: freezed == weaknesses
          ? _value._weaknesses
          : weaknesses // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      recommendations: freezed == recommendations
          ? _value._recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalityTypeDTOImpl implements _PersonalityTypeDTO {
  const _$PersonalityTypeDTOImpl(
      {this.id,
      this.name,
      this.description,
      final List<String>? strengths,
      final List<String>? weaknesses,
      final List<String>? recommendations})
      : _strengths = strengths,
        _weaknesses = weaknesses,
        _recommendations = recommendations;

  factory _$PersonalityTypeDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalityTypeDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  final List<String>? _strengths;
  @override
  List<String>? get strengths {
    final value = _strengths;
    if (value == null) return null;
    if (_strengths is EqualUnmodifiableListView) return _strengths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _weaknesses;
  @override
  List<String>? get weaknesses {
    final value = _weaknesses;
    if (value == null) return null;
    if (_weaknesses is EqualUnmodifiableListView) return _weaknesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _recommendations;
  @override
  List<String>? get recommendations {
    final value = _recommendations;
    if (value == null) return null;
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PersonalityTypeDTO(id: $id, name: $name, description: $description, strengths: $strengths, weaknesses: $weaknesses, recommendations: $recommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalityTypeDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._strengths, _strengths) &&
            const DeepCollectionEquality()
                .equals(other._weaknesses, _weaknesses) &&
            const DeepCollectionEquality()
                .equals(other._recommendations, _recommendations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(_strengths),
      const DeepCollectionEquality().hash(_weaknesses),
      const DeepCollectionEquality().hash(_recommendations));

  /// Create a copy of PersonalityTypeDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalityTypeDTOImplCopyWith<_$PersonalityTypeDTOImpl> get copyWith =>
      __$$PersonalityTypeDTOImplCopyWithImpl<_$PersonalityTypeDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalityTypeDTOImplToJson(
      this,
    );
  }
}

abstract class _PersonalityTypeDTO implements PersonalityTypeDTO {
  const factory _PersonalityTypeDTO(
      {final int? id,
      final String? name,
      final String? description,
      final List<String>? strengths,
      final List<String>? weaknesses,
      final List<String>? recommendations}) = _$PersonalityTypeDTOImpl;

  factory _PersonalityTypeDTO.fromJson(Map<String, dynamic> json) =
      _$PersonalityTypeDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  List<String>? get strengths;
  @override
  List<String>? get weaknesses;
  @override
  List<String>? get recommendations;

  /// Create a copy of PersonalityTypeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalityTypeDTOImplCopyWith<_$PersonalityTypeDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
