import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/core/local_storage/user_role.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/constant/localization/localization.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/search/bloc/road_problems_provider.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';
import 'package:city_drive/src/feature/search/presentation/utils/road_problem_labels.dart';
import 'package:intl/intl.dart';

@RoutePage()
class RoadProblemDetailPage extends StatelessWidget {
  final RoadProblemDTO problem;

  const RoadProblemDetailPage({
    super.key,
    required this.problem,
  });

  Future<void> _moderate(
    BuildContext context, {
    required String status,
  }) async {
    final controllerId = context.repository.authRepository.user?.id;
    await context.read<RoadProblemsProvider>().updateStatus(
          id: problem.id,
          status: status,
          assignedControllerId: controllerId,
        );
    if (context.mounted) {
      final l10n = context.localized;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            status == ReportStatus.confirmed
                ? l10n.cityDriveMarkAcceptedSnack
                : l10n.cityDriveMarkRejectedSnack,
          ),
        ),
      );
      context.router.maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isController =
        context.repository.sessionRepository.currentRole ==
            UserRole.controller;
    final controllerId = context.repository.authRepository.user?.id;
    final canModerate = isController &&
        (problem.status == ReportStatus.newReport ||
            problem.status == ReportStatus.pending);
    final canSubmitReport = isController &&
        !canModerate &&
        (problem.status == ReportStatus.confirmed ||
            problem.status == ReportStatus.inProgress) &&
        (problem.assignedControllerId == null ||
            problem.assignedControllerId == controllerId);

    if (isController) {
      return _ControllerAnnouncementDetail(
        problem: problem,
        canModerate: canModerate,
        canSubmitReport: canSubmitReport,
        onReject: () => _moderate(context, status: ReportStatus.rejected),
        onAccept: () => context.router.push(
          ControllerAcceptApplicationRoute(problem: problem),
        ),
        onSubmitReport: () =>
            context.router.push(WorkReportRoute(problem: problem)),
        buildImage: _buildImage,
      );
    }

    final l10n = context.localized;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(l10n.cityDriveDetailsTitle),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.blac151619,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 350,
              color: Colors.grey[300],
              child: _buildImage(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        _getTypeIcon(problem.type),
                        size: 24,
                      ),
                      const Gap(12),
                      Text(
                        problemTypeLabel(l10n, problem.type),
                        style: AppTextStyles.body15w500,
                      ),
                    ],
                  ),
                  const Gap(16),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 24,
                      ),
                      const Gap(12),
                      Expanded(
                        child: Text(
                          '${problem.address ?? l10n.cityDriveAddressNotSpecified}'
                          '${problem.latitude != null && problem.longitude != null ? ' (координаты: ${problem.latitude!.toStringAsFixed(4)}, ${problem.longitude!.toStringAsFixed(4)})' : ''}',
                          style: AppTextStyles.body15w500,
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),

                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        size: 24,
                      ),
                      const Gap(12),
                      Text(
                        problem.reportedDate != null
                            ? DateFormat('HH:mm').format(problem.reportedDate!)
                            : l10n.cityDriveNotSpecified,
                        style: AppTextStyles.body15w500,
                      ),
                    ],
                  ),
                  const Gap(16),

                  Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        size: 24,
                      ),
                      const Gap(12),
                      Text(
                        problem.author ?? l10n.cityDriveResident,
                        style: AppTextStyles.body15w500,
                      ),
                    ],
                  ),
                  const Gap(20),

                  if (problem.description != null) ...[
                    Text(
                      problem.description!,
                      style: AppTextStyles.body15w500,
                    ),
                    const Gap(24),
                  ],

                  // Замените секцию комментариев на это:

