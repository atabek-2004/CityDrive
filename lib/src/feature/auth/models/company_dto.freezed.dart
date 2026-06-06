// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompanyDTO _$CompanyDTOFromJson(Map<String, dynamic> json) {
  return _CompanyDTO.fromJson(json);
}

/// @nodoc
mixin _$CompanyDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get bin => throw _privateConstructorUsedError;
  @JsonKey(name: 'legal_address')
  String get legalAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'founded_year')
  int get foundedYear => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'registration_certificate_url')
  String? get registrationCertificateUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'portfolio_url')
  String? get portfolioUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'submitted_at')
  DateTime? get submittedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CompanyDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompanyDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyDTOCopyWith<CompanyDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyDTOCopyWith<$Res> {
  factory $CompanyDTOCopyWith(
          CompanyDTO value, $Res Function(CompanyDTO) then) =
      _$CompanyDTOCopyWithImpl<$Res, CompanyDTO>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int? userId,
      String name,
      String bin,
      @JsonKey(name: 'legal_address') String legalAddress,
      @JsonKey(name: 'founded_year') int foundedYear,
      String status,
      @JsonKey(name: 'registration_certificate_url')
      String? registrationCertificateUrl,
      @JsonKey(name: 'portfolio_url') String? portfolioUrl,
      @JsonKey(name: 'rejection_reason') String? rejectionReason,
      @JsonKey(name: 'submitted_at') DateTime? submittedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$CompanyDTOCopyWithImpl<$Res, $Val extends CompanyDTO>
    implements $CompanyDTOCopyWith<$Res> {
  _$CompanyDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompanyDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? name = null,
    Object? bin = null,
    Object? legalAddress = null,
    Object? foundedYear = null,
    Object? status = null,
    Object? registrationCertificateUrl = freezed,
    Object? portfolioUrl = freezed,
    Object? rejectionReason = freezed,
    Object? submittedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bin: null == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String,
      legalAddress: null == legalAddress
          ? _value.legalAddress
          : legalAddress // ignore: cast_nullable_to_non_nullable
              as String,
      foundedYear: null == foundedYear
          ? _value.foundedYear
          : foundedYear // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      registrationCertificateUrl: freezed == registrationCertificateUrl
          ? _value.registrationCertificateUrl
          : registrationCertificateUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      portfolioUrl: freezed == portfolioUrl
          ? _value.portfolioUrl
          : portfolioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyDTOImplCopyWith<$Res>
    implements $CompanyDTOCopyWith<$Res> {
  factory _$$CompanyDTOImplCopyWith(
          _$CompanyDTOImpl value, $Res Function(_$CompanyDTOImpl) then) =
      __$$CompanyDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int? userId,
      String name,
      String bin,
      @JsonKey(name: 'legal_address') String legalAddress,
      @JsonKey(name: 'founded_year') int foundedYear,
      String status,
      @JsonKey(name: 'registration_certificate_url')
      String? registrationCertificateUrl,
      @JsonKey(name: 'portfolio_url') String? portfolioUrl,
      @JsonKey(name: 'rejection_reason') String? rejectionReason,
      @JsonKey(name: 'submitted_at') DateTime? submittedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$CompanyDTOImplCopyWithImpl<$Res>
    extends _$CompanyDTOCopyWithImpl<$Res, _$CompanyDTOImpl>
    implements _$$CompanyDTOImplCopyWith<$Res> {
  __$$CompanyDTOImplCopyWithImpl(
      _$CompanyDTOImpl _value, $Res Function(_$CompanyDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompanyDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? name = null,
    Object? bin = null,
    Object? legalAddress = null,
    Object? foundedYear = null,
    Object? status = null,
    Object? registrationCertificateUrl = freezed,
    Object? portfolioUrl = freezed,
    Object? rejectionReason = freezed,
    Object? submittedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CompanyDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bin: null == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String,
      legalAddress: null == legalAddress
          ? _value.legalAddress
          : legalAddress // ignore: cast_nullable_to_non_nullable
              as String,
      foundedYear: null == foundedYear
          ? _value.foundedYear
          : foundedYear // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      registrationCertificateUrl: freezed == registrationCertificateUrl
          ? _value.registrationCertificateUrl
          : registrationCertificateUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      portfolioUrl: freezed == portfolioUrl
          ? _value.portfolioUrl
          : portfolioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyDTOImpl implements _CompanyDTO {
  const _$CompanyDTOImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      required this.name,
      required this.bin,
      @JsonKey(name: 'legal_address') required this.legalAddress,
      @JsonKey(name: 'founded_year') required this.foundedYear,
      required this.status,
      @JsonKey(name: 'registration_certificate_url')
      this.registrationCertificateUrl,
      @JsonKey(name: 'portfolio_url') this.portfolioUrl,
      @JsonKey(name: 'rejection_reason') this.rejectionReason,
      @JsonKey(name: 'submitted_at') this.submittedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$CompanyDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyDTOImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  final String name;
  @override
  final String bin;
  @override
  @JsonKey(name: 'legal_address')
  final String legalAddress;
  @override
  @JsonKey(name: 'founded_year')
  final int foundedYear;
  @override
  final String status;
  @override
  @JsonKey(name: 'registration_certificate_url')
  final String? registrationCertificateUrl;
  @override
  @JsonKey(name: 'portfolio_url')
  final String? portfolioUrl;
  @override
  @JsonKey(name: 'rejection_reason')
  final String? rejectionReason;
  @override
  @JsonKey(name: 'submitted_at')
  final DateTime? submittedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CompanyDTO(id: $id, userId: $userId, name: $name, bin: $bin, legalAddress: $legalAddress, foundedYear: $foundedYear, status: $status, registrationCertificateUrl: $registrationCertificateUrl, portfolioUrl: $portfolioUrl, rejectionReason: $rejectionReason, submittedAt: $submittedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bin, bin) || other.bin == bin) &&
            (identical(other.legalAddress, legalAddress) ||
                other.legalAddress == legalAddress) &&
            (identical(other.foundedYear, foundedYear) ||
                other.foundedYear == foundedYear) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.registrationCertificateUrl,
                    registrationCertificateUrl) ||
                other.registrationCertificateUrl ==
                    registrationCertificateUrl) &&
            (identical(other.portfolioUrl, portfolioUrl) ||
                other.portfolioUrl == portfolioUrl) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
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
      userId,
      name,
      bin,
      legalAddress,
      foundedYear,
      status,
      registrationCertificateUrl,
      portfolioUrl,
      rejectionReason,
      submittedAt,
      createdAt,
      updatedAt);

  /// Create a copy of CompanyDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyDTOImplCopyWith<_$CompanyDTOImpl> get copyWith =>
      __$$CompanyDTOImplCopyWithImpl<_$CompanyDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyDTOImplToJson(
      this,
    );
  }
}

abstract class _CompanyDTO implements CompanyDTO {
  const factory _CompanyDTO(
          {required final int id,
          @JsonKey(name: 'user_id') final int? userId,
          required final String name,
          required final String bin,
          @JsonKey(name: 'legal_address') required final String legalAddress,
          @JsonKey(name: 'founded_year') required final int foundedYear,
          required final String status,
          @JsonKey(name: 'registration_certificate_url')
          final String? registrationCertificateUrl,
          @JsonKey(name: 'portfolio_url') final String? portfolioUrl,
          @JsonKey(name: 'rejection_reason') final String? rejectionReason,
          @JsonKey(name: 'submitted_at') final DateTime? submittedAt,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$CompanyDTOImpl;

  factory _CompanyDTO.fromJson(Map<String, dynamic> json) =
      _$CompanyDTOImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  String get name;
  @override
  String get bin;
  @override
  @JsonKey(name: 'legal_address')
  String get legalAddress;
  @override
  @JsonKey(name: 'founded_year')
  int get foundedYear;
  @override
  String get status;
  @override
  @JsonKey(name: 'registration_certificate_url')
  String? get registrationCertificateUrl;
  @override
  @JsonKey(name: 'portfolio_url')
  String? get portfolioUrl;
  @override
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason;
  @override
  @JsonKey(name: 'submitted_at')
  DateTime? get submittedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of CompanyDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyDTOImplCopyWith<_$CompanyDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CompanyRequest _$CompanyRequestFromJson(Map<String, dynamic> json) {
  return _CompanyRequest.fromJson(json);
}

/// @nodoc
mixin _$CompanyRequest {
  String get name => throw _privateConstructorUsedError;
  String get bin => throw _privateConstructorUsedError;
  @JsonKey(name: 'legal_address')
  String get legalAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'founded_year')
  int get foundedYear => throw _privateConstructorUsedError;

  /// Serializes this CompanyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompanyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyRequestCopyWith<CompanyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyRequestCopyWith<$Res> {
  factory $CompanyRequestCopyWith(
          CompanyRequest value, $Res Function(CompanyRequest) then) =
      _$CompanyRequestCopyWithImpl<$Res, CompanyRequest>;
  @useResult
  $Res call(
      {String name,
      String bin,
      @JsonKey(name: 'legal_address') String legalAddress,
      @JsonKey(name: 'founded_year') int foundedYear});
}

/// @nodoc
class _$CompanyRequestCopyWithImpl<$Res, $Val extends CompanyRequest>
    implements $CompanyRequestCopyWith<$Res> {
  _$CompanyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompanyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? bin = null,
    Object? legalAddress = null,
    Object? foundedYear = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bin: null == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String,
      legalAddress: null == legalAddress
          ? _value.legalAddress
          : legalAddress // ignore: cast_nullable_to_non_nullable
              as String,
      foundedYear: null == foundedYear
          ? _value.foundedYear
          : foundedYear // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyRequestImplCopyWith<$Res>
    implements $CompanyRequestCopyWith<$Res> {
  factory _$$CompanyRequestImplCopyWith(_$CompanyRequestImpl value,
          $Res Function(_$CompanyRequestImpl) then) =
      __$$CompanyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String bin,
      @JsonKey(name: 'legal_address') String legalAddress,
      @JsonKey(name: 'founded_year') int foundedYear});
}

/// @nodoc
class __$$CompanyRequestImplCopyWithImpl<$Res>
    extends _$CompanyRequestCopyWithImpl<$Res, _$CompanyRequestImpl>
    implements _$$CompanyRequestImplCopyWith<$Res> {
  __$$CompanyRequestImplCopyWithImpl(
      _$CompanyRequestImpl _value, $Res Function(_$CompanyRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompanyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? bin = null,
    Object? legalAddress = null,
    Object? foundedYear = null,
  }) {
    return _then(_$CompanyRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bin: null == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String,
      legalAddress: null == legalAddress
          ? _value.legalAddress
          : legalAddress // ignore: cast_nullable_to_non_nullable
              as String,
      foundedYear: null == foundedYear
          ? _value.foundedYear
          : foundedYear // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyRequestImpl implements _CompanyRequest {
  const _$CompanyRequestImpl(
      {required this.name,
      required this.bin,
      @JsonKey(name: 'legal_address') required this.legalAddress,
      @JsonKey(name: 'founded_year') required this.foundedYear});

  factory _$CompanyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String bin;
  @override
  @JsonKey(name: 'legal_address')
  final String legalAddress;
  @override
  @JsonKey(name: 'founded_year')
  final int foundedYear;

  @override
  String toString() {
    return 'CompanyRequest(name: $name, bin: $bin, legalAddress: $legalAddress, foundedYear: $foundedYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bin, bin) || other.bin == bin) &&
            (identical(other.legalAddress, legalAddress) ||
                other.legalAddress == legalAddress) &&
            (identical(other.foundedYear, foundedYear) ||
                other.foundedYear == foundedYear));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, bin, legalAddress, foundedYear);

  /// Create a copy of CompanyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyRequestImplCopyWith<_$CompanyRequestImpl> get copyWith =>
      __$$CompanyRequestImplCopyWithImpl<_$CompanyRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyRequestImplToJson(
      this,
    );
  }
}

abstract class _CompanyRequest implements CompanyRequest {
  const factory _CompanyRequest(
          {required final String name,
          required final String bin,
          @JsonKey(name: 'legal_address') required final String legalAddress,
          @JsonKey(name: 'founded_year') required final int foundedYear}) =
      _$CompanyRequestImpl;

  factory _CompanyRequest.fromJson(Map<String, dynamic> json) =
      _$CompanyRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get bin;
  @override
  @JsonKey(name: 'legal_address')
  String get legalAddress;
  @override
  @JsonKey(name: 'founded_year')
  int get foundedYear;

  /// Create a copy of CompanyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyRequestImplCopyWith<_$CompanyRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApprovalStatusDTO _$ApprovalStatusDTOFromJson(Map<String, dynamic> json) {
  return _ApprovalStatusDTO.fromJson(json);
}

/// @nodoc
mixin _$ApprovalStatusDTO {
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_approved')
  bool get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_status')
  String? get companyStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason => throw _privateConstructorUsedError;

  /// Serializes this ApprovalStatusDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApprovalStatusDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApprovalStatusDTOCopyWith<ApprovalStatusDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApprovalStatusDTOCopyWith<$Res> {
  factory $ApprovalStatusDTOCopyWith(
          ApprovalStatusDTO value, $Res Function(ApprovalStatusDTO) then) =
      _$ApprovalStatusDTOCopyWithImpl<$Res, ApprovalStatusDTO>;
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'is_approved') bool isApproved,
      @JsonKey(name: 'company_status') String? companyStatus,
      @JsonKey(name: 'rejection_reason') String? rejectionReason});
}

