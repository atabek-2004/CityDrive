// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnostics_ai_dto.freezed.dart';
part 'diagnostics_ai_dto.g.dart';

@freezed
class DiagnosticsAIDTO with _$DiagnosticsAIDTO {
  const factory DiagnosticsAIDTO({
    int? id,
    @JsonKey(name: 'diagnostic_id') int? diagnosticId,
    @JsonKey(name: 'participant_id') int? participantId,
    @JsonKey(name: 'personality_type_id') int? personalityTypeId,
    @JsonKey(name: 'ai_personality_label') String? aiPersonalityLabel,
    @JsonKey(name: 'ai_profile') String? aiProfile,
    @JsonKey(name: 'ai_summary') String? aiSummary,
    @JsonKey(name: 'ai_recommendations') String? aiRecommendations,
    @JsonKey(name: 'ai_raw') String? aiRaw,
    @JsonKey(name: 'ai_response') AIResponseDTO? aiResponse,
    double? score,
    @JsonKey(name: 'selected_image_ids') List<int>? selectedImageIds,
    String? status,
    @JsonKey(name: 'started_at') String? startedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    DiagnosticDTO? diagnostic,
    @JsonKey(name: 'personality_type') dynamic personalityType,
  }) = _DiagnosticsAIDTO;

  factory DiagnosticsAIDTO.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticsAIDTOFromJson(json);
}

@freezed
class AIResponseDTO with _$AIResponseDTO {
  const factory AIResponseDTO({
    String? greeting,
    @JsonKey(name: 'basic_data') BasicDataDTO? basicData,
    @JsonKey(name: 'current_state') String? currentState,
    String? potential,
    AnalysisDTO? analysis,
    @JsonKey(name: 'weekly_plan') WeeklyPlanDTO? weeklyPlan,
    @JsonKey(name: 'bars_words') String? barsWords,
    @JsonKey(name: '__raw') String? raw,
  }) = _AIResponseDTO;

  factory AIResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$AIResponseDTOFromJson(json);
}

@freezed
class BasicDataDTO with _$BasicDataDTO {
  const factory BasicDataDTO({
    String? name,
    String? birthdate,
    ChoicesDTO? choices,
  }) = _BasicDataDTO;

  factory BasicDataDTO.fromJson(Map<String, dynamic> json) =>
      _$BasicDataDTOFromJson(json);
}

@freezed
class ChoicesDTO with _$ChoicesDTO {
  const factory ChoicesDTO({
    String? place,
    String? color,
    String? number,
    String? figure,
  }) = _ChoicesDTO;

  factory ChoicesDTO.fromJson(Map<String, dynamic> json) =>
      _$ChoicesDTOFromJson(json);
}

@freezed
class AnalysisDTO with _$AnalysisDTO {
  const factory AnalysisDTO({
    PhysicalDTO? physical,
    IntellectualDTO? intellectual,
    EmotionalDTO? emotional,
    SpiritualDTO? spiritual,
  }) = _AnalysisDTO;

  factory AnalysisDTO.fromJson(Map<String, dynamic> json) =>
      _$AnalysisDTOFromJson(json);
}

@freezed
class PhysicalDTO with _$PhysicalDTO {
  const factory PhysicalDTO({
    String? state,
    String? task,
    String? reason,
  }) = _PhysicalDTO;

  factory PhysicalDTO.fromJson(Map<String, dynamic> json) =>
      _$PhysicalDTOFromJson(json);
}

@freezed
class IntellectualDTO with _$IntellectualDTO {
  const factory IntellectualDTO({
    String? state,
    String? task,
    String? reason,
  }) = _IntellectualDTO;

  factory IntellectualDTO.fromJson(Map<String, dynamic> json) =>
      _$IntellectualDTOFromJson(json);
}

@freezed
class EmotionalDTO with _$EmotionalDTO {
  const factory EmotionalDTO({
    String? state,
    String? task,
    String? reason,
  }) = _EmotionalDTO;

  factory EmotionalDTO.fromJson(Map<String, dynamic> json) =>
      _$EmotionalDTOFromJson(json);
}

@freezed
class SpiritualDTO with _$SpiritualDTO {
  const factory SpiritualDTO({
    String? state,
    String? task,
    String? reason,
  }) = _SpiritualDTO;

  factory SpiritualDTO.fromJson(Map<String, dynamic> json) =>
      _$SpiritualDTOFromJson(json);
}

@freezed
class WeeklyPlanDTO with _$WeeklyPlanDTO {
  const factory WeeklyPlanDTO({
    String? monday,
    String? tuesday,
    String? wednesday,
    String? thursday,
    String? friday,
    String? saturday,
    String? sunday,
  }) = _WeeklyPlanDTO;

  factory WeeklyPlanDTO.fromJson(Map<String, dynamic> json) =>
      _$WeeklyPlanDTOFromJson(json);
}

@freezed
class DiagnosticDTO with _$DiagnosticDTO {
  const factory DiagnosticDTO({
    int? id,
    String? title,
  }) = _DiagnosticDTO;

  factory DiagnosticDTO.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticDTOFromJson(json);
}
