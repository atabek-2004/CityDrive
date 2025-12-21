// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnostics_ai_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiagnosticsAIDTO _$DiagnosticsAIDTOFromJson(Map<String, dynamic> json) {
  return _DiagnosticsAIDTO.fromJson(json);
}

/// @nodoc
mixin _$DiagnosticsAIDTO {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'diagnostic_id')
  int? get diagnosticId => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_id')
  int? get participantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'personality_type_id')
  int? get personalityTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_personality_label')
  String? get aiPersonalityLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_profile')
  String? get aiProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_summary')
  String? get aiSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_recommendations')
  String? get aiRecommendations => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_raw')
  String? get aiRaw => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_response')
  AIResponseDTO? get aiResponse => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'selected_image_ids')
  List<int>? get selectedImageIds => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  String? get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  String? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  DiagnosticDTO? get diagnostic => throw _privateConstructorUsedError;
  @JsonKey(name: 'personality_type')
  dynamic get personalityType => throw _privateConstructorUsedError;

  /// Serializes this DiagnosticsAIDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiagnosticsAIDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosticsAIDTOCopyWith<DiagnosticsAIDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosticsAIDTOCopyWith<$Res> {
  factory $DiagnosticsAIDTOCopyWith(
          DiagnosticsAIDTO value, $Res Function(DiagnosticsAIDTO) then) =
      _$DiagnosticsAIDTOCopyWithImpl<$Res, DiagnosticsAIDTO>;
  @useResult
  $Res call(
      {int? id,
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
      @JsonKey(name: 'personality_type') dynamic personalityType});

  $AIResponseDTOCopyWith<$Res>? get aiResponse;
  $DiagnosticDTOCopyWith<$Res>? get diagnostic;
}

/// @nodoc
class _$DiagnosticsAIDTOCopyWithImpl<$Res, $Val extends DiagnosticsAIDTO>
    implements $DiagnosticsAIDTOCopyWith<$Res> {
  _$DiagnosticsAIDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagnosticsAIDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? diagnosticId = freezed,
    Object? participantId = freezed,
    Object? personalityTypeId = freezed,
    Object? aiPersonalityLabel = freezed,
    Object? aiProfile = freezed,
    Object? aiSummary = freezed,
    Object? aiRecommendations = freezed,
    Object? aiRaw = freezed,
    Object? aiResponse = freezed,
    Object? score = freezed,
    Object? selectedImageIds = freezed,
    Object? status = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? diagnostic = freezed,
    Object? personalityType = freezed,
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
      participantId: freezed == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as int?,
      personalityTypeId: freezed == personalityTypeId
          ? _value.personalityTypeId
          : personalityTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      aiPersonalityLabel: freezed == aiPersonalityLabel
          ? _value.aiPersonalityLabel
          : aiPersonalityLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      aiProfile: freezed == aiProfile
          ? _value.aiProfile
          : aiProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      aiSummary: freezed == aiSummary
          ? _value.aiSummary
          : aiSummary // ignore: cast_nullable_to_non_nullable
              as String?,
      aiRecommendations: freezed == aiRecommendations
          ? _value.aiRecommendations
          : aiRecommendations // ignore: cast_nullable_to_non_nullable
              as String?,
      aiRaw: freezed == aiRaw
          ? _value.aiRaw
          : aiRaw // ignore: cast_nullable_to_non_nullable
              as String?,
      aiResponse: freezed == aiResponse
          ? _value.aiResponse
          : aiResponse // ignore: cast_nullable_to_non_nullable
              as AIResponseDTO?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      selectedImageIds: freezed == selectedImageIds
          ? _value.selectedImageIds
          : selectedImageIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      diagnostic: freezed == diagnostic
          ? _value.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as DiagnosticDTO?,
      personalityType: freezed == personalityType
          ? _value.personalityType
          : personalityType // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of DiagnosticsAIDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AIResponseDTOCopyWith<$Res>? get aiResponse {
    if (_value.aiResponse == null) {
      return null;
    }

    return $AIResponseDTOCopyWith<$Res>(_value.aiResponse!, (value) {
      return _then(_value.copyWith(aiResponse: value) as $Val);
    });
  }

  /// Create a copy of DiagnosticsAIDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagnosticDTOCopyWith<$Res>? get diagnostic {
    if (_value.diagnostic == null) {
      return null;
    }

    return $DiagnosticDTOCopyWith<$Res>(_value.diagnostic!, (value) {
      return _then(_value.copyWith(diagnostic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiagnosticsAIDTOImplCopyWith<$Res>
    implements $DiagnosticsAIDTOCopyWith<$Res> {
  factory _$$DiagnosticsAIDTOImplCopyWith(_$DiagnosticsAIDTOImpl value,
          $Res Function(_$DiagnosticsAIDTOImpl) then) =
      __$$DiagnosticsAIDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
      @JsonKey(name: 'personality_type') dynamic personalityType});

  @override
  $AIResponseDTOCopyWith<$Res>? get aiResponse;
  @override
  $DiagnosticDTOCopyWith<$Res>? get diagnostic;
}

/// @nodoc
class __$$DiagnosticsAIDTOImplCopyWithImpl<$Res>
    extends _$DiagnosticsAIDTOCopyWithImpl<$Res, _$DiagnosticsAIDTOImpl>
    implements _$$DiagnosticsAIDTOImplCopyWith<$Res> {
  __$$DiagnosticsAIDTOImplCopyWithImpl(_$DiagnosticsAIDTOImpl _value,
      $Res Function(_$DiagnosticsAIDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagnosticsAIDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? diagnosticId = freezed,
    Object? participantId = freezed,
    Object? personalityTypeId = freezed,
    Object? aiPersonalityLabel = freezed,
    Object? aiProfile = freezed,
    Object? aiSummary = freezed,
    Object? aiRecommendations = freezed,
    Object? aiRaw = freezed,
    Object? aiResponse = freezed,
    Object? score = freezed,
    Object? selectedImageIds = freezed,
    Object? status = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? diagnostic = freezed,
    Object? personalityType = freezed,
  }) {
    return _then(_$DiagnosticsAIDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      diagnosticId: freezed == diagnosticId
          ? _value.diagnosticId
          : diagnosticId // ignore: cast_nullable_to_non_nullable
              as int?,
      participantId: freezed == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as int?,
      personalityTypeId: freezed == personalityTypeId
          ? _value.personalityTypeId
          : personalityTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      aiPersonalityLabel: freezed == aiPersonalityLabel
          ? _value.aiPersonalityLabel
          : aiPersonalityLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      aiProfile: freezed == aiProfile
          ? _value.aiProfile
          : aiProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      aiSummary: freezed == aiSummary
          ? _value.aiSummary
          : aiSummary // ignore: cast_nullable_to_non_nullable
              as String?,
      aiRecommendations: freezed == aiRecommendations
          ? _value.aiRecommendations
          : aiRecommendations // ignore: cast_nullable_to_non_nullable
              as String?,
      aiRaw: freezed == aiRaw
          ? _value.aiRaw
          : aiRaw // ignore: cast_nullable_to_non_nullable
              as String?,
      aiResponse: freezed == aiResponse
          ? _value.aiResponse
          : aiResponse // ignore: cast_nullable_to_non_nullable
              as AIResponseDTO?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      selectedImageIds: freezed == selectedImageIds
          ? _value._selectedImageIds
          : selectedImageIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      diagnostic: freezed == diagnostic
          ? _value.diagnostic
          : diagnostic // ignore: cast_nullable_to_non_nullable
              as DiagnosticDTO?,
      personalityType: freezed == personalityType
          ? _value.personalityType
          : personalityType // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosticsAIDTOImpl implements _DiagnosticsAIDTO {
  const _$DiagnosticsAIDTOImpl(
      {this.id,
      @JsonKey(name: 'diagnostic_id') this.diagnosticId,
      @JsonKey(name: 'participant_id') this.participantId,
      @JsonKey(name: 'personality_type_id') this.personalityTypeId,
      @JsonKey(name: 'ai_personality_label') this.aiPersonalityLabel,
      @JsonKey(name: 'ai_profile') this.aiProfile,
      @JsonKey(name: 'ai_summary') this.aiSummary,
      @JsonKey(name: 'ai_recommendations') this.aiRecommendations,
      @JsonKey(name: 'ai_raw') this.aiRaw,
      @JsonKey(name: 'ai_response') this.aiResponse,
      this.score,
      @JsonKey(name: 'selected_image_ids') final List<int>? selectedImageIds,
      this.status,
      @JsonKey(name: 'started_at') this.startedAt,
      @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.diagnostic,
      @JsonKey(name: 'personality_type') this.personalityType})
      : _selectedImageIds = selectedImageIds;

  factory _$DiagnosticsAIDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosticsAIDTOImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'diagnostic_id')
  final int? diagnosticId;
  @override
  @JsonKey(name: 'participant_id')
  final int? participantId;
  @override
  @JsonKey(name: 'personality_type_id')
  final int? personalityTypeId;
  @override
  @JsonKey(name: 'ai_personality_label')
  final String? aiPersonalityLabel;
  @override
  @JsonKey(name: 'ai_profile')
  final String? aiProfile;
  @override
  @JsonKey(name: 'ai_summary')
  final String? aiSummary;
  @override
  @JsonKey(name: 'ai_recommendations')
  final String? aiRecommendations;
  @override
  @JsonKey(name: 'ai_raw')
  final String? aiRaw;
  @override
  @JsonKey(name: 'ai_response')
  final AIResponseDTO? aiResponse;
  @override
  final double? score;
  final List<int>? _selectedImageIds;
  @override
  @JsonKey(name: 'selected_image_ids')
  List<int>? get selectedImageIds {
    final value = _selectedImageIds;
    if (value == null) return null;
    if (_selectedImageIds is EqualUnmodifiableListView)
      return _selectedImageIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  @JsonKey(name: 'started_at')
  final String? startedAt;
  @override
  @JsonKey(name: 'completed_at')
  final String? completedAt;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  final DiagnosticDTO? diagnostic;
  @override
  @JsonKey(name: 'personality_type')
  final dynamic personalityType;

  @override
  String toString() {
    return 'DiagnosticsAIDTO(id: $id, diagnosticId: $diagnosticId, participantId: $participantId, personalityTypeId: $personalityTypeId, aiPersonalityLabel: $aiPersonalityLabel, aiProfile: $aiProfile, aiSummary: $aiSummary, aiRecommendations: $aiRecommendations, aiRaw: $aiRaw, aiResponse: $aiResponse, score: $score, selectedImageIds: $selectedImageIds, status: $status, startedAt: $startedAt, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt, diagnostic: $diagnostic, personalityType: $personalityType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosticsAIDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.diagnosticId, diagnosticId) ||
                other.diagnosticId == diagnosticId) &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId) &&
            (identical(other.personalityTypeId, personalityTypeId) ||
                other.personalityTypeId == personalityTypeId) &&
            (identical(other.aiPersonalityLabel, aiPersonalityLabel) ||
                other.aiPersonalityLabel == aiPersonalityLabel) &&
            (identical(other.aiProfile, aiProfile) ||
                other.aiProfile == aiProfile) &&
            (identical(other.aiSummary, aiSummary) ||
                other.aiSummary == aiSummary) &&
            (identical(other.aiRecommendations, aiRecommendations) ||
                other.aiRecommendations == aiRecommendations) &&
            (identical(other.aiRaw, aiRaw) || other.aiRaw == aiRaw) &&
            (identical(other.aiResponse, aiResponse) ||
                other.aiResponse == aiResponse) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality()
                .equals(other._selectedImageIds, _selectedImageIds) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.diagnostic, diagnostic) ||
                other.diagnostic == diagnostic) &&
            const DeepCollectionEquality()
                .equals(other.personalityType, personalityType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        diagnosticId,
        participantId,
        personalityTypeId,
        aiPersonalityLabel,
        aiProfile,
        aiSummary,
        aiRecommendations,
        aiRaw,
        aiResponse,
        score,
        const DeepCollectionEquality().hash(_selectedImageIds),
        status,
        startedAt,
        completedAt,
        createdAt,
        updatedAt,
        diagnostic,
        const DeepCollectionEquality().hash(personalityType)
      ]);

  /// Create a copy of DiagnosticsAIDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosticsAIDTOImplCopyWith<_$DiagnosticsAIDTOImpl> get copyWith =>
      __$$DiagnosticsAIDTOImplCopyWithImpl<_$DiagnosticsAIDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosticsAIDTOImplToJson(
      this,
    );
  }
}

