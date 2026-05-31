import 'package:flutter/material.dart';
import 'package:city_drive/src/core/constant/localization/translations/app_localizations.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/core/local_storage/report_status_ui.dart';

String severityLabel(AppLocalizations l10n, String? severity) {
  switch (severity) {
    case 'critical':
      return l10n.cityDriveSeverityCritical;
    case 'high':
      return l10n.cityDriveSeverityHigh;
    case 'medium':
      return l10n.cityDriveSeverityMedium;
    case 'low':
      return l10n.cityDriveSeverityLow;
    default:
      return l10n.cityDriveSeverityMedium;
  }
}

Color severityColor(String? severity) {
  switch (severity) {
    case 'critical':
      return const Color(0xFFFF6B6B);
    case 'high':
      return const Color(0xFFFFA726);
    case 'medium':
      return const Color(0xFFFFEB3B);
    default:
      return Colors.grey;
  }
}

String controllerStatusLabel(AppLocalizations l10n, String? status) {
  switch (status) {
    case ReportStatus.newReport:
    case ReportStatus.pending:
      return l10n.cityDriveStatusOpen;
    case ReportStatus.confirmed:
      return l10n.cityDriveStatusAccepted;
    case ReportStatus.inProgress:
      return l10n.cityDriveStatusInWork;
    case ReportStatus.rejected:
      return l10n.cityDriveStatusRejected;
    case ReportStatus.fixed:
      return l10n.cityDriveStatusDone;
    default:
      return l10n.cityDriveStatusOpen;
  }
}

Color controllerStatusColor(String? status) {
  switch (status) {
    case ReportStatus.confirmed:
    case ReportStatus.fixed:
      return const Color(0xFF4CD964);
    case ReportStatus.rejected:
      return Colors.red;
    case ReportStatus.inProgress:
      return const Color(0xFF4A9EFF);
    default:
      return const Color(0xFF91D5FF);
  }
}

String publishedLabel(AppLocalizations l10n, DateTime? date) {
  final formatted = formatReportDate(l10n, date);
  if (formatted.isEmpty) return l10n.cityDrivePublishedRecently;
  if (formatted == l10n.cityDriveToday) return l10n.cityDrivePublishedToday;
  if (formatted == l10n.cityDriveYesterday) {
    return l10n.cityDrivePublishedYesterday;
  }
  return l10n.cityDrivePublishedOn(formatted);
}

String problemTypeLabel(AppLocalizations l10n, String? type) {
  switch (type) {
    case 'pothole':
      return l10n.cityDriveProblemTypePothole;
    case 'damage':
      return l10n.cityDriveProblemTypeDamage;
    case 'crack':
      return l10n.cityDriveProblemTypeCracks;
    case 'subsidence':
      return l10n.cityDriveProblemTypeSubsidence;
    default:
      return l10n.cityDriveRoadDamage;
  }
}

String problemTypeShortLabel(AppLocalizations l10n, String? type) {
  switch (type) {
    case 'pothole':
      return l10n.cityDriveTypePothole;
    case 'damage':
      return l10n.cityDriveTypeDamage;
    case 'crack':
      return l10n.cityDriveTypeCrack;
    default:
      return l10n.cityDriveTypeRoad;
  }
}

String formatReportDate(AppLocalizations l10n, DateTime? date) {
  if (date == null) return '';
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final d = DateTime(date.year, date.month, date.day);
  if (d == today) return l10n.cityDriveToday;
  if (d == today.subtract(const Duration(days: 1))) {
    return l10n.cityDriveYesterday;
  }
  return '${date.day}.${date.month.toString().padLeft(2, '0')}.${date.year}';
}
