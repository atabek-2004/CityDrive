import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:city_drive/src/core/constant/localization/translations/app_localizations.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/core/local_storage/report_status_ui.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/search/bloc/road_problems_provider.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';
import 'package:city_drive/src/feature/search/presentation/utils/road_problem_labels.dart';

enum _WorksMainFilter { applications, inWork, canceled }

enum _WorksSubFilter { inProgress, completed }

class MyWorksPage extends StatefulWidget {
  const MyWorksPage({super.key});

  @override
  State<MyWorksPage> createState() => _MyWorksPageState();
}

class _MyWorksPageState extends State<MyWorksPage> {
  _WorksMainFilter _selectedMainFilter = _WorksMainFilter.applications;
  _WorksSubFilter _selectedSubFilter = _WorksSubFilter.inProgress;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<RoadProblemsProvider>().load();
      }
    });
  }

  List<RoadProblemDTO> _filteredItems(
    RoadProblemsProvider provider,
    int controllerId,
  ) {
    switch (_selectedMainFilter) {
      case _WorksMainFilter.applications:
        return provider.pendingForController();
      case _WorksMainFilter.canceled:
        return provider.problems
            .where((p) => p.status == ReportStatus.rejected)
            .toList();
      case _WorksMainFilter.inWork:
        if (_selectedSubFilter == _WorksSubFilter.completed) {
          return provider.problems
              .where(
                (p) =>
                    p.assignedControllerId == controllerId &&
                    p.status == ReportStatus.fixed,
              )
              .toList();
        }
        return provider.problems
            .where(
              (p) =>
                  p.assignedControllerId == controllerId &&
                  (p.status == ReportStatus.inProgress ||
                      p.status == ReportStatus.confirmed),
            )
            .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;
    final controllerId = context.repository.authRepository.user?.id ?? 0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      _FilterChip(
                        label: l10n.cityDriveApplications,
                        isSelected:
                            _selectedMainFilter == _WorksMainFilter.applications,
                        onTap: () => setState(
                          () => _selectedMainFilter = _WorksMainFilter.applications,
                        ),
                      ),
                      const Gap(8),
                      _FilterChip(
                        label: l10n.cityDriveInProgress,
                        isSelected:
                            _selectedMainFilter == _WorksMainFilter.inWork,
                        onTap: () => setState(() {
                          _selectedMainFilter = _WorksMainFilter.inWork;
                          _selectedSubFilter = _WorksSubFilter.inProgress;
                        }),
                      ),
                      const Gap(8),
                      _FilterChip(
                        label: l10n.cityDriveCanceled,
                        isSelected:
                            _selectedMainFilter == _WorksMainFilter.canceled,
                        onTap: () => setState(
                          () => _selectedMainFilter = _WorksMainFilter.canceled,
                        ),
                      ),
                    ],
                  ),
                  if (_selectedMainFilter == _WorksMainFilter.inWork) ...[
                    const Gap(12),
                    Row(
                      children: [
                        _FilterChip(
                          label: l10n.cityDriveInProcess,
                          isSelected:
                              _selectedSubFilter == _WorksSubFilter.inProgress,
                          color: const Color(0xFF4CD964),
                          onTap: () => setState(
                            () => _selectedSubFilter = _WorksSubFilter.inProgress,
                          ),
                        ),
                        const Gap(8),
                        _FilterChip(
                          label: l10n.cityDriveCompleted,
                          isSelected:
                              _selectedSubFilter == _WorksSubFilter.completed,
                          color: Colors.grey,
                          onTap: () => setState(
                            () => _selectedSubFilter = _WorksSubFilter.completed,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            Expanded(
              child: Consumer<RoadProblemsProvider>(
                builder: (context, provider, _) {
                  final items = _filteredItems(provider, controllerId);

                  if (items.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          _emptyMessage(l10n),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.grey, height: 1.4),
                        ),
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async => provider.load(),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const Gap(16),
                      itemBuilder: (context, index) {
                        return _WorkCard(problem: items[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _emptyMessage(AppLocalizations l10n) {
    switch (_selectedMainFilter) {
      case _WorksMainFilter.applications:
        return l10n.cityDriveEmptyApplications;
      case _WorksMainFilter.canceled:
        return l10n.cityDriveEmptyCanceled;
      case _WorksMainFilter.inWork:
        return _selectedSubFilter == _WorksSubFilter.completed
            ? l10n.cityDriveEmptyCompleted
            : l10n.cityDriveEmptyInWork;
    }
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.color,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? (color ?? AppColors.mainColor)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _WorkCard extends StatelessWidget {
  const _WorkCard({required this.problem});

  final RoadProblemDTO problem;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;
    final statusUi = ReportStatusUi.fromStatus(l10n, problem.status);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  problem.title ?? l10n.cityDriveRoadDamage,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: severityColor(problem.severity).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  severityLabel(l10n, problem.severity),
                  style: TextStyle(
                    color: severityColor(problem.severity),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const Gap(12),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
              const Gap(4),
              Expanded(
                child: Text(
                  problem.address ?? l10n.cityDriveAddressNotSpecified,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          const Gap(8),
          Row(
            children: [
              Icon(statusUi.icon, size: 18, color: statusUi.color),
              const Gap(4),
              Text(
                statusUi.label,
                style: TextStyle(color: statusUi.color),
              ),
            ],
          ),
          if (problem.reportedDate != null) ...[
            const Gap(8),
            Text(
              formatReportDate(l10n, problem.reportedDate),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
          const Gap(16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.router.push(RoadProblemDetailRoute(problem: problem));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                l10n.cityDriveMoreDetails,
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
    );
  }
}