abstract class _DiagnosticsAIDTO implements DiagnosticsAIDTO {
  const factory _DiagnosticsAIDTO(
      {final int? id,
      @JsonKey(name: 'diagnostic_id') final int? diagnosticId,
      @JsonKey(name: 'participant_id') final int? participantId,
      @JsonKey(name: 'personality_type_id') final int? personalityTypeId,
      @JsonKey(name: 'ai_personality_label') final String? aiPersonalityLabel,
      @JsonKey(name: 'ai_profile') final String? aiProfile,
      @JsonKey(name: 'ai_summary') final String? aiSummary,
      @JsonKey(name: 'ai_recommendations') final String? aiRecommendations,
      @JsonKey(name: 'ai_raw') final String? aiRaw,
      @JsonKey(name: 'ai_response') final AIResponseDTO? aiResponse,
      final double? score,
      @JsonKey(name: 'selected_image_ids') final List<int>? selectedImageIds,
      final String? status,
      @JsonKey(name: 'started_at') final String? startedAt,
      @JsonKey(name: 'completed_at') final String? completedAt,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      final DiagnosticDTO? diagnostic,
      @JsonKey(name: 'personality_type')
      final dynamic personalityType}) = _$DiagnosticsAIDTOImpl;

  factory _DiagnosticsAIDTO.fromJson(Map<String, dynamic> json) =
      _$DiagnosticsAIDTOImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'diagnostic_id')
  int? get diagnosticId;
  @override
  @JsonKey(name: 'participant_id')
  int? get participantId;
  @override
  @JsonKey(name: 'personality_type_id')
  int? get personalityTypeId;
  @override
  @JsonKey(name: 'ai_personality_label')
  String? get aiPersonalityLabel;
  @override
  @JsonKey(name: 'ai_profile')
  String? get aiProfile;
  @override
  @JsonKey(name: 'ai_summary')
  String? get aiSummary;
  @override
  @JsonKey(name: 'ai_recommendations')
  String? get aiRecommendations;
  @override
  @JsonKey(name: 'ai_raw')
  String? get aiRaw;
  @override
  @JsonKey(name: 'ai_response')
  AIResponseDTO? get aiResponse;
  @override
  double? get score;
  @override
  @JsonKey(name: 'selected_image_ids')
  List<int>? get selectedImageIds;
  @override
  String? get status;
  @override
  @JsonKey(name: 'started_at')
  String? get startedAt;
  @override
  @JsonKey(name: 'completed_at')
  String? get completedAt;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  DiagnosticDTO? get diagnostic;
  @override
  @JsonKey(name: 'personality_type')
  dynamic get personalityType;

  /// Create a copy of DiagnosticsAIDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosticsAIDTOImplCopyWith<_$DiagnosticsAIDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AIResponseDTO _$AIResponseDTOFromJson(Map<String, dynamic> json) {
  return _AIResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$AIResponseDTO {
  String? get greeting => throw _privateConstructorUsedError;
  @JsonKey(name: 'basic_data')
  BasicDataDTO? get basicData => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_state')
  String? get currentState => throw _privateConstructorUsedError;
  String? get potential => throw _privateConstructorUsedError;
  AnalysisDTO? get analysis => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekly_plan')
  WeeklyPlanDTO? get weeklyPlan => throw _privateConstructorUsedError;
  @JsonKey(name: 'bars_words')
  String? get barsWords => throw _privateConstructorUsedError;
  @JsonKey(name: '__raw')
  String? get raw => throw _privateConstructorUsedError;

  /// Serializes this AIResponseDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AIResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AIResponseDTOCopyWith<AIResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIResponseDTOCopyWith<$Res> {
  factory $AIResponseDTOCopyWith(
          AIResponseDTO value, $Res Function(AIResponseDTO) then) =
      _$AIResponseDTOCopyWithImpl<$Res, AIResponseDTO>;
  @useResult
  $Res call(
      {String? greeting,
      @JsonKey(name: 'basic_data') BasicDataDTO? basicData,
      @JsonKey(name: 'current_state') String? currentState,
      String? potential,
      AnalysisDTO? analysis,
      @JsonKey(name: 'weekly_plan') WeeklyPlanDTO? weeklyPlan,
      @JsonKey(name: 'bars_words') String? barsWords,
      @JsonKey(name: '__raw') String? raw});

  $BasicDataDTOCopyWith<$Res>? get basicData;
  $AnalysisDTOCopyWith<$Res>? get analysis;
  $WeeklyPlanDTOCopyWith<$Res>? get weeklyPlan;
}

