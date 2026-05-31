import 'package:flutter/material.dart';
import 'package:city_drive/src/core/constant/localization/translations/app_localizations.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/feature/search/presentation/utils/road_problem_labels.dart';

class ReportStatusUi {
  const ReportStatusUi({
    required this.label,
    required this.icon,
    required this.color,
  });

  final String label;
  final IconData icon;
  final Color color;

  static ReportStatusUi fromStatus(AppLocalizations l10n, String? status) {
    switch (status) {
      case ReportStatus.confirmed:
        return ReportStatusUi(
          label: l10n.cityDriveStatusConfirmed,
          icon: Icons.check_circle_outline,
          color: const Color(0xFF34C759),
        );
      case ReportStatus.rejected:
        return ReportStatusUi(
          label: l10n.cityDriveFilterRejected,
          icon: Icons.cancel_outlined,
          color: Colors.red,
        );
      case ReportStatus.inProgress:
        return ReportStatusUi(
          label: l10n.cityDriveStatusInWork,
          icon: Icons.engineering_outlined,
          color: const Color(0xFF4A9EFF),
        );
      case ReportStatus.fixed:
        return ReportStatusUi(
          label: l10n.cityDriveStatusFixed,
          icon: Icons.check_circle,
          color: const Color(0xFF34C759),
        );
      case ReportStatus.pending:
      case ReportStatus.newReport:
      default:
        return ReportStatusUi(
          label: l10n.cityDriveUnderReview,
          icon: Icons.access_time,
          color: Colors.orange,
        );
    }
  }
}
