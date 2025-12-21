// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnostics_ai_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiagnosticsAIDTOImpl _$$DiagnosticsAIDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$DiagnosticsAIDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      diagnosticId: (json['diagnostic_id'] as num?)?.toInt(),
      participantId: (json['participant_id'] as num?)?.toInt(),
      personalityTypeId: (json['personality_type_id'] as num?)?.toInt(),
      aiPersonalityLabel: json['ai_personality_label'] as String?,
      aiProfile: json['ai_profile'] as String?,
      aiSummary: json['ai_summary'] as String?,
      aiRecommendations: json['ai_recommendations'] as String?,
      aiRaw: json['ai_raw'] as String?,
      aiResponse: json['ai_response'] == null
          ? null
          : AIResponseDTO.fromJson(json['ai_response'] as Map<String, dynamic>),
      score: (json['score'] as num?)?.toDouble(),
      selectedImageIds: (json['selected_image_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      status: json['status'] as String?,
      startedAt: json['started_at'] as String?,
      completedAt: json['completed_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      diagnostic: json['diagnostic'] == null
          ? null
          : DiagnosticDTO.fromJson(json['diagnostic'] as Map<String, dynamic>),
      personalityType: json['personality_type'],
    );

Map<String, dynamic> _$$DiagnosticsAIDTOImplToJson(
        _$DiagnosticsAIDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'diagnostic_id': instance.diagnosticId,
      'participant_id': instance.participantId,
      'personality_type_id': instance.personalityTypeId,
      'ai_personality_label': instance.aiPersonalityLabel,
      'ai_profile': instance.aiProfile,
      'ai_summary': instance.aiSummary,
      'ai_recommendations': instance.aiRecommendations,
      'ai_raw': instance.aiRaw,
      'ai_response': instance.aiResponse,
      'score': instance.score,
      'selected_image_ids': instance.selectedImageIds,
      'status': instance.status,
      'started_at': instance.startedAt,
      'completed_at': instance.completedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'diagnostic': instance.diagnostic,
      'personality_type': instance.personalityType,
    };

_$AIResponseDTOImpl _$$AIResponseDTOImplFromJson(Map<String, dynamic> json) =>
    _$AIResponseDTOImpl(
      greeting: json['greeting'] as String?,
      basicData: json['basic_data'] == null
          ? null
          : BasicDataDTO.fromJson(json['basic_data'] as Map<String, dynamic>),
      currentState: json['current_state'] as String?,
      potential: json['potential'] as String?,
      analysis: json['analysis'] == null
          ? null
          : AnalysisDTO.fromJson(json['analysis'] as Map<String, dynamic>),
      weeklyPlan: json['weekly_plan'] == null
          ? null
          : WeeklyPlanDTO.fromJson(json['weekly_plan'] as Map<String, dynamic>),
      barsWords: json['bars_words'] as String?,
      raw: json['__raw'] as String?,
    );

Map<String, dynamic> _$$AIResponseDTOImplToJson(_$AIResponseDTOImpl instance) =>
    <String, dynamic>{
      'greeting': instance.greeting,
      'basic_data': instance.basicData,
      'current_state': instance.currentState,
      'potential': instance.potential,
      'analysis': instance.analysis,
      'weekly_plan': instance.weeklyPlan,
      'bars_words': instance.barsWords,
      '__raw': instance.raw,
    };

_$BasicDataDTOImpl _$$BasicDataDTOImplFromJson(Map<String, dynamic> json) =>
    _$BasicDataDTOImpl(
      name: json['name'] as String?,
      birthdate: json['birthdate'] as String?,
      choices: json['choices'] == null
          ? null
          : ChoicesDTO.fromJson(json['choices'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BasicDataDTOImplToJson(_$BasicDataDTOImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthdate': instance.birthdate,
      'choices': instance.choices,
    };

_$ChoicesDTOImpl _$$ChoicesDTOImplFromJson(Map<String, dynamic> json) =>
    _$ChoicesDTOImpl(
      place: json['place'] as String?,
      color: json['color'] as String?,
      number: json['number'] as String?,
      figure: json['figure'] as String?,
    );

Map<String, dynamic> _$$ChoicesDTOImplToJson(_$ChoicesDTOImpl instance) =>
    <String, dynamic>{
      'place': instance.place,
      'color': instance.color,
      'number': instance.number,
      'figure': instance.figure,
    };

_$AnalysisDTOImpl _$$AnalysisDTOImplFromJson(Map<String, dynamic> json) =>
    _$AnalysisDTOImpl(
      physical: json['physical'] == null
          ? null
          : PhysicalDTO.fromJson(json['physical'] as Map<String, dynamic>),
      intellectual: json['intellectual'] == null
          ? null
          : IntellectualDTO.fromJson(
              json['intellectual'] as Map<String, dynamic>),
      emotional: json['emotional'] == null
          ? null
          : EmotionalDTO.fromJson(json['emotional'] as Map<String, dynamic>),
      spiritual: json['spiritual'] == null
          ? null
          : SpiritualDTO.fromJson(json['spiritual'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AnalysisDTOImplToJson(_$AnalysisDTOImpl instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'intellectual': instance.intellectual,
      'emotional': instance.emotional,
      'spiritual': instance.spiritual,
    };

_$PhysicalDTOImpl _$$PhysicalDTOImplFromJson(Map<String, dynamic> json) =>
    _$PhysicalDTOImpl(
      state: json['state'] as String?,
      task: json['task'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$PhysicalDTOImplToJson(_$PhysicalDTOImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'task': instance.task,
      'reason': instance.reason,
    };

_$IntellectualDTOImpl _$$IntellectualDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$IntellectualDTOImpl(
      state: json['state'] as String?,
      task: json['task'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$IntellectualDTOImplToJson(
        _$IntellectualDTOImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'task': instance.task,
      'reason': instance.reason,
    };

_$EmotionalDTOImpl _$$EmotionalDTOImplFromJson(Map<String, dynamic> json) =>
    _$EmotionalDTOImpl(
      state: json['state'] as String?,
      task: json['task'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$EmotionalDTOImplToJson(_$EmotionalDTOImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'task': instance.task,
      'reason': instance.reason,
    };

_$SpiritualDTOImpl _$$SpiritualDTOImplFromJson(Map<String, dynamic> json) =>
    _$SpiritualDTOImpl(
      state: json['state'] as String?,
      task: json['task'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$SpiritualDTOImplToJson(_$SpiritualDTOImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'task': instance.task,
      'reason': instance.reason,
    };

_$WeeklyPlanDTOImpl _$$WeeklyPlanDTOImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyPlanDTOImpl(
      monday: json['monday'] as String?,
      tuesday: json['tuesday'] as String?,
      wednesday: json['wednesday'] as String?,
      thursday: json['thursday'] as String?,
      friday: json['friday'] as String?,
      saturday: json['saturday'] as String?,
      sunday: json['sunday'] as String?,
    );

Map<String, dynamic> _$$WeeklyPlanDTOImplToJson(_$WeeklyPlanDTOImpl instance) =>
    <String, dynamic>{
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
    };

_$DiagnosticDTOImpl _$$DiagnosticDTOImplFromJson(Map<String, dynamic> json) =>
    _$DiagnosticDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$DiagnosticDTOImplToJson(_$DiagnosticDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
