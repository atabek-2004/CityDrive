import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/search/model/road_problem_dto.dart';
import 'package:intl/intl.dart';

@RoutePage()
class RoadProblemDetailPage extends StatelessWidget {
  final RoadProblemDTO problem;

  const RoadProblemDetailPage({
    super.key,
    required this.problem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Подробности'),
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
                        _getTypeText(problem.type),
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
                          '${problem.address ?? 'Адрес не указан'}'
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
                            : 'Не указано',
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
                        problem.author ?? 'Самат',
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
                                  'Комментарии',
                                  style: AppTextStyles.body15w500.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Показать все',
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
                              'Оставьте первый комментарий',
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
              'Фото недоступно',
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

  String _getTypeText(String? type) {
    switch (type) {
      case 'pothole':
        return 'Яма на дороге';
      case 'damage':
        return 'Повреждение покрытия';
      case 'crack':
        return 'Трещины';
      case 'subsidence':
        return 'Проседание асфальта';
      default:
        return 'Повреждение дороги';
    }
  }
}
