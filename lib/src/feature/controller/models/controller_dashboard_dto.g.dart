// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_dashboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ControllerDashboardStatsDTOImpl _$$ControllerDashboardStatsDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ControllerDashboardStatsDTOImpl(
      newCount: (json['new_count'] as num?)?.toInt() ?? 0,
      applicationsCount: (json['applications_count'] as num?)?.toInt() ?? 0,
      inWorkCount: (json['in_work_count'] as num?)?.toInt() ?? 0,
      doneCount: (json['done_count'] as num?)?.toInt() ?? 0,
      pendingReviewCount: (json['pending_review_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ControllerDashboardStatsDTOImplToJson(
        _$ControllerDashboardStatsDTOImpl instance) =>
    <String, dynamic>{
      'new_count': instance.newCount,
      'applications_count': instance.applicationsCount,
      'in_work_count': instance.inWorkCount,
      'done_count': instance.doneCount,
      'pending_review_count': instance.pendingReviewCount,
    };
