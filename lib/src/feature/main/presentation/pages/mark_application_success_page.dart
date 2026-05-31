import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

enum MarkApplicationSuccessKind {
  accepted,

  submitted,
}

@RoutePage()
class MarkApplicationSuccessPage extends StatelessWidget {
  const MarkApplicationSuccessPage({
    super.key,
    required this.problem,
    this.kind = MarkApplicationSuccessKind.submitted,
  });

  final RoadProblemDTO problem;
  final MarkApplicationSuccessKind kind;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;
    final isAccepted = kind == MarkApplicationSuccessKind.accepted;
    final title = isAccepted
        ? l10n.cityDriveApplicationAcceptedTitle
        : l10n.cityDriveApplicationSentTitle;
    final subtitle = isAccepted
        ? l10n.cityDriveApplicationAcceptedBody
        : l10n.cityDriveApplicationSentBody;
    final firstStepTitle = isAccepted
        ? l10n.cityDriveApplicationAcceptedStep
        : l10n.cityDriveApplicationSentStep;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () =>
                      context.router.popUntilRouteWithName(BaseSecondRoute.name),
                ),
              ),
              const Gap(24),
              Image.asset(
                Assets.images.png.timeLeft1.path,
                width: 81,
                height: 81,
              ),
              const Gap(24),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(8),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const Gap(32),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            problem.title ?? l10n.cityDriveDefaultMarkTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            problem.address ?? '—',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.status,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(20),
                    _TimelineStep(
                      active: true,
                      icon: Icons.check,
                      color: AppColors.mainColor,
                      title: firstStepTitle,
                      subtitle: l10n.cityDriveNow,
                    ),
                    const Gap(20),
                    _TimelineStep(
                      active: false,
                      icon: Icons.schedule,
                      color: Colors.grey,
                      title: l10n.cityDriveAdminReview,
                      subtitle: l10n.cityDriveAdminReviewSubtitle,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      context.router.popUntilRouteWithName(BaseSecondRoute.name),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    l10n.cityDriveViewInMyWorks,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineStep extends StatelessWidget {
  const _TimelineStep({
    required this.active,
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  final bool active;
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: active ? color : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: active ? Colors.white : Colors.grey.shade600,
            size: 20,
          ),
        ),
        const Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(2),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
