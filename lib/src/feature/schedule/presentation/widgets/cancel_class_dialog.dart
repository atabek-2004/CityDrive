import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/theme/resources.dart';


class CancelClassDialog extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onConfirm;
  final String confirmText;
  final bool showDivider;

  const CancelClassDialog({
    super.key,
    required this.title,
    this.subtitle,
    this.onConfirm,
    this.confirmText = 'Ок',
    this.showDivider = true,
  });

  static Future<void> show(
    BuildContext context, {
    required String title,
    String? subtitle,
    VoidCallback? onConfirm,
    String confirmText = 'Ок',
  }) {
    return showDialog(
      context: context,
      builder: (_) => CancelClassDialog(
        title: title,
        subtitle: subtitle,
        onConfirm: onConfirm,
        confirmText: confirmText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      actionsPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.title17W600.copyWith(
              color: AppColors.black000000,
            ),
          ),
          if (subtitle != null) ...[
            const Gap(5),
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: AppTextStyles.sz13w400.copyWith(
                color: AppColors.black000000,
              ),
            ),
          ],
          const Gap(20),
        ],
      ),
      actions: [
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.greyText,
          ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onConfirm?.call();
          },
          child: Center(
            child: Text(
              confirmText,
              style: const TextStyle(
                color: Color(0xFF1890FF),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
