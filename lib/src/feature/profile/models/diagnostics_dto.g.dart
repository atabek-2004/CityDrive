// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnostics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailableDiagnosticsDTOImpl _$$AvailableDiagnosticsDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailableDiagnosticsDTOImpl(
      canTakeDiagnostic: json['can_take_diagnostic'] as bool?,
      daysRemaining: (json['days_remaining'] as num?)?.toInt(),
      lastDiagnosticDate: json['last_diagnostic_date'] as String?,
    );

Map<String, dynamic> _$$AvailableDiagnosticsDTOImplToJson(
        _$AvailableDiagnosticsDTOImpl instance) =>
    <String, dynamic>{
      'can_take_diagnostic': instance.canTakeDiagnostic,
      'days_remaining': instance.daysRemaining,
      'last_diagnostic_date': instance.lastDiagnosticDate,
    };

_$DiagnosticsQuestionsDTOImpl _$$DiagnosticsQuestionsDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$DiagnosticsQuestionsDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      diagnosticId: (json['diagnostic_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      order: (json['order'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => DiagnosticsImageDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DiagnosticsQuestionsDTOImplToJson(
        _$DiagnosticsQuestionsDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'diagnostic_id': instance.diagnosticId,
      'title': instance.title,
      'description': instance.description,
      'order': instance.order,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'images': instance.images,
    };

_$DiagnosticsImageDTOImpl _$$DiagnosticsImageDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$DiagnosticsImageDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      diagnosticId: (json['diagnostic_id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      imageUrl: json['image_url'] as String?,
      description: json['description'] as String?,
      order: (json['order'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$DiagnosticsImageDTOImplToJson(
        _$DiagnosticsImageDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'diagnostic_id': instance.diagnosticId,
      'question_id': instance.questionId,
      'image_url': instance.imageUrl,
      'description': instance.description,
      'order': instance.order,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$ResultTestDTOImpl _$$ResultTestDTOImplFromJson(Map<String, dynamic> json) =>
    _$ResultTestDTOImpl(
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : ResultDTO.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResultTestDTOImplToJson(_$ResultTestDTOImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
    };

_$ResultDTOImpl _$$ResultDTOImplFromJson(Map<String, dynamic> json) =>
    _$ResultDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      personalityType: json['personality_type'] == null
          ? null
          : PersonalityTypeDTO.fromJson(
              json['personality_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResultDTOImplToJson(_$ResultDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'created_at': instance.createdAt,
      'personality_type': instance.personalityType,
    };

_$PersonalityTypeDTOImpl _$$PersonalityTypeDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalityTypeDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      strengths: (json['strengths'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      recommendations: (json['recommendations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$PersonalityTypeDTOImplToJson(
        _$PersonalityTypeDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'strengths': instance.strengths,
      'weaknesses': instance.weaknesses,
      'recommendations': instance.recommendations,
    };
