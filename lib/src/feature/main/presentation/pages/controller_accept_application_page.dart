import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:city_drive/src/feature/controller/bloc/controller_dashboard_cubit.dart';
import 'package:city_drive/src/feature/controller/data/controller_remote_ds.dart';
import 'package:city_drive/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/main/presentation/pages/mark_application_success_page.dart';
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
  bool _isLoading = true;
  RoadProblemDTO? _problem;
  String? _loadError;

  @override
  void initState() {
    super.initState();
    _problem = widget.problem;
    WidgetsBinding.instance.addPostFrameCallback((_) => _refreshMark());
  }

  Future<void> _refreshMark() async {
    try {
      final fresh = await context.repository.controllerRepository.getMark(
        widget.problem.id,
      );
      if (!mounted) return;
      setState(() {
        _problem = fresh;
        _isLoading = false;
        _loadError = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _loadError = controllerApiErrorMessage(e);
      });
    }
  }

  bool get _canAccept {
    final p = _problem;
    if (p == null) return false;
    return p.status == ReportStatus.pending && p.assignedControllerId == null;
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _accept() async {
    if (_isSubmitting || !_canAccept) return;
    setState(() => _isSubmitting = true);

    final controllerId = context.repository.authRepository.user?.id;
    final comment = _commentController.text.trim();
    final markId = _problem!.id;
    try {
      final fresh = await context.repository.controllerRepository.getMark(markId);
      if (!mounted) return;
      if (fresh.status != ReportStatus.pending ||
          fresh.assignedControllerId != null) {
        setState(() {
          _isSubmitting = false;
          _problem = fresh;
        });
        Toaster.showErrorTopShortToast(
          context,
          'Заявка уже недоступна для принятия',
        );
        return;
      }

      final updated =
          await context.repository.controllerRepository.updateMarkStatus(
        id: markId,
        status: ReportStatus.confirmed,
        assignedControllerId: controllerId,
        comment: comment.isEmpty ? null : comment,
      );

      if (!mounted) return;
      setState(() => _isSubmitting = false);
      await context.read<ControllerDashboardCubit>().load();

      if (!mounted) return;
      context.router.push(
        MarkApplicationSuccessRoute(
          problem: updated,
          kind: MarkApplicationSuccessKind.accepted,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      final code = controllerApiStatusCode(e);
      Toaster.showErrorTopShortToast(
        context,
        controllerActionErrorMessage(e),
      );
      if (code == 409) {
        await context.read<ControllerDashboardCubit>().load();
        if (mounted) context.router.maybePop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;
    final p = _problem ?? widget.problem;
    final summary =
        '${p.title ?? l10n.cityDriveRoadDamage}\n${p.address ?? ''}';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            if (_isLoading)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (_loadError != null)
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      _loadError!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Container(
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
                          constraints: const BoxConstraints(
                            minHeight: 100,
                            maxHeight: 160,
                          ),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            controller: _commentController,
                            maxLines: null,
                            minLines: 4,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: l10n.cityDriveCommentHint,
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const Gap(24),
                        if (!_canAccept)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF3E0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              p.status == ReportStatus.confirmed
                                  ? 'Заявка уже принята'
                                  : 'Заявка недоступна для принятия',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFFE65100),
                              ),
                            ),
                          ),
                        if (!_canAccept) const Gap(16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:
                                (_isSubmitting || !_canAccept) ? null : _accept,
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