/// @nodoc
class _$ApprovalStatusDTOCopyWithImpl<$Res, $Val extends ApprovalStatusDTO>
    implements $ApprovalStatusDTOCopyWith<$Res> {
  _$ApprovalStatusDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApprovalStatusDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? isApproved = null,
    Object? companyStatus = freezed,
    Object? rejectionReason = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      companyStatus: freezed == companyStatus
          ? _value.companyStatus
          : companyStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApprovalStatusDTOImplCopyWith<$Res>
    implements $ApprovalStatusDTOCopyWith<$Res> {
  factory _$$ApprovalStatusDTOImplCopyWith(_$ApprovalStatusDTOImpl value,
          $Res Function(_$ApprovalStatusDTOImpl) then) =
      __$$ApprovalStatusDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      @JsonKey(name: 'is_approved') bool isApproved,
      @JsonKey(name: 'company_status') String? companyStatus,
      @JsonKey(name: 'rejection_reason') String? rejectionReason});
}

/// @nodoc
class __$$ApprovalStatusDTOImplCopyWithImpl<$Res>
    extends _$ApprovalStatusDTOCopyWithImpl<$Res, _$ApprovalStatusDTOImpl>
    implements _$$ApprovalStatusDTOImplCopyWith<$Res> {
  __$$ApprovalStatusDTOImplCopyWithImpl(_$ApprovalStatusDTOImpl _value,
      $Res Function(_$ApprovalStatusDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApprovalStatusDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? isApproved = null,
    Object? companyStatus = freezed,
    Object? rejectionReason = freezed,
  }) {
    return _then(_$ApprovalStatusDTOImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      companyStatus: freezed == companyStatus
          ? _value.companyStatus
          : companyStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApprovalStatusDTOImpl implements _ApprovalStatusDTO {
  const _$ApprovalStatusDTOImpl(
      {this.success = true,
      @JsonKey(name: 'is_approved') required this.isApproved,
      @JsonKey(name: 'company_status') this.companyStatus,
      @JsonKey(name: 'rejection_reason') this.rejectionReason});

  factory _$ApprovalStatusDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApprovalStatusDTOImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey(name: 'is_approved')
  final bool isApproved;
  @override
  @JsonKey(name: 'company_status')
  final String? companyStatus;
  @override
  @JsonKey(name: 'rejection_reason')
  final String? rejectionReason;

  @override
  String toString() {
    return 'ApprovalStatusDTO(success: $success, isApproved: $isApproved, companyStatus: $companyStatus, rejectionReason: $rejectionReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovalStatusDTOImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.companyStatus, companyStatus) ||
                other.companyStatus == companyStatus) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, isApproved, companyStatus, rejectionReason);

  /// Create a copy of ApprovalStatusDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovalStatusDTOImplCopyWith<_$ApprovalStatusDTOImpl> get copyWith =>
      __$$ApprovalStatusDTOImplCopyWithImpl<_$ApprovalStatusDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApprovalStatusDTOImplToJson(
      this,
    );
  }
}

abstract class _ApprovalStatusDTO implements ApprovalStatusDTO {
  const factory _ApprovalStatusDTO(
          {final bool success,
          @JsonKey(name: 'is_approved') required final bool isApproved,
          @JsonKey(name: 'company_status') final String? companyStatus,
          @JsonKey(name: 'rejection_reason') final String? rejectionReason}) =
      _$ApprovalStatusDTOImpl;

  factory _ApprovalStatusDTO.fromJson(Map<String, dynamic> json) =
      _$ApprovalStatusDTOImpl.fromJson;

  @override
  bool get success;
  @override
  @JsonKey(name: 'is_approved')
  bool get isApproved;
  @override
  @JsonKey(name: 'company_status')
  String? get companyStatus;
  @override
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason;

  /// Create a copy of ApprovalStatusDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApprovalStatusDTOImplCopyWith<_$ApprovalStatusDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegistrationStateDTO _$RegistrationStateDTOFromJson(Map<String, dynamic> json) {
  return _RegistrationStateDTO.fromJson(json);
}

/// @nodoc
mixin _$RegistrationStateDTO {
  String get step => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_approved')
  bool get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_status')
  String? get companyStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason => throw _privateConstructorUsedError;

  /// Serializes this RegistrationStateDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegistrationStateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationStateDTOCopyWith<RegistrationStateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationStateDTOCopyWith<$Res> {
  factory $RegistrationStateDTOCopyWith(RegistrationStateDTO value,
          $Res Function(RegistrationStateDTO) then) =
      _$RegistrationStateDTOCopyWithImpl<$Res, RegistrationStateDTO>;
  @useResult
  $Res call(
      {String step,
      @JsonKey(name: 'is_approved') bool isApproved,
      @JsonKey(name: 'company_status') String? companyStatus,
      @JsonKey(name: 'rejection_reason') String? rejectionReason});
}

/// @nodoc
class _$RegistrationStateDTOCopyWithImpl<$Res,
        $Val extends RegistrationStateDTO>
    implements $RegistrationStateDTOCopyWith<$Res> {
  _$RegistrationStateDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationStateDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? isApproved = null,
    Object? companyStatus = freezed,
    Object? rejectionReason = freezed,
  }) {
    return _then(_value.copyWith(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      companyStatus: freezed == companyStatus
          ? _value.companyStatus
          : companyStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationStateDTOImplCopyWith<$Res>
    implements $RegistrationStateDTOCopyWith<$Res> {
  factory _$$RegistrationStateDTOImplCopyWith(_$RegistrationStateDTOImpl value,
          $Res Function(_$RegistrationStateDTOImpl) then) =
      __$$RegistrationStateDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String step,
      @JsonKey(name: 'is_approved') bool isApproved,
      @JsonKey(name: 'company_status') String? companyStatus,
      @JsonKey(name: 'rejection_reason') String? rejectionReason});
}

/// @nodoc
class __$$RegistrationStateDTOImplCopyWithImpl<$Res>
    extends _$RegistrationStateDTOCopyWithImpl<$Res, _$RegistrationStateDTOImpl>
    implements _$$RegistrationStateDTOImplCopyWith<$Res> {
  __$$RegistrationStateDTOImplCopyWithImpl(_$RegistrationStateDTOImpl _value,
      $Res Function(_$RegistrationStateDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationStateDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? isApproved = null,
    Object? companyStatus = freezed,
    Object? rejectionReason = freezed,
  }) {
    return _then(_$RegistrationStateDTOImpl(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      companyStatus: freezed == companyStatus
          ? _value.companyStatus
          : companyStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrationStateDTOImpl implements _RegistrationStateDTO {
  const _$RegistrationStateDTOImpl(
      {required this.step,
      @JsonKey(name: 'is_approved') required this.isApproved,
      @JsonKey(name: 'company_status') this.companyStatus,
      @JsonKey(name: 'rejection_reason') this.rejectionReason});

  factory _$RegistrationStateDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegistrationStateDTOImplFromJson(json);

  @override
  final String step;
  @override
  @JsonKey(name: 'is_approved')
  final bool isApproved;
  @override
  @JsonKey(name: 'company_status')
  final String? companyStatus;
  @override
  @JsonKey(name: 'rejection_reason')
  final String? rejectionReason;

  @override
  String toString() {
    return 'RegistrationStateDTO(step: $step, isApproved: $isApproved, companyStatus: $companyStatus, rejectionReason: $rejectionReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationStateDTOImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.companyStatus, companyStatus) ||
                other.companyStatus == companyStatus) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, step, isApproved, companyStatus, rejectionReason);

  /// Create a copy of RegistrationStateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationStateDTOImplCopyWith<_$RegistrationStateDTOImpl>
      get copyWith =>
          __$$RegistrationStateDTOImplCopyWithImpl<_$RegistrationStateDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrationStateDTOImplToJson(
      this,
    );
  }
}

abstract class _RegistrationStateDTO implements RegistrationStateDTO {
  const factory _RegistrationStateDTO(
          {required final String step,
          @JsonKey(name: 'is_approved') required final bool isApproved,
          @JsonKey(name: 'company_status') final String? companyStatus,
          @JsonKey(name: 'rejection_reason') final String? rejectionReason}) =
      _$RegistrationStateDTOImpl;

  factory _RegistrationStateDTO.fromJson(Map<String, dynamic> json) =
      _$RegistrationStateDTOImpl.fromJson;

  @override
  String get step;
  @override
  @JsonKey(name: 'is_approved')
  bool get isApproved;
  @override
  @JsonKey(name: 'company_status')
  String? get companyStatus;
  @override
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason;

  /// Create a copy of RegistrationStateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationStateDTOImplCopyWith<_$RegistrationStateDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CompanyDocumentsResponse _$CompanyDocumentsResponseFromJson(
    Map<String, dynamic> json) {
  return _CompanyDocumentsResponse.fromJson(json);
}

/// @nodoc
mixin _$CompanyDocumentsResponse {
  String? get message => throw _privateConstructorUsedError;
  CompanyDTO? get company => throw _privateConstructorUsedError;

  /// Serializes this CompanyDocumentsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompanyDocumentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyDocumentsResponseCopyWith<CompanyDocumentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyDocumentsResponseCopyWith<$Res> {
  factory $CompanyDocumentsResponseCopyWith(CompanyDocumentsResponse value,
          $Res Function(CompanyDocumentsResponse) then) =
      _$CompanyDocumentsResponseCopyWithImpl<$Res, CompanyDocumentsResponse>;
  @useResult
  $Res call({String? message, CompanyDTO? company});

  $CompanyDTOCopyWith<$Res>? get company;
}

/// @nodoc
class _$CompanyDocumentsResponseCopyWithImpl<$Res,
        $Val extends CompanyDocumentsResponse>
    implements $CompanyDocumentsResponseCopyWith<$Res> {
  _$CompanyDocumentsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompanyDocumentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? company = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyDTO?,
    ) as $Val);
  }

  /// Create a copy of CompanyDocumentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanyDTOCopyWith<$Res>? get company {
    if (_value.company == null) {
      return null;
    }

    return $CompanyDTOCopyWith<$Res>(_value.company!, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompanyDocumentsResponseImplCopyWith<$Res>
    implements $CompanyDocumentsResponseCopyWith<$Res> {
  factory _$$CompanyDocumentsResponseImplCopyWith(
          _$CompanyDocumentsResponseImpl value,
          $Res Function(_$CompanyDocumentsResponseImpl) then) =
      __$$CompanyDocumentsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, CompanyDTO? company});

  @override
  $CompanyDTOCopyWith<$Res>? get company;
}

