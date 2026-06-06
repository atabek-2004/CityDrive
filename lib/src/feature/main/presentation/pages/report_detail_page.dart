import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:city_drive/src/core/constant/localization/translations/app_localizations.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/core/local_storage/report_status_ui.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/search/bloc/road_problems_provider.dart';
import 'package:city_drive/src/feature/search/presentation/utils/road_problem_labels.dart';

@RoutePage()
class ReportDetailPage extends StatefulWidget {
  const ReportDetailPage({
    super.key,
    required this.reportId,
    required this.imageUrl,
  });

  final String reportId;
  final String imageUrl;

  @override
  State<ReportDetailPage> createState() => _ReportDetailPageState();
}

class _ReportDetailPageState extends State<ReportDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<RoadProblemsProvider>().load();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;
    final id = int.tryParse(widget.reportId);
    final problem = id != null
        ? context.watch<RoadProblemsProvider>().getProblemById(id)
        : null;

    final status = problem?.status;
    final imageUrl = problem?.images?.isNotEmpty == true
        ? problem!.images!.first
        : widget.imageUrl;
    final title = problem?.title ?? l10n.cityDriveProblemOnRoad;
    final address = problem?.address ?? l10n.cityDriveAddressNotSpecified;
    final description = problem?.description ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.router.maybePop(),
        ),
        title: Text(
          l10n.cityDriveMarkDetails,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: _ReportImage(imageUrl: imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      const Gap(4),
                      Expanded(
                        child: Text(
                          address,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (description.isNotEmpty) ...[
                    const Gap(24),
                    Text(
                      l10n.description.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade800,
                        height: 1.5,
                      ),
                    ),
                  ],
                  const Gap(32),
                  Text(
                    l10n.status,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(12),
                  ReportStatusBadge(
                    status: status,
                    label: controllerStatusLabel(l10n, status),
                  ),
                  const Gap(24),
                  const Text(
                    'Статус заявки',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  StatusTimeline(steps: _buildTimelineSteps(l10n, status)),
                  const Gap(32),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _infoText(status),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const Gap(24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: id == null
                          ? null
                          : () => _showDeleteDialog(context, id),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF3B30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Удалить отметку',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _infoText(String? status) {
    if (status == ReportStatus.rejected) {
      return 'Администратор отклонил вашу отметку. Вы можете удалить её или отправить новую с карты.';
    }
    if (status == ReportStatus.fixed) {
      return 'Проблема отмечена как исправленная. Спасибо за участие в улучшении города!';
    }
    return 'Администратор проверит вашу отметку и подтвердит её или отклонит. Вы получите уведомление о решении.';
  }

  void _showDeleteDialog(BuildContext context, int id) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Удалить отметку?'),
        content: const Text('Это действие нельзя отменить.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(context.localized.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              await context.read<RoadProblemsProvider>().removeProblem(id);
              if (context.mounted) {
                context.router.maybePop();
              }
            },
            child: Text(
              context.localized.delete,
              style: const TextStyle(color: Color(0xFFFF3B30)),
            ),
          ),
        ],
      ),
    );
  }
}

List<StatusStep> _buildTimelineSteps(AppLocalizations l10n, String? status) {
  final stage = _timelineStage(status);
  final isRejected = status == ReportStatus.rejected;

  if (isRejected) {
    return [
      StatusStep(
        title: l10n.cityDriveOnVerification,
        icon: ReportStatusUi.iconFor(ReportStatus.pending),
        color: ReportStatusUi.colorFor(ReportStatus.pending),
        isCompleted: true,
        isActive: false,
      ),
      StatusStep(
        title: l10n.cityDriveStatusRejected,
        icon: ReportStatusUi.iconFor(ReportStatus.rejected),
        color: ReportStatusUi.colorFor(ReportStatus.rejected),
        isCompleted: false,
        isActive: true,
      ),
    ];
  }

  final steps = <({String title, String statusKey})>[
    (title: l10n.cityDriveOnVerification, statusKey: ReportStatus.pending),
    (title: l10n.cityDriveStatusAccepted, statusKey: ReportStatus.confirmed),
    (title: l10n.cityDriveStatusInWork, statusKey: ReportStatus.inProgress),
    (title: l10n.cityDriveStatusFixed, statusKey: ReportStatus.fixed),
  ];

  return List.generate(steps.length, (index) {
    final step = steps[index];
    final isCompleted = stage > index;
    final isActive = stage == index;
    return StatusStep(
      title: step.title,
      icon: ReportStatusUi.iconFor(step.statusKey),
      color: ReportStatusUi.colorFor(step.statusKey),
      isCompleted: isCompleted,
      isActive: isActive,
    );
  });
}

int _timelineStage(String? status) {
  switch (status) {
    case ReportStatus.newReport:
    case ReportStatus.pending:
      return 0;
    case ReportStatus.confirmed:
      return 1;
    case ReportStatus.inProgress:
      return 2;
    case ReportStatus.fixed:
      return 3;
    default:
      return 0;
  }
}

class StatusStep {
  final String title;
  final IconData icon;
  final Color color;
  final bool isCompleted;
  final bool isActive;

  StatusStep({
    required this.title,
    required this.icon,
    required this.color,
    required this.isCompleted,
    required this.isActive,
  });
}

class StatusTimeline extends StatelessWidget {
  const StatusTimeline({super.key, required this.steps});

  final List<StatusStep> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final isLast = index == steps.length - 1;
        final isHighlighted = step.isCompleted || step.isActive;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isHighlighted ? step.color : Colors.grey.shade300,
                  ),
                  child: Icon(
                    step.icon,
                    color: isHighlighted ? Colors.white : Colors.grey.shade500,
                    size: 20,
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 40,
                    color: step.isCompleted
                        ? step.color.withValues(alpha: 0.5)
                        : Colors.grey.shade300,
                  ),
              ],
            ),
            const Gap(12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  step.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: step.isActive ? FontWeight.w600 : FontWeight.w400,
                    color: isHighlighted ? Colors.black : Colors.grey.shade500,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _ReportImage extends StatelessWidget {
  const _ReportImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return ColoredBox(
        color: Colors.grey.shade300,
        child: const Center(
          child: Icon(Icons.image, color: Colors.grey, size: 60),
        ),
      );
    }
    if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => ColoredBox(
          color: Colors.grey.shade300,
          child: const Center(
            child: Icon(Icons.image, color: Colors.grey, size: 60),
          ),
        ),
      );
    }
    final file = File(imageUrl);
    if (file.existsSync()) {
      return Image.file(file, fit: BoxFit.cover);
    }
    return ColoredBox(
      color: Colors.grey.shade300,
      child: const Center(
        child: Icon(Icons.image, color: Colors.grey, size: 60),
      ),
    );
  }
}
