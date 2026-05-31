import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/main/presentation/pages/mark_application_success_page.dart';
import 'package:city_drive/src/feature/search/bloc/road_problems_provider.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

@RoutePage()
class ControllerAcceptApplicationPage extends StatefulWidget {
  const ControllerAcceptApplicationPage({
    super.key,
    required this.problem,
  });

  final RoadProblemDTO problem;

  @override
  State<ControllerAcceptApplicationPage> createState() =>
      _ControllerAcceptApplicationPageState();
}

class _ControllerAcceptApplicationPageState
    extends State<ControllerAcceptApplicationPage> {
  final TextEditingController _commentController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _accept() async {
    if (_isSubmitting) return;
    setState(() => _isSubmitting = true);

    final controllerId = context.repository.authRepository.user?.id;
    await context.read<RoadProblemsProvider>().updateStatus(
          id: widget.problem.id,
          status: ReportStatus.confirmed,
          assignedControllerId: controllerId,
        );

    if (!mounted) return;
    setState(() => _isSubmitting = false);

    context.router.push(
      MarkApplicationSuccessRoute(
        problem: widget.problem,
        kind: MarkApplicationSuccessKind.accepted,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;
    final p = widget.problem;
    final summary =
        '${p.title ?? l10n.cityDriveRoadDamage}\n${p.address ?? ''}';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () => context.router.maybePop(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.cityDriveAnnouncement,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const Gap(16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      summary,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                    ),
                  ),
                  const Gap(24),
                  Text(
                    l10n.cityDriveCommentOptional,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const Gap(12),
                  Container(
                    height: 120,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _commentController,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: l10n.cityDriveCommentHint,
                        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ),
                  const Gap(24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isSubmitting ? null : _accept,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainColor,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: _isSubmitting
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              l10n.cityDriveAcceptApplicationBtn,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