/// @nodoc
class _$AIResponseDTOCopyWithImpl<$Res, $Val extends AIResponseDTO>
    implements $AIResponseDTOCopyWith<$Res> {
  _$AIResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AIResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? greeting = freezed,
    Object? basicData = freezed,
    Object? currentState = freezed,
    Object? potential = freezed,
    Object? analysis = freezed,
    Object? weeklyPlan = freezed,
    Object? barsWords = freezed,
    Object? raw = freezed,
  }) {
    return _then(_value.copyWith(
      greeting: freezed == greeting
          ? _value.greeting
          : greeting // ignore: cast_nullable_to_non_nullable
              as String?,
      basicData: freezed == basicData
          ? _value.basicData
          : basicData // ignore: cast_nullable_to_non_nullable
              as BasicDataDTO?,
      currentState: freezed == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as String?,
      potential: freezed == potential
          ? _value.potential
          : potential // ignore: cast_nullable_to_non_nullable
              as String?,
      analysis: freezed == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as AnalysisDTO?,
      weeklyPlan: freezed == weeklyPlan
          ? _value.weeklyPlan
          : weeklyPlan // ignore: cast_nullable_to_non_nullable
              as WeeklyPlanDTO?,
      barsWords: freezed == barsWords
          ? _value.barsWords
          : barsWords // ignore: cast_nullable_to_non_nullable
              as String?,
      raw: freezed == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of AIResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BasicDataDTOCopyWith<$Res>? get basicData {
    if (_value.basicData == null) {
      return null;
    }

    return $BasicDataDTOCopyWith<$Res>(_value.basicData!, (value) {
      return _then(_value.copyWith(basicData: value) as $Val);
    });
  }

  /// Create a copy of AIResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalysisDTOCopyWith<$Res>? get analysis {
    if (_value.analysis == null) {
      return null;
    }

    return $AnalysisDTOCopyWith<$Res>(_value.analysis!, (value) {
      return _then(_value.copyWith(analysis: value) as $Val);
    });
  }

  /// Create a copy of AIResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeeklyPlanDTOCopyWith<$Res>? get weeklyPlan {
    if (_value.weeklyPlan == null) {
      return null;
    }

    return $WeeklyPlanDTOCopyWith<$Res>(_value.weeklyPlan!, (value) {
      return _then(_value.copyWith(weeklyPlan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AIResponseDTOImplCopyWith<$Res>
    implements $AIResponseDTOCopyWith<$Res> {
  factory _$$AIResponseDTOImplCopyWith(
          _$AIResponseDTOImpl value, $Res Function(_$AIResponseDTOImpl) then) =
      __$$AIResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? greeting,
      @JsonKey(name: 'basic_data') BasicDataDTO? basicData,
      @JsonKey(name: 'current_state') String? currentState,
      String? potential,
      AnalysisDTO? analysis,
      @JsonKey(name: 'weekly_plan') WeeklyPlanDTO? weeklyPlan,
      @JsonKey(name: 'bars_words') String? barsWords,
      @JsonKey(name: '__raw') String? raw});

  @override
  $BasicDataDTOCopyWith<$Res>? get basicData;
  @override
  $AnalysisDTOCopyWith<$Res>? get analysis;
  @override
  $WeeklyPlanDTOCopyWith<$Res>? get weeklyPlan;
}

/// @nodoc
class __$$AIResponseDTOImplCopyWithImpl<$Res>
    extends _$AIResponseDTOCopyWithImpl<$Res, _$AIResponseDTOImpl>
    implements _$$AIResponseDTOImplCopyWith<$Res> {
  __$$AIResponseDTOImplCopyWithImpl(
      _$AIResponseDTOImpl _value, $Res Function(_$AIResponseDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AIResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? greeting = freezed,
    Object? basicData = freezed,
    Object? currentState = freezed,
    Object? potential = freezed,
    Object? analysis = freezed,
    Object? weeklyPlan = freezed,
    Object? barsWords = freezed,
    Object? raw = freezed,
  }) {
    return _then(_$AIResponseDTOImpl(
      greeting: freezed == greeting
          ? _value.greeting
          : greeting // ignore: cast_nullable_to_non_nullable
              as String?,
      basicData: freezed == basicData
          ? _value.basicData
          : basicData // ignore: cast_nullable_to_non_nullable
              as BasicDataDTO?,
      currentState: freezed == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as String?,
      potential: freezed == potential
          ? _value.potential
          : potential // ignore: cast_nullable_to_non_nullable
              as String?,
      analysis: freezed == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as AnalysisDTO?,
      weeklyPlan: freezed == weeklyPlan
          ? _value.weeklyPlan
          : weeklyPlan // ignore: cast_nullable_to_non_nullable
              as WeeklyPlanDTO?,
      barsWords: freezed == barsWords
          ? _value.barsWords
          : barsWords // ignore: cast_nullable_to_non_nullable
              as String?,
      raw: freezed == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AIResponseDTOImpl implements _AIResponseDTO {
  const _$AIResponseDTOImpl(
      {this.greeting,
      @JsonKey(name: 'basic_data') this.basicData,
      @JsonKey(name: 'current_state') this.currentState,
      this.potential,
      this.analysis,
      @JsonKey(name: 'weekly_plan') this.weeklyPlan,
      @JsonKey(name: 'bars_words') this.barsWords,
      @JsonKey(name: '__raw') this.raw});

  factory _$AIResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AIResponseDTOImplFromJson(json);

  @override
  final String? greeting;
  @override
  @JsonKey(name: 'basic_data')
  final BasicDataDTO? basicData;
  @override
  @JsonKey(name: 'current_state')
  final String? currentState;
  @override
  final String? potential;
  @override
  final AnalysisDTO? analysis;
  @override
  @JsonKey(name: 'weekly_plan')
  final WeeklyPlanDTO? weeklyPlan;
  @override
  @JsonKey(name: 'bars_words')
  final String? barsWords;
  @override
  @JsonKey(name: '__raw')
  final String? raw;

  @override
  String toString() {
    return 'AIResponseDTO(greeting: $greeting, basicData: $basicData, currentState: $currentState, potential: $potential, analysis: $analysis, weeklyPlan: $weeklyPlan, barsWords: $barsWords, raw: $raw)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AIResponseDTOImpl &&
            (identical(other.greeting, greeting) ||
                other.greeting == greeting) &&
            (identical(other.basicData, basicData) ||
                other.basicData == basicData) &&
            (identical(other.currentState, currentState) ||
                other.currentState == currentState) &&
            (identical(other.potential, potential) ||
                other.potential == potential) &&
            (identical(other.analysis, analysis) ||
                other.analysis == analysis) &&
            (identical(other.weeklyPlan, weeklyPlan) ||
                other.weeklyPlan == weeklyPlan) &&
            (identical(other.barsWords, barsWords) ||
                other.barsWords == barsWords) &&
            (identical(other.raw, raw) || other.raw == raw));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, greeting, basicData,
      currentState, potential, analysis, weeklyPlan, barsWords, raw);

  /// Create a copy of AIResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AIResponseDTOImplCopyWith<_$AIResponseDTOImpl> get copyWith =>
      __$$AIResponseDTOImplCopyWithImpl<_$AIResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AIResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _AIResponseDTO implements AIResponseDTO {
  const factory _AIResponseDTO(
      {final String? greeting,
      @JsonKey(name: 'basic_data') final BasicDataDTO? basicData,
      @JsonKey(name: 'current_state') final String? currentState,
      final String? potential,
      final AnalysisDTO? analysis,
      @JsonKey(name: 'weekly_plan') final WeeklyPlanDTO? weeklyPlan,
      @JsonKey(name: 'bars_words') final String? barsWords,
      @JsonKey(name: '__raw') final String? raw}) = _$AIResponseDTOImpl;

  factory _AIResponseDTO.fromJson(Map<String, dynamic> json) =
      _$AIResponseDTOImpl.fromJson;

  @override
  String? get greeting;
  @override
  @JsonKey(name: 'basic_data')
  BasicDataDTO? get basicData;
  @override
  @JsonKey(name: 'current_state')
  String? get currentState;
  @override
  String? get potential;
  @override
  AnalysisDTO? get analysis;
  @override
  @JsonKey(name: 'weekly_plan')
  WeeklyPlanDTO? get weeklyPlan;
  @override
  @JsonKey(name: 'bars_words')
  String? get barsWords;
  @override
  @JsonKey(name: '__raw')
  String? get raw;

  /// Create a copy of AIResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AIResponseDTOImplCopyWith<_$AIResponseDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BasicDataDTO _$BasicDataDTOFromJson(Map<String, dynamic> json) {
  return _BasicDataDTO.fromJson(json);
}

/// @nodoc
mixin _$BasicDataDTO {
  String? get name => throw _privateConstructorUsedError;
  String? get birthdate => throw _privateConstructorUsedError;
  ChoicesDTO? get choices => throw _privateConstructorUsedError;

  /// Serializes this BasicDataDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BasicDataDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasicDataDTOCopyWith<BasicDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicDataDTOCopyWith<$Res> {
  factory $BasicDataDTOCopyWith(
          BasicDataDTO value, $Res Function(BasicDataDTO) then) =
      _$BasicDataDTOCopyWithImpl<$Res, BasicDataDTO>;
  @useResult
  $Res call({String? name, String? birthdate, ChoicesDTO? choices});

  $ChoicesDTOCopyWith<$Res>? get choices;
}

/// @nodoc
class _$BasicDataDTOCopyWithImpl<$Res, $Val extends BasicDataDTO>
    implements $BasicDataDTOCopyWith<$Res> {
  _$BasicDataDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasicDataDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? birthdate = freezed,
    Object? choices = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String?,
      choices: freezed == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as ChoicesDTO?,
    ) as $Val);
  }

  /// Create a copy of BasicDataDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChoicesDTOCopyWith<$Res>? get choices {
    if (_value.choices == null) {
      return null;
    }

    return $ChoicesDTOCopyWith<$Res>(_value.choices!, (value) {
      return _then(_value.copyWith(choices: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BasicDataDTOImplCopyWith<$Res>
    implements $BasicDataDTOCopyWith<$Res> {
  factory _$$BasicDataDTOImplCopyWith(
          _$BasicDataDTOImpl value, $Res Function(_$BasicDataDTOImpl) then) =
      __$$BasicDataDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? birthdate, ChoicesDTO? choices});

  @override
  $ChoicesDTOCopyWith<$Res>? get choices;
}

/// @nodoc
class __$$BasicDataDTOImplCopyWithImpl<$Res>
    extends _$BasicDataDTOCopyWithImpl<$Res, _$BasicDataDTOImpl>
    implements _$$BasicDataDTOImplCopyWith<$Res> {
  __$$BasicDataDTOImplCopyWithImpl(
      _$BasicDataDTOImpl _value, $Res Function(_$BasicDataDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of BasicDataDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? birthdate = freezed,
    Object? choices = freezed,
  }) {
    return _then(_$BasicDataDTOImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String?,
      choices: freezed == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as ChoicesDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasicDataDTOImpl implements _BasicDataDTO {
  const _$BasicDataDTOImpl({this.name, this.birthdate, this.choices});

  factory _$BasicDataDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasicDataDTOImplFromJson(json);

  @override
  final String? name;
  @override
  final String? birthdate;
  @override
  final ChoicesDTO? choices;

  @override
  String toString() {
    return 'BasicDataDTO(name: $name, birthdate: $birthdate, choices: $choices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicDataDTOImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.choices, choices) || other.choices == choices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, birthdate, choices);

  /// Create a copy of BasicDataDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicDataDTOImplCopyWith<_$BasicDataDTOImpl> get copyWith =>
      __$$BasicDataDTOImplCopyWithImpl<_$BasicDataDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasicDataDTOImplToJson(
      this,
    );
  }
}

abstract class _BasicDataDTO implements BasicDataDTO {
  const factory _BasicDataDTO(
      {final String? name,
      final String? birthdate,
      final ChoicesDTO? choices}) = _$BasicDataDTOImpl;

  factory _BasicDataDTO.fromJson(Map<String, dynamic> json) =
      _$BasicDataDTOImpl.fromJson;

  @override
  String? get name;
  @override
  String? get birthdate;
  @override
  ChoicesDTO? get choices;

  /// Create a copy of BasicDataDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasicDataDTOImplCopyWith<_$BasicDataDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChoicesDTO _$ChoicesDTOFromJson(Map<String, dynamic> json) {
  return _ChoicesDTO.fromJson(json);
}

/// @nodoc
mixin _$ChoicesDTO {
  String? get place => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  String? get figure => throw _privateConstructorUsedError;

  /// Serializes this ChoicesDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChoicesDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChoicesDTOCopyWith<ChoicesDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoicesDTOCopyWith<$Res> {
  factory $ChoicesDTOCopyWith(
          ChoicesDTO value, $Res Function(ChoicesDTO) then) =
      _$ChoicesDTOCopyWithImpl<$Res, ChoicesDTO>;
  @useResult
  $Res call({String? place, String? color, String? number, String? figure});
}

/// @nodoc
class _$ChoicesDTOCopyWithImpl<$Res, $Val extends ChoicesDTO>
    implements $ChoicesDTOCopyWith<$Res> {
  _$ChoicesDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChoicesDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? place = freezed,
    Object? color = freezed,
    Object? number = freezed,
    Object? figure = freezed,
  }) {
    return _then(_value.copyWith(
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      figure: freezed == figure
          ? _value.figure
          : figure // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChoicesDTOImplCopyWith<$Res>
    implements $ChoicesDTOCopyWith<$Res> {
  factory _$$ChoicesDTOImplCopyWith(
          _$ChoicesDTOImpl value, $Res Function(_$ChoicesDTOImpl) then) =
      __$$ChoicesDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? place, String? color, String? number, String? figure});
}

/// @nodoc
class __$$ChoicesDTOImplCopyWithImpl<$Res>
    extends _$ChoicesDTOCopyWithImpl<$Res, _$ChoicesDTOImpl>
    implements _$$ChoicesDTOImplCopyWith<$Res> {
  __$$ChoicesDTOImplCopyWithImpl(
      _$ChoicesDTOImpl _value, $Res Function(_$ChoicesDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChoicesDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? place = freezed,
    Object? color = freezed,
    Object? number = freezed,
    Object? figure = freezed,
  }) {
    return _then(_$ChoicesDTOImpl(
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      figure: freezed == figure
          ? _value.figure
          : figure // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChoicesDTOImpl implements _ChoicesDTO {
  const _$ChoicesDTOImpl({this.place, this.color, this.number, this.figure});

  factory _$ChoicesDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChoicesDTOImplFromJson(json);

  @override
  final String? place;
  @override
  final String? color;
  @override
  final String? number;
  @override
  final String? figure;

  @override
  String toString() {
    return 'ChoicesDTO(place: $place, color: $color, number: $number, figure: $figure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoicesDTOImpl &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.figure, figure) || other.figure == figure));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, place, color, number, figure);

  /// Create a copy of ChoicesDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoicesDTOImplCopyWith<_$ChoicesDTOImpl> get copyWith =>
      __$$ChoicesDTOImplCopyWithImpl<_$ChoicesDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChoicesDTOImplToJson(
      this,
    );
  }
}

abstract class _ChoicesDTO implements ChoicesDTO {
  const factory _ChoicesDTO(
      {final String? place,
      final String? color,
      final String? number,
      final String? figure}) = _$ChoicesDTOImpl;

  factory _ChoicesDTO.fromJson(Map<String, dynamic> json) =
      _$ChoicesDTOImpl.fromJson;

  @override
  String? get place;
  @override
  String? get color;
  @override
  String? get number;
  @override
  String? get figure;

  /// Create a copy of ChoicesDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChoicesDTOImplCopyWith<_$ChoicesDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalysisDTO _$AnalysisDTOFromJson(Map<String, dynamic> json) {
  return _AnalysisDTO.fromJson(json);
}

/// @nodoc
mixin _$AnalysisDTO {
  PhysicalDTO? get physical => throw _privateConstructorUsedError;
  IntellectualDTO? get intellectual => throw _privateConstructorUsedError;
  EmotionalDTO? get emotional => throw _privateConstructorUsedError;
  SpiritualDTO? get spiritual => throw _privateConstructorUsedError;

  /// Serializes this AnalysisDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalysisDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisDTOCopyWith<AnalysisDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisDTOCopyWith<$Res> {
  factory $AnalysisDTOCopyWith(
          AnalysisDTO value, $Res Function(AnalysisDTO) then) =
      _$AnalysisDTOCopyWithImpl<$Res, AnalysisDTO>;
  @useResult
  $Res call(
      {PhysicalDTO? physical,
      IntellectualDTO? intellectual,
      EmotionalDTO? emotional,
      SpiritualDTO? spiritual});

  $PhysicalDTOCopyWith<$Res>? get physical;
  $IntellectualDTOCopyWith<$Res>? get intellectual;
  $EmotionalDTOCopyWith<$Res>? get emotional;
  $SpiritualDTOCopyWith<$Res>? get spiritual;
}

/// @nodoc
class _$AnalysisDTOCopyWithImpl<$Res, $Val extends AnalysisDTO>
    implements $AnalysisDTOCopyWith<$Res> {
  _$AnalysisDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalysisDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? physical = freezed,
    Object? intellectual = freezed,
    Object? emotional = freezed,
    Object? spiritual = freezed,
  }) {
    return _then(_value.copyWith(
      physical: freezed == physical
          ? _value.physical
          : physical // ignore: cast_nullable_to_non_nullable
              as PhysicalDTO?,
      intellectual: freezed == intellectual
          ? _value.intellectual
          : intellectual // ignore: cast_nullable_to_non_nullable
              as IntellectualDTO?,
      emotional: freezed == emotional
          ? _value.emotional
          : emotional // ignore: cast_nullable_to_non_nullable
              as EmotionalDTO?,
      spiritual: freezed == spiritual
          ? _value.spiritual
          : spiritual // ignore: cast_nullable_to_non_nullable
              as SpiritualDTO?,
    ) as $Val);
  }

  /// Create a copy of AnalysisDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhysicalDTOCopyWith<$Res>? get physical {
    if (_value.physical == null) {
      return null;
    }

    return $PhysicalDTOCopyWith<$Res>(_value.physical!, (value) {
      return _then(_value.copyWith(physical: value) as $Val);
    });
  }

  /// Create a copy of AnalysisDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IntellectualDTOCopyWith<$Res>? get intellectual {
    if (_value.intellectual == null) {
      return null;
    }

    return $IntellectualDTOCopyWith<$Res>(_value.intellectual!, (value) {
      return _then(_value.copyWith(intellectual: value) as $Val);
    });
  }

  /// Create a copy of AnalysisDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmotionalDTOCopyWith<$Res>? get emotional {
    if (_value.emotional == null) {
      return null;
    }

    return $EmotionalDTOCopyWith<$Res>(_value.emotional!, (value) {
      return _then(_value.copyWith(emotional: value) as $Val);
    });
  }

  /// Create a copy of AnalysisDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpiritualDTOCopyWith<$Res>? get spiritual {
    if (_value.spiritual == null) {
      return null;
    }

    return $SpiritualDTOCopyWith<$Res>(_value.spiritual!, (value) {
      return _then(_value.copyWith(spiritual: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalysisDTOImplCopyWith<$Res>
    implements $AnalysisDTOCopyWith<$Res> {
  factory _$$AnalysisDTOImplCopyWith(
          _$AnalysisDTOImpl value, $Res Function(_$AnalysisDTOImpl) then) =
      __$$AnalysisDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PhysicalDTO? physical,
      IntellectualDTO? intellectual,
      EmotionalDTO? emotional,
      SpiritualDTO? spiritual});

  @override
  $PhysicalDTOCopyWith<$Res>? get physical;
  @override
  $IntellectualDTOCopyWith<$Res>? get intellectual;
  @override
  $EmotionalDTOCopyWith<$Res>? get emotional;
  @override
  $SpiritualDTOCopyWith<$Res>? get spiritual;
}

/// @nodoc
class __$$AnalysisDTOImplCopyWithImpl<$Res>
    extends _$AnalysisDTOCopyWithImpl<$Res, _$AnalysisDTOImpl>
    implements _$$AnalysisDTOImplCopyWith<$Res> {
  __$$AnalysisDTOImplCopyWithImpl(
      _$AnalysisDTOImpl _value, $Res Function(_$AnalysisDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalysisDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? physical = freezed,
    Object? intellectual = freezed,
    Object? emotional = freezed,
    Object? spiritual = freezed,
  }) {
    return _then(_$AnalysisDTOImpl(
      physical: freezed == physical
          ? _value.physical
          : physical // ignore: cast_nullable_to_non_nullable
              as PhysicalDTO?,
      intellectual: freezed == intellectual
          ? _value.intellectual
          : intellectual // ignore: cast_nullable_to_non_nullable
              as IntellectualDTO?,
      emotional: freezed == emotional
          ? _value.emotional
          : emotional // ignore: cast_nullable_to_non_nullable
              as EmotionalDTO?,
      spiritual: freezed == spiritual
          ? _value.spiritual
          : spiritual // ignore: cast_nullable_to_non_nullable
              as SpiritualDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalysisDTOImpl implements _AnalysisDTO {
  const _$AnalysisDTOImpl(
      {this.physical, this.intellectual, this.emotional, this.spiritual});

  factory _$AnalysisDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisDTOImplFromJson(json);

  @override
  final PhysicalDTO? physical;
  @override
  final IntellectualDTO? intellectual;
  @override
  final EmotionalDTO? emotional;
  @override
  final SpiritualDTO? spiritual;

  @override
  String toString() {
    return 'AnalysisDTO(physical: $physical, intellectual: $intellectual, emotional: $emotional, spiritual: $spiritual)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisDTOImpl &&
            (identical(other.physical, physical) ||
                other.physical == physical) &&
            (identical(other.intellectual, intellectual) ||
                other.intellectual == intellectual) &&
            (identical(other.emotional, emotional) ||
                other.emotional == emotional) &&
            (identical(other.spiritual, spiritual) ||
                other.spiritual == spiritual));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, physical, intellectual, emotional, spiritual);

  /// Create a copy of AnalysisDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisDTOImplCopyWith<_$AnalysisDTOImpl> get copyWith =>
      __$$AnalysisDTOImplCopyWithImpl<_$AnalysisDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisDTOImplToJson(
      this,
    );
  }
}

abstract class _AnalysisDTO implements AnalysisDTO {
  const factory _AnalysisDTO(
      {final PhysicalDTO? physical,
      final IntellectualDTO? intellectual,
      final EmotionalDTO? emotional,
      final SpiritualDTO? spiritual}) = _$AnalysisDTOImpl;

  factory _AnalysisDTO.fromJson(Map<String, dynamic> json) =
      _$AnalysisDTOImpl.fromJson;

  @override
  PhysicalDTO? get physical;
  @override
  IntellectualDTO? get intellectual;
  @override
  EmotionalDTO? get emotional;
  @override
  SpiritualDTO? get spiritual;

  /// Create a copy of AnalysisDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisDTOImplCopyWith<_$AnalysisDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhysicalDTO _$PhysicalDTOFromJson(Map<String, dynamic> json) {
  return _PhysicalDTO.fromJson(json);
}

/// @nodoc
mixin _$PhysicalDTO {
  String? get state => throw _privateConstructorUsedError;
  String? get task => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this PhysicalDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhysicalDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhysicalDTOCopyWith<PhysicalDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhysicalDTOCopyWith<$Res> {
  factory $PhysicalDTOCopyWith(
          PhysicalDTO value, $Res Function(PhysicalDTO) then) =
      _$PhysicalDTOCopyWithImpl<$Res, PhysicalDTO>;
  @useResult
  $Res call({String? state, String? task, String? reason});
}

/// @nodoc
class _$PhysicalDTOCopyWithImpl<$Res, $Val extends PhysicalDTO>
    implements $PhysicalDTOCopyWith<$Res> {
  _$PhysicalDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhysicalDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? task = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhysicalDTOImplCopyWith<$Res>
    implements $PhysicalDTOCopyWith<$Res> {
  factory _$$PhysicalDTOImplCopyWith(
          _$PhysicalDTOImpl value, $Res Function(_$PhysicalDTOImpl) then) =
      __$$PhysicalDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? state, String? task, String? reason});
}

/// @nodoc
class __$$PhysicalDTOImplCopyWithImpl<$Res>
    extends _$PhysicalDTOCopyWithImpl<$Res, _$PhysicalDTOImpl>
    implements _$$PhysicalDTOImplCopyWith<$Res> {
  __$$PhysicalDTOImplCopyWithImpl(
      _$PhysicalDTOImpl _value, $Res Function(_$PhysicalDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhysicalDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? task = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$PhysicalDTOImpl(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhysicalDTOImpl implements _PhysicalDTO {
  const _$PhysicalDTOImpl({this.state, this.task, this.reason});

  factory _$PhysicalDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhysicalDTOImplFromJson(json);

  @override
  final String? state;
  @override
  final String? task;
  @override
  final String? reason;

  @override
  String toString() {
    return 'PhysicalDTO(state: $state, task: $task, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhysicalDTOImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state, task, reason);

  /// Create a copy of PhysicalDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhysicalDTOImplCopyWith<_$PhysicalDTOImpl> get copyWith =>
      __$$PhysicalDTOImplCopyWithImpl<_$PhysicalDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhysicalDTOImplToJson(
      this,
    );
  }
}

abstract class _PhysicalDTO implements PhysicalDTO {
  const factory _PhysicalDTO(
      {final String? state,
      final String? task,
      final String? reason}) = _$PhysicalDTOImpl;

  factory _PhysicalDTO.fromJson(Map<String, dynamic> json) =
      _$PhysicalDTOImpl.fromJson;

  @override
  String? get state;
  @override
  String? get task;
  @override
  String? get reason;

  /// Create a copy of PhysicalDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhysicalDTOImplCopyWith<_$PhysicalDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IntellectualDTO _$IntellectualDTOFromJson(Map<String, dynamic> json) {
  return _IntellectualDTO.fromJson(json);
}

/// @nodoc
mixin _$IntellectualDTO {
  String? get state => throw _privateConstructorUsedError;
  String? get task => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this IntellectualDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IntellectualDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IntellectualDTOCopyWith<IntellectualDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntellectualDTOCopyWith<$Res> {
  factory $IntellectualDTOCopyWith(
          IntellectualDTO value, $Res Function(IntellectualDTO) then) =
      _$IntellectualDTOCopyWithImpl<$Res, IntellectualDTO>;
  @useResult
  $Res call({String? state, String? task, String? reason});
}

/// @nodoc
class _$IntellectualDTOCopyWithImpl<$Res, $Val extends IntellectualDTO>
    implements $IntellectualDTOCopyWith<$Res> {
  _$IntellectualDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IntellectualDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? task = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntellectualDTOImplCopyWith<$Res>
    implements $IntellectualDTOCopyWith<$Res> {
  factory _$$IntellectualDTOImplCopyWith(_$IntellectualDTOImpl value,
          $Res Function(_$IntellectualDTOImpl) then) =
      __$$IntellectualDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? state, String? task, String? reason});
}

/// @nodoc
class __$$IntellectualDTOImplCopyWithImpl<$Res>
    extends _$IntellectualDTOCopyWithImpl<$Res, _$IntellectualDTOImpl>
    implements _$$IntellectualDTOImplCopyWith<$Res> {
  __$$IntellectualDTOImplCopyWithImpl(
      _$IntellectualDTOImpl _value, $Res Function(_$IntellectualDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of IntellectualDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? task = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$IntellectualDTOImpl(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IntellectualDTOImpl implements _IntellectualDTO {
  const _$IntellectualDTOImpl({this.state, this.task, this.reason});

  factory _$IntellectualDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$IntellectualDTOImplFromJson(json);

  @override
  final String? state;
  @override
  final String? task;
  @override
  final String? reason;

  @override
  String toString() {
    return 'IntellectualDTO(state: $state, task: $task, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntellectualDTOImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state, task, reason);

  /// Create a copy of IntellectualDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IntellectualDTOImplCopyWith<_$IntellectualDTOImpl> get copyWith =>
      __$$IntellectualDTOImplCopyWithImpl<_$IntellectualDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IntellectualDTOImplToJson(
      this,
    );
  }
}

abstract class _IntellectualDTO implements IntellectualDTO {
  const factory _IntellectualDTO(
      {final String? state,
      final String? task,
      final String? reason}) = _$IntellectualDTOImpl;

  factory _IntellectualDTO.fromJson(Map<String, dynamic> json) =
      _$IntellectualDTOImpl.fromJson;

  @override
  String? get state;
  @override
  String? get task;
  @override
  String? get reason;

  /// Create a copy of IntellectualDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IntellectualDTOImplCopyWith<_$IntellectualDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmotionalDTO _$EmotionalDTOFromJson(Map<String, dynamic> json) {
  return _EmotionalDTO.fromJson(json);
}

/// @nodoc
mixin _$EmotionalDTO {
  String? get state => throw _privateConstructorUsedError;
  String? get task => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this EmotionalDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmotionalDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmotionalDTOCopyWith<EmotionalDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmotionalDTOCopyWith<$Res> {
  factory $EmotionalDTOCopyWith(
          EmotionalDTO value, $Res Function(EmotionalDTO) then) =
      _$EmotionalDTOCopyWithImpl<$Res, EmotionalDTO>;
  @useResult
  $Res call({String? state, String? task, String? reason});
}

/// @nodoc
class _$EmotionalDTOCopyWithImpl<$Res, $Val extends EmotionalDTO>
    implements $EmotionalDTOCopyWith<$Res> {
  _$EmotionalDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmotionalDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? task = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmotionalDTOImplCopyWith<$Res>
    implements $EmotionalDTOCopyWith<$Res> {
  factory _$$EmotionalDTOImplCopyWith(
          _$EmotionalDTOImpl value, $Res Function(_$EmotionalDTOImpl) then) =
      __$$EmotionalDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? state, String? task, String? reason});
}

/// @nodoc
class __$$EmotionalDTOImplCopyWithImpl<$Res>
    extends _$EmotionalDTOCopyWithImpl<$Res, _$EmotionalDTOImpl>
    implements _$$EmotionalDTOImplCopyWith<$Res> {
  __$$EmotionalDTOImplCopyWithImpl(
      _$EmotionalDTOImpl _value, $Res Function(_$EmotionalDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmotionalDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? task = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$EmotionalDTOImpl(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmotionalDTOImpl implements _EmotionalDTO {
  const _$EmotionalDTOImpl({this.state, this.task, this.reason});

  factory _$EmotionalDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmotionalDTOImplFromJson(json);

  @override
  final String? state;
  @override
  final String? task;
  @override
  final String? reason;

  @override
  String toString() {
    return 'EmotionalDTO(state: $state, task: $task, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmotionalDTOImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state, task, reason);

  /// Create a copy of EmotionalDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmotionalDTOImplCopyWith<_$EmotionalDTOImpl> get copyWith =>
      __$$EmotionalDTOImplCopyWithImpl<_$EmotionalDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmotionalDTOImplToJson(
      this,
    );
  }
}

abstract class _EmotionalDTO implements EmotionalDTO {
  const factory _EmotionalDTO(
      {final String? state,
      final String? task,
      final String? reason}) = _$EmotionalDTOImpl;

  factory _EmotionalDTO.fromJson(Map<String, dynamic> json) =
      _$EmotionalDTOImpl.fromJson;

  @override
  String? get state;
  @override
  String? get task;
  @override
  String? get reason;

  /// Create a copy of EmotionalDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmotionalDTOImplCopyWith<_$EmotionalDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpiritualDTO _$SpiritualDTOFromJson(Map<String, dynamic> json) {
  return _SpiritualDTO.fromJson(json);
}

/// @nodoc
mixin _$SpiritualDTO {
  String? get state => throw _privateConstructorUsedError;
  String? get task => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this SpiritualDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpiritualDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpiritualDTOCopyWith<SpiritualDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpiritualDTOCopyWith<$Res> {
  factory $SpiritualDTOCopyWith(
          SpiritualDTO value, $Res Function(SpiritualDTO) then) =
      _$SpiritualDTOCopyWithImpl<$Res, SpiritualDTO>;
  @useResult
  $Res call({String? state, String? task, String? reason});
}

/// @nodoc
class _$SpiritualDTOCopyWithImpl<$Res, $Val extends SpiritualDTO>
    implements $SpiritualDTOCopyWith<$Res> {
  _$SpiritualDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpiritualDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? task = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpiritualDTOImplCopyWith<$Res>
    implements $SpiritualDTOCopyWith<$Res> {
  factory _$$SpiritualDTOImplCopyWith(
          _$SpiritualDTOImpl value, $Res Function(_$SpiritualDTOImpl) then) =
      __$$SpiritualDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? state, String? task, String? reason});
}

/// @nodoc
class __$$SpiritualDTOImplCopyWithImpl<$Res>
    extends _$SpiritualDTOCopyWithImpl<$Res, _$SpiritualDTOImpl>
    implements _$$SpiritualDTOImplCopyWith<$Res> {
  __$$SpiritualDTOImplCopyWithImpl(
      _$SpiritualDTOImpl _value, $Res Function(_$SpiritualDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpiritualDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? task = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$SpiritualDTOImpl(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpiritualDTOImpl implements _SpiritualDTO {
  const _$SpiritualDTOImpl({this.state, this.task, this.reason});

  factory _$SpiritualDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpiritualDTOImplFromJson(json);

  @override
  final String? state;
  @override
  final String? task;
  @override
  final String? reason;

  @override
  String toString() {
    return 'SpiritualDTO(state: $state, task: $task, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpiritualDTOImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state, task, reason);

  /// Create a copy of SpiritualDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpiritualDTOImplCopyWith<_$SpiritualDTOImpl> get copyWith =>
      __$$SpiritualDTOImplCopyWithImpl<_$SpiritualDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpiritualDTOImplToJson(
      this,
    );
  }
}

abstract class _SpiritualDTO implements SpiritualDTO {
  const factory _SpiritualDTO(
      {final String? state,
      final String? task,
      final String? reason}) = _$SpiritualDTOImpl;

  factory _SpiritualDTO.fromJson(Map<String, dynamic> json) =
      _$SpiritualDTOImpl.fromJson;

  @override
  String? get state;
  @override
  String? get task;
  @override
  String? get reason;

  /// Create a copy of SpiritualDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpiritualDTOImplCopyWith<_$SpiritualDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyPlanDTO _$WeeklyPlanDTOFromJson(Map<String, dynamic> json) {
  return _WeeklyPlanDTO.fromJson(json);
}

/// @nodoc
mixin _$WeeklyPlanDTO {
  String? get monday => throw _privateConstructorUsedError;
  String? get tuesday => throw _privateConstructorUsedError;
  String? get wednesday => throw _privateConstructorUsedError;
  String? get thursday => throw _privateConstructorUsedError;
  String? get friday => throw _privateConstructorUsedError;
  String? get saturday => throw _privateConstructorUsedError;
  String? get sunday => throw _privateConstructorUsedError;

  /// Serializes this WeeklyPlanDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyPlanDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyPlanDTOCopyWith<WeeklyPlanDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyPlanDTOCopyWith<$Res> {
  factory $WeeklyPlanDTOCopyWith(
          WeeklyPlanDTO value, $Res Function(WeeklyPlanDTO) then) =
      _$WeeklyPlanDTOCopyWithImpl<$Res, WeeklyPlanDTO>;
  @useResult
  $Res call(
      {String? monday,
      String? tuesday,
      String? wednesday,
      String? thursday,
      String? friday,
      String? saturday,
      String? sunday});
}

/// @nodoc
class _$WeeklyPlanDTOCopyWithImpl<$Res, $Val extends WeeklyPlanDTO>
    implements $WeeklyPlanDTOCopyWith<$Res> {
  _$WeeklyPlanDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyPlanDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monday = freezed,
    Object? tuesday = freezed,
    Object? wednesday = freezed,
    Object? thursday = freezed,
    Object? friday = freezed,
    Object? saturday = freezed,
    Object? sunday = freezed,
  }) {
    return _then(_value.copyWith(
      monday: freezed == monday
          ? _value.monday
          : monday // ignore: cast_nullable_to_non_nullable
              as String?,
      tuesday: freezed == tuesday
          ? _value.tuesday
          : tuesday // ignore: cast_nullable_to_non_nullable
              as String?,
      wednesday: freezed == wednesday
          ? _value.wednesday
          : wednesday // ignore: cast_nullable_to_non_nullable
              as String?,
      thursday: freezed == thursday
          ? _value.thursday
          : thursday // ignore: cast_nullable_to_non_nullable
              as String?,
      friday: freezed == friday
          ? _value.friday
          : friday // ignore: cast_nullable_to_non_nullable
              as String?,
      saturday: freezed == saturday
          ? _value.saturday
          : saturday // ignore: cast_nullable_to_non_nullable
              as String?,
      sunday: freezed == sunday
          ? _value.sunday
          : sunday // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyPlanDTOImplCopyWith<$Res>
    implements $WeeklyPlanDTOCopyWith<$Res> {
  factory _$$WeeklyPlanDTOImplCopyWith(
          _$WeeklyPlanDTOImpl value, $Res Function(_$WeeklyPlanDTOImpl) then) =
      __$$WeeklyPlanDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? monday,
      String? tuesday,
      String? wednesday,
      String? thursday,
      String? friday,
      String? saturday,
      String? sunday});
}

/// @nodoc
class __$$WeeklyPlanDTOImplCopyWithImpl<$Res>
    extends _$WeeklyPlanDTOCopyWithImpl<$Res, _$WeeklyPlanDTOImpl>
    implements _$$WeeklyPlanDTOImplCopyWith<$Res> {
  __$$WeeklyPlanDTOImplCopyWithImpl(
      _$WeeklyPlanDTOImpl _value, $Res Function(_$WeeklyPlanDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyPlanDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monday = freezed,
    Object? tuesday = freezed,
    Object? wednesday = freezed,
    Object? thursday = freezed,
    Object? friday = freezed,
    Object? saturday = freezed,
    Object? sunday = freezed,
  }) {
    return _then(_$WeeklyPlanDTOImpl(
      monday: freezed == monday
          ? _value.monday
          : monday // ignore: cast_nullable_to_non_nullable
              as String?,
      tuesday: freezed == tuesday
          ? _value.tuesday
          : tuesday // ignore: cast_nullable_to_non_nullable
              as String?,
      wednesday: freezed == wednesday
          ? _value.wednesday
          : wednesday // ignore: cast_nullable_to_non_nullable
              as String?,
      thursday: freezed == thursday
          ? _value.thursday
          : thursday // ignore: cast_nullable_to_non_nullable
              as String?,
      friday: freezed == friday
          ? _value.friday
          : friday // ignore: cast_nullable_to_non_nullable
              as String?,
      saturday: freezed == saturday
          ? _value.saturday
          : saturday // ignore: cast_nullable_to_non_nullable
              as String?,
      sunday: freezed == sunday
          ? _value.sunday
          : sunday // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyPlanDTOImpl implements _WeeklyPlanDTO {
  const _$WeeklyPlanDTOImpl(
      {this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday});

  factory _$WeeklyPlanDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyPlanDTOImplFromJson(json);

  @override
  final String? monday;
  @override
  final String? tuesday;
  @override
  final String? wednesday;
  @override
  final String? thursday;
  @override
  final String? friday;
  @override
  final String? saturday;
  @override
  final String? sunday;

  @override
  String toString() {
    return 'WeeklyPlanDTO(monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, sunday: $sunday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyPlanDTOImpl &&
            (identical(other.monday, monday) || other.monday == monday) &&
            (identical(other.tuesday, tuesday) || other.tuesday == tuesday) &&
            (identical(other.wednesday, wednesday) ||
                other.wednesday == wednesday) &&
            (identical(other.thursday, thursday) ||
                other.thursday == thursday) &&
            (identical(other.friday, friday) || other.friday == friday) &&
            (identical(other.saturday, saturday) ||
                other.saturday == saturday) &&
            (identical(other.sunday, sunday) || other.sunday == sunday));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, monday, tuesday, wednesday,
      thursday, friday, saturday, sunday);

  /// Create a copy of WeeklyPlanDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyPlanDTOImplCopyWith<_$WeeklyPlanDTOImpl> get copyWith =>
      __$$WeeklyPlanDTOImplCopyWithImpl<_$WeeklyPlanDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyPlanDTOImplToJson(
      this,
    );
  }
}

abstract class _WeeklyPlanDTO implements WeeklyPlanDTO {
  const factory _WeeklyPlanDTO(
      {final String? monday,
      final String? tuesday,
      final String? wednesday,
      final String? thursday,
      final String? friday,
      final String? saturday,
      final String? sunday}) = _$WeeklyPlanDTOImpl;

  factory _WeeklyPlanDTO.fromJson(Map<String, dynamic> json) =
      _$WeeklyPlanDTOImpl.fromJson;

  @override
  String? get monday;
  @override
  String? get tuesday;
  @override
  String? get wednesday;
  @override
  String? get thursday;
  @override
  String? get friday;
  @override
  String? get saturday;
  @override
  String? get sunday;

  /// Create a copy of WeeklyPlanDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyPlanDTOImplCopyWith<_$WeeklyPlanDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiagnosticDTO _$DiagnosticDTOFromJson(Map<String, dynamic> json) {
  return _DiagnosticDTO.fromJson(json);
}

/// @nodoc
mixin _$DiagnosticDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this DiagnosticDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiagnosticDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosticDTOCopyWith<DiagnosticDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosticDTOCopyWith<$Res> {
  factory $DiagnosticDTOCopyWith(
          DiagnosticDTO value, $Res Function(DiagnosticDTO) then) =
      _$DiagnosticDTOCopyWithImpl<$Res, DiagnosticDTO>;
  @useResult
  $Res call({int? id, String? title});
}

/// @nodoc
class _$DiagnosticDTOCopyWithImpl<$Res, $Val extends DiagnosticDTO>
    implements $DiagnosticDTOCopyWith<$Res> {
  _$DiagnosticDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagnosticDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiagnosticDTOImplCopyWith<$Res>
    implements $DiagnosticDTOCopyWith<$Res> {
  factory _$$DiagnosticDTOImplCopyWith(
          _$DiagnosticDTOImpl value, $Res Function(_$DiagnosticDTOImpl) then) =
      __$$DiagnosticDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? title});
}

/// @nodoc
class __$$DiagnosticDTOImplCopyWithImpl<$Res>
    extends _$DiagnosticDTOCopyWithImpl<$Res, _$DiagnosticDTOImpl>
    implements _$$DiagnosticDTOImplCopyWith<$Res> {
  __$$DiagnosticDTOImplCopyWithImpl(
      _$DiagnosticDTOImpl _value, $Res Function(_$DiagnosticDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagnosticDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$DiagnosticDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosticDTOImpl implements _DiagnosticDTO {
  const _$DiagnosticDTOImpl({this.id, this.title});

  factory _$DiagnosticDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosticDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;

  @override
  String toString() {
    return 'DiagnosticDTO(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosticDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of DiagnosticDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosticDTOImplCopyWith<_$DiagnosticDTOImpl> get copyWith =>
      __$$DiagnosticDTOImplCopyWithImpl<_$DiagnosticDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosticDTOImplToJson(
      this,
    );
  }
}

abstract class _DiagnosticDTO implements DiagnosticDTO {
  const factory _DiagnosticDTO({final int? id, final String? title}) =
      _$DiagnosticDTOImpl;

  factory _DiagnosticDTO.fromJson(Map<String, dynamic> json) =
      _$DiagnosticDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;

  /// Create a copy of DiagnosticDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosticDTOImplCopyWith<_$DiagnosticDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
