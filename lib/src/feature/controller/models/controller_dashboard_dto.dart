// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

part 'controller_dashboard_dto.freezed.dart';
part 'controller_dashboard_dto.g.dart';

@freezed
class ControllerDashboardStatsDTO with _$ControllerDashboardStatsDTO {
  const factory ControllerDashboardStatsDTO({
    @JsonKey(name: 'new_count') @Default(0) int newCount,
    @JsonKey(name: 'applications_count') @Default(0) int applicationsCount,
    @JsonKey(name: 'in_work_count') @Default(0) int inWorkCount,
    @JsonKey(name: 'done_count') @Default(0) int doneCount,
  }) = _ControllerDashboardStatsDTO;

  factory ControllerDashboardStatsDTO.fromJson(Map<String, dynamic> json) =>
      _$ControllerDashboardStatsDTOFromJson(json);
}

class ControllerDashboardDTO {
  const ControllerDashboardDTO({
    required this.stats,
    required this.pendingMarks,
    required this.myMarks,
  });

  final ControllerDashboardStatsDTO stats;
  final List<RoadProblemDTO> pendingMarks;
  final List<RoadProblemDTO> myMarks;

  factory ControllerDashboardDTO.fromJson(Map<String, dynamic> json) {
    List<RoadProblemDTO> parseMarks(Object? raw) {
      if (raw is! List) return [];
      return raw
          .whereType<Map>()
          .map((e) => RoadProblemDTO.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }

    final statsRaw = json['stats'];
    final stats = statsRaw is Map<String, dynamic>
        ? ControllerDashboardStatsDTO.fromJson(statsRaw)
        : const ControllerDashboardStatsDTO();

    return ControllerDashboardDTO(
      stats: stats,
      pendingMarks: parseMarks(json['pending_marks']),
      myMarks: parseMarks(json['my_marks']),
    );
  }

  /// Prefer backend [stats]; fill in_work/done from [myMarks] when stats are zero.
  ControllerDashboardStatsDTO get displayStats {
    final fromMy = _statsFromMyMarks(myMarks);
    return stats.copyWith(
      inWorkCount:
          stats.inWorkCount > 0 ? stats.inWorkCount : fromMy.inWorkCount,
      doneCount: stats.doneCount > 0 ? stats.doneCount : fromMy.doneCount,
    );
  }

  static ControllerDashboardStatsDTO _statsFromMyMarks(
    List<RoadProblemDTO> marks,
  ) {
    var inWork = 0;
    var done = 0;
    for (final m in marks) {
      if (m.status == ReportStatus.confirmed ||
          m.status == ReportStatus.inProgress) {
        inWork++;
      } else if (m.status == ReportStatus.fixed) {
        done++;
      }
    }
    return ControllerDashboardStatsDTO(inWorkCount: inWork, doneCount: done);
  }
}