// Лайки и комментарии (кликабельные)
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Text('👍', style: TextStyle(fontSize: 16)),
                            const Gap(4),
                            Text(
                              '${problem.likes ?? 0}',
                              style: AppTextStyles.body14w400.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(12),

                      // Кликабельный блок комментариев
                      GestureDetector(
                        onTap: () {
                          context.router.push(CommentsRoute(problem: problem));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Text('💬', style: TextStyle(fontSize: 16)),
                              const Gap(4),
                              Text(
                                '${problem.commentsCount ?? 0}',
                                style: AppTextStyles.body14w400.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),

// Превью первого комментария (если есть)
                  if (problem.comments != null &&
                      problem.comments!.isNotEmpty) ...[
                    GestureDetector(
                      onTap: () {
                        context.router.push(CommentsRoute(problem: problem));
                      },
                      child: Container(
                        
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  l10n.cityDriveComments,
                                  style: AppTextStyles.body15w500.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      l10n.cityDriveShowAll,
                                      style: AppTextStyles.body14w400.copyWith(
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                    const Gap(4),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14,
                                      color: AppColors.mainColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Gap(12),

                          
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    problem.comments!.first.author,
                                    style: AppTextStyles.body14w400.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Gap(4),
                                  Text(
                                    problem.comments!.first.text,
                                    style: AppTextStyles.body14w400.copyWith(
                                      color: Colors.grey.shade600,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Gap(4),
                                  Text(
                                    _formatCommentTime(
                                        problem.comments!.first.time),
                                    style: AppTextStyles.body12W400.copyWith(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ] else ...[
                    
                    GestureDetector(
                      onTap: () {
                        context.router.push(CommentsRoute(problem: problem));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.chat_bubble_outline,
                                color: Colors.grey[400]),
                            const Gap(12),
                            Text(
                              l10n.cityDriveLeaveFirstComment,
                              style: AppTextStyles.body14w400.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  const Gap(24),

                  // if (problem.comments != null &&
                  //     problem.comments!.isNotEmpty) ...[
                  //   Text(
                  //     'Комментарий',
                  //     style: AppTextStyles.body15w500.copyWith(
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  //   const Gap(12),
                  //   ...problem.comments!.map((comment) => Padding(
                  //         padding: const EdgeInsets.only(bottom: 12),
                  //         child: Container(
                  //           width: double.infinity,
                  //           padding: const EdgeInsets.all(12),
                  //           decoration: BoxDecoration(
                  //             color: Colors.grey.shade100,
                  //             borderRadius: BorderRadius.circular(12),
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 comment.author,
                  //                 style: AppTextStyles.body14w400.copyWith(
                  //                   fontWeight: FontWeight.w600,
                  //                 ),
                  //               ),
                  //               const Gap(4),
                  //               Text(
                  //                 comment.text,
                  //                 style: AppTextStyles.body14w400.copyWith(
                  //                   color: Colors.grey.shade600,
                  //                 ),
                  //               ),
                  //               const Gap(4),
                  //               Text(
                  //                 _formatCommentTime(comment.time),
                  //                 style: AppTextStyles.body12W400.copyWith(
                  //                   color: Colors.grey.shade500,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       )),
                  
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: canModerate
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _moderate(
                          context,
                          status: ReportStatus.rejected,
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(l10n.cityDriveReject),
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _moderate(
                          context,
                          status: ReportStatus.confirmed,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(
                          l10n.accept,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildImage() {
    if (problem.images == null || problem.images!.isEmpty) {
      return _buildPlaceholderImage();
    }

    final imagePath = problem.images!.first;

    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return Image.network(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholderImage();
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      );
    } else {
      final file = File(imagePath);
      if (file.existsSync()) {
        return Image.file(
          file,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            debugPrint('Ошибка загрузки локального файла: $error');
            return _buildPlaceholderImage();
          },
        );
      } else {
        debugPrint('Файл не существует: $imagePath');
        return _buildPlaceholderImage();
      }
    }
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: Colors.grey[300],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const Gap(8),
            Text(
              Localization.currentLocalizations.cityDrivePhotoUnavailable,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatCommentTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) {
      return 'только что';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} мин назад';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${_hourWord(difference.inHours)} назад';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${_dayWord(difference.inDays)} назад';
    } else {
      return DateFormat('dd.MM.yyyy').format(time);
    }
  }

  String _hourWord(int hours) {
    if (hours == 1) return 'час';
    if (hours >= 2 && hours <= 4) return 'часа';
    return 'часов';
  }

  String _dayWord(int days) {
    if (days == 1) return 'день';
    if (days >= 2 && days <= 4) return 'дня';
    return 'дней';
  }

  IconData _getTypeIcon(String? type) {
    switch (type) {
      case 'pothole':
        return Icons.warning_amber_rounded;
      case 'damage':
        return Icons.construction;
      case 'crack':
        return Icons.format_line_spacing;
      case 'subsidence':
        return Icons.trending_down;
      default:
        return Icons.report_problem_outlined;
    }
  }

}

/// Экран деталей объявления для контроллера (как в макете Figma).
class _ControllerAnnouncementDetail extends StatelessWidget {
  const _ControllerAnnouncementDetail({
    required this.problem,
    required this.canModerate,
    required this.canSubmitReport,
    required this.onReject,
    required this.onAccept,
    required this.onSubmitReport,
    required this.buildImage,
  });

  final RoadProblemDTO problem;
  final bool canModerate;
  final bool canSubmitReport;
  final VoidCallback onReject;
  final VoidCallback onAccept;
  final VoidCallback onSubmitReport;
  final Widget Function() buildImage;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.38,
            child: Stack(
              fit: StackFit.expand,
              children: [
                buildImage(),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.35),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            child: GestureDetector(
              onTap: () => context.router.maybePop(),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.33,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.status,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const Gap(8),
                            _StatusBadge(
                              label: controllerStatusLabel(l10n, problem.status),
                              color: controllerStatusColor(problem.status),
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.cityDriveLevel,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const Gap(8),
                            _StatusBadge(
                              label: severityLabel(l10n, problem.severity),
                              color: severityColor(problem.severity),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(28),
                  Text(
                    l10n.cityDriveInformation,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      Expanded(
                        child: _InfoTile(
                          label: l10n.cityDriveAddress,
                          value: problem.address ?? '—',
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: _InfoTile(
                          label: l10n.cityDriveType,
                          value: problemTypeShortLabel(l10n, problem.type),
                        ),
                      ),
                    ],
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      Expanded(
                        child: _InfoTile(
                          label: l10n.cityDriveAuthor,
                          value: problem.author ?? l10n.cityDriveResident,
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: _InfoTile(
                          label: l10n.cityDriveDateLabel,
                          value: problem.reportedDate != null
                              ? DateFormat('dd.MM.yyyy')
                                  .format(problem.reportedDate!)
                              : '—',
                        ),
                      ),
                    ],
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      Expanded(
                        child: _InfoTile(
                          label: l10n.cityDriveUrgency,
                          value: severityLabel(l10n, problem.severity),
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: _InfoTile(
                          label: 'ID',
                          value: '#${problem.id}',
                        ),
                      ),
                    ],
                  ),
                  const Gap(28),
                  Text(
                    l10n.description,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      problem.description ?? l10n.cityDriveResidentReported,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (canModerate)
            Positioned(
              left: 24,
              right: 24,
              bottom: MediaQuery.of(context).padding.bottom + 16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onAccept,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainColor,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        l10n.cityDriveAcceptApplicationBtn,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const Gap(8),
                  TextButton(
                    onPressed: onReject,
                    child: Text(
                      l10n.cityDriveReject,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          if (canSubmitReport)
            Positioned(
              left: 24,
              right: 24,
              bottom: MediaQuery.of(context).padding.bottom + 16,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onSubmitReport,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    l10n.cityDriveSubmitReport,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const Gap(6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
