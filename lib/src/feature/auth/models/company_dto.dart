// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_dto.freezed.dart';
part 'company_dto.g.dart';

@freezed
class CompanyDTO with _$CompanyDTO {
  const factory CompanyDTO({
    required int id,
    @JsonKey(name: 'user_id') int? userId,
    required String name,
    required String bin,
    @JsonKey(name: 'legal_address') required String legalAddress,
    @JsonKey(name: 'founded_year') required int foundedYear,
    required String status,
    @JsonKey(name: 'registration_certificate_url')
    String? registrationCertificateUrl,
    @JsonKey(name: 'portfolio_url') String? portfolioUrl,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'submitted_at') DateTime? submittedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CompanyDTO;

  factory CompanyDTO.fromJson(Map<String, dynamic> json) =>
      _$CompanyDTOFromJson(json);
}

@freezed
class CompanyRequest with _$CompanyRequest {
  const factory CompanyRequest({
    required String name,
    required String bin,
    @JsonKey(name: 'legal_address') required String legalAddress,
    @JsonKey(name: 'founded_year') required int foundedYear,
  }) = _CompanyRequest;

  factory CompanyRequest.fromJson(Map<String, dynamic> json) =>
      _$CompanyRequestFromJson(json);
}

@freezed
class ApprovalStatusDTO with _$ApprovalStatusDTO {
  const factory ApprovalStatusDTO({
    @Default(true) bool success,
    @JsonKey(name: 'is_approved') required bool isApproved,
    @JsonKey(name: 'company_status') String? companyStatus,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
  }) = _ApprovalStatusDTO;

  factory ApprovalStatusDTO.fromJson(Map<String, dynamic> json) =>
      _$ApprovalStatusDTOFromJson(json);
}

@freezed
class RegistrationStateDTO with _$RegistrationStateDTO {
  const factory RegistrationStateDTO({
    required String step,
    @JsonKey(name: 'is_approved') required bool isApproved,
    @JsonKey(name: 'company_status') String? companyStatus,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
  }) = _RegistrationStateDTO;

  factory RegistrationStateDTO.fromJson(Map<String, dynamic> json) =>
      _$RegistrationStateDTOFromJson(json);
}

@freezed
class CompanyDocumentsResponse with _$CompanyDocumentsResponse {
  const factory CompanyDocumentsResponse({
    String? message,
    CompanyDTO? company,
  }) = _CompanyDocumentsResponse;

  factory CompanyDocumentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyDocumentsResponseFromJson(json);
}