/// @nodoc
class __$$CompanyDocumentsResponseImplCopyWithImpl<$Res>
    extends _$CompanyDocumentsResponseCopyWithImpl<$Res,
        _$CompanyDocumentsResponseImpl>
    implements _$$CompanyDocumentsResponseImplCopyWith<$Res> {
  __$$CompanyDocumentsResponseImplCopyWithImpl(
      _$CompanyDocumentsResponseImpl _value,
      $Res Function(_$CompanyDocumentsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompanyDocumentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? company = freezed,
  }) {
    return _then(_$CompanyDocumentsResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyDocumentsResponseImpl implements _CompanyDocumentsResponse {
  const _$CompanyDocumentsResponseImpl({this.message, this.company});

  factory _$CompanyDocumentsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyDocumentsResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final CompanyDTO? company;

  @override
  String toString() {
    return 'CompanyDocumentsResponse(message: $message, company: $company)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyDocumentsResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, company);

  /// Create a copy of CompanyDocumentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyDocumentsResponseImplCopyWith<_$CompanyDocumentsResponseImpl>
      get copyWith => __$$CompanyDocumentsResponseImplCopyWithImpl<
          _$CompanyDocumentsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyDocumentsResponseImplToJson(
      this,
    );
  }
}

abstract class _CompanyDocumentsResponse implements CompanyDocumentsResponse {
  const factory _CompanyDocumentsResponse(
      {final String? message,
      final CompanyDTO? company}) = _$CompanyDocumentsResponseImpl;

  factory _CompanyDocumentsResponse.fromJson(Map<String, dynamic> json) =
      _$CompanyDocumentsResponseImpl.fromJson;

  @override
  String? get message;
  @override
  CompanyDTO? get company;

  /// Create a copy of CompanyDocumentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyDocumentsResponseImplCopyWith<_$CompanyDocumentsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
