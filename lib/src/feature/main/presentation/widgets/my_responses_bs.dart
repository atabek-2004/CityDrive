import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';

class MyResponsesBS extends StatefulWidget {
  const MyResponsesBS({super.key});

  @override
  State<MyResponsesBS> createState() => _MyResponsesBSState();

  /// Возвращает код статуса или `null` для «Все».
  static Future<String?> show(BuildContext context) => showModalBottomSheet<String>(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => const MyResponsesBS(),
      );
}

class _FilterOption {
  const _FilterOption({required this.status, required this.label});

  final String? status;
  final String label;
}

class _MyResponsesBSState extends State<MyResponsesBS> {
  String? selectedStatus;

  List<_FilterOption> _options(BuildContext context) {
    final l10n = context.localized;
    return [
      _FilterOption(status: null, label: l10n.cityDriveFilterAll),
      _FilterOption(
        status: ReportStatus.pending,
        label: l10n.cityDriveUnderReview,
      ),
      _FilterOption(
        status: ReportStatus.confirmed,
        label: l10n.cityDriveFilterConfirmed,
      ),
      _FilterOption(
        status: ReportStatus.rejected,
        label: l10n.cityDriveFilterRejected,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;
    final options = _options(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.cityDriveMarks,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            const Gap(20),
            ...options.map(
              (option) => FilterOption(
                title: option.label,
                isSelected: selectedStatus == option.status,
                onTap: () => setState(() => selectedStatus = option.status),
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context, selectedStatus),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A9EFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    l10n.cityDriveDone,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  const FilterOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: Color(0xFF4A9EFF)),
          ],
        ),
      ),
    );
  }
}
