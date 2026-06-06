// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyDTOImpl _$$CompanyDTOImplFromJson(Map<String, dynamic> json) =>
    _$CompanyDTOImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      name: json['name'] as String,
      bin: json['bin'] as String,
      legalAddress: json['legal_address'] as String,
      foundedYear: (json['founded_year'] as num).toInt(),
      status: json['status'] as String,
      registrationCertificateUrl:
          json['registration_certificate_url'] as String?,
      portfolioUrl: json['portfolio_url'] as String?,
      rejectionReason: json['rejection_reason'] as String?,
      submittedAt: json['submitted_at'] == null
          ? null
          : DateTime.parse(json['submitted_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CompanyDTOImplToJson(_$CompanyDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'bin': instance.bin,
      'legal_address': instance.legalAddress,
      'founded_year': instance.foundedYear,
      'status': instance.status,
      'registration_certificate_url': instance.registrationCertificateUrl,
      'portfolio_url': instance.portfolioUrl,
      'rejection_reason': instance.rejectionReason,
      'submitted_at': instance.submittedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$CompanyRequestImpl _$$CompanyRequestImplFromJson(Map<String, dynamic> json) =>
    _$CompanyRequestImpl(
      name: json['name'] as String,
      bin: json['bin'] as String,
      legalAddress: json['legal_address'] as String,
      foundedYear: (json['founded_year'] as num).toInt(),
    );

Map<String, dynamic> _$$CompanyRequestImplToJson(
        _$CompanyRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bin': instance.bin,
      'legal_address': instance.legalAddress,
      'founded_year': instance.foundedYear,
    };

_$ApprovalStatusDTOImpl _$$ApprovalStatusDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ApprovalStatusDTOImpl(
      success: json['success'] as bool? ?? true,
      isApproved: json['is_approved'] as bool,
      companyStatus: json['company_status'] as String?,
      rejectionReason: json['rejection_reason'] as String?,
    );

Map<String, dynamic> _$$ApprovalStatusDTOImplToJson(
        _$ApprovalStatusDTOImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'is_approved': instance.isApproved,
      'company_status': instance.companyStatus,
      'rejection_reason': instance.rejectionReason,
    };

_$RegistrationStateDTOImpl _$$RegistrationStateDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistrationStateDTOImpl(
      step: json['step'] as String,
      isApproved: json['is_approved'] as bool,
      companyStatus: json['company_status'] as String?,
      rejectionReason: json['rejection_reason'] as String?,
    );

Map<String, dynamic> _$$RegistrationStateDTOImplToJson(
        _$RegistrationStateDTOImpl instance) =>
    <String, dynamic>{
      'step': instance.step,
      'is_approved': instance.isApproved,
      'company_status': instance.companyStatus,
      'rejection_reason': instance.rejectionReason,
    };

_$CompanyDocumentsResponseImpl _$$CompanyDocumentsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CompanyDocumentsResponseImpl(
      message: json['message'] as String?,
      company: json['company'] == null
          ? null
          : CompanyDTO.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CompanyDocumentsResponseImplToJson(
        _$CompanyDocumentsResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'company': instance.company,
    };
