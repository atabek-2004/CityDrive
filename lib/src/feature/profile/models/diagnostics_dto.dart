// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnostics_dto.freezed.dart';
part 'diagnostics_dto.g.dart';

@freezed
class AvailableDiagnosticsDTO with _$AvailableDiagnosticsDTO {
  const factory AvailableDiagnosticsDTO({
    @JsonKey(name: 'can_take_diagnostic') bool? canTakeDiagnostic,
    @JsonKey(name: 'days_remaining') int? daysRemaining,
    @JsonKey(name: 'last_diagnostic_date') String? lastDiagnosticDate,
  }) = _AvailableDiagnosticsDTO;

  factory AvailableDiagnosticsDTO.fromJson(Map<String, dynamic> json) =>
      _$AvailableDiagnosticsDTOFromJson(json);
}

@freezed
class DiagnosticsQuestionsDTO with _$DiagnosticsQuestionsDTO {
  const factory DiagnosticsQuestionsDTO({
    int? id,
    @JsonKey(name: 'diagnostic_id') int? diagnosticId,
    String? title,
    String? description,
    int? order,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    List<DiagnosticsImageDTO>? images,
  }) = _DiagnosticsQuestionsDTO;

  factory DiagnosticsQuestionsDTO.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticsQuestionsDTOFromJson(json);
}

@freezed
class DiagnosticsImageDTO with _$DiagnosticsImageDTO {
  const factory DiagnosticsImageDTO({
    int? id,
    @JsonKey(name: 'diagnostic_id') int? diagnosticId,
    @JsonKey(name: 'question_id') int? questionId,
    @JsonKey(name: 'image_url') String? imageUrl,
    String? description,
    int? order,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _DiagnosticsImageDTO;

  factory DiagnosticsImageDTO.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticsImageDTOFromJson(json);
}

@freezed
class ResultTestDTO with _$ResultTestDTO {
  const factory ResultTestDTO({
    String? message,
    ResultDTO? result,
  }) = _ResultTestDTO;

  factory ResultTestDTO.fromJson(Map<String, dynamic> json) =>
      _$ResultTestDTOFromJson(json);
}

@freezed
class ResultDTO with _$ResultDTO {
  const factory ResultDTO({
    int? id,
    int? score,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'personality_type') PersonalityTypeDTO? personalityType,
  }) = _ResultDTO;

  factory ResultDTO.fromJson(Map<String, dynamic> json) =>
      _$ResultDTOFromJson(json);
}

@freezed
class PersonalityTypeDTO with _$PersonalityTypeDTO {
  const factory PersonalityTypeDTO({
    int? id,
    String? name,
    String? description,
    List<String>? strengths,
    List<String>? weaknesses,
    List<String>? recommendations,
  }) = _PersonalityTypeDTO;

  factory PersonalityTypeDTO.fromJson(Map<String, dynamic> json) =>
      _$PersonalityTypeDTOFromJson(json);
}