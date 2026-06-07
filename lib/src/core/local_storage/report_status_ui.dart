import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:city_drive/src/core/constant/localization/translations/app_localizations.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';

class ReportStatusUi {
  const ReportStatusUi({
    required this.label,
    required this.icon,
    required this.color,
    required this.backgroundColor,
  });

  final String label;
  final IconData icon;
  final Color color;
  final Color backgroundColor;

  static ReportStatusUi fromStatus(AppLocalizations l10n, String? status) {
    return ReportStatusUi(
      label: _label(l10n, status),
      icon: iconFor(status),
      color: colorFor(status),
      backgroundColor: backgroundColorFor(status),
    );
  }

  static IconData iconFor(String? status) {
    switch (_normalize(status)) {
      case ReportStatus.newReport:
        return Icons.add_location_alt_outlined;
      case ReportStatus.pending:
        return Icons.hourglass_top_rounded;
      case ReportStatus.confirmed:
        return Icons.check_circle_outline;
      case ReportStatus.controllerAssigned:
        return Icons.schedule_outlined;
      case ReportStatus.rejected:
        return Icons.block_outlined;
      case ReportStatus.inProgress:
        return Icons.construction_outlined;
      case ReportStatus.reportSubmitted:
        return Icons.fact_check_outlined;
      case ReportStatus.fixed:
        return Icons.done_all_rounded;
      default:
        return Icons.schedule_outlined;
    }
  }

  static String? _normalize(String? status) {
    if (status == null) return null;
    return switch (status) {
      'in progress' => ReportStatus.inProgress,
      _ => status,
    };
  }

  static Color colorFor(String? status) {
    switch (_normalize(status)) {
      case ReportStatus.newReport:
        return const Color(0xFFFF9500);
      case ReportStatus.pending:
        return const Color(0xFFFFB020);
      case ReportStatus.confirmed:
        return const Color(0xFF34C759);
      case ReportStatus.controllerAssigned:
        return const Color(0xFFFF9500);
      case ReportStatus.rejected:
        return const Color(0xFFFF3B30);
      case ReportStatus.inProgress:
        return const Color(0xFF4A9EFF);
      case ReportStatus.reportSubmitted:
        return const Color(0xFFFF9500);
      case ReportStatus.fixed:
        return const Color(0xFF00897B);
      default:
        return const Color(0xFFFF9500);
    }
  }

  static Color backgroundColorFor(String? status) =>
      colorFor(status).withValues(alpha: 0.14);

  static double mapMarkerHueFor(String? status) {
    switch (_normalize(status)) {
      case ReportStatus.newReport:
        return BitmapDescriptor.hueOrange;
      case ReportStatus.pending:
        return BitmapDescriptor.hueYellow;
      case ReportStatus.confirmed:
        return BitmapDescriptor.hueGreen;
      case ReportStatus.inProgress:
        return BitmapDescriptor.hueBlue;
      case ReportStatus.fixed:
        return BitmapDescriptor.hueCyan;
      case ReportStatus.rejected:
        return BitmapDescriptor.hueRed;
      default:
        return BitmapDescriptor.hueOrange;
    }
  }

  static String _label(AppLocalizations l10n, String? status) {
    switch (_normalize(status)) {
      case ReportStatus.newReport:
      case ReportStatus.pending:
        return l10n.cityDriveOnVerification;
      case ReportStatus.confirmed:
        return l10n.cityDriveStatusAccepted;
      case ReportStatus.controllerAssigned:
        return l10n.cityDriveAdminReview;
      case ReportStatus.rejected:
        return l10n.cityDriveFilterRejected;
      case ReportStatus.inProgress:
        return l10n.cityDriveStatusInWork;
      case ReportStatus.reportSubmitted:
        return l10n.cityDriveReportSubmittedPending;
      case ReportStatus.fixed:
        return l10n.cityDriveStatusFixed;
      default:
        return l10n.cityDriveOnVerification;
    }
  }
}

/// Бейдж статуса с иконкой (списки, детали).
class ReportStatusBadge extends StatelessWidget {
  const ReportStatusBadge({
    required this.status,
    required this.label,
    this.compact = false,
    this.color,
    super.key,
  });

  final String? status;
  final String label;
  final bool compact;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final badgeColor = color ?? ReportStatusUi.colorFor(status);
    final bg = ReportStatusUi.backgroundColorFor(status);

    if (compact) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ReportStatusIcon(status: status, size: 28),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: badgeColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: badgeColor.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReportStatusIcon(status: status, size: 32),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: badgeColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Круглая иконка статуса для карточек списка.
class ReportStatusIcon extends StatelessWidget {
  const ReportStatusIcon({
    required this.status,
    this.size = 36,
    super.key,
  });

  final String? status;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = ReportStatusUi.colorFor(status);
    final icon = ReportStatusUi.iconFor(status);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: ReportStatusUi.backgroundColorFor(status),
        shape: BoxShape.circle,
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Icon(icon, color: color, size: size * 0.52),
    );
  }
}
