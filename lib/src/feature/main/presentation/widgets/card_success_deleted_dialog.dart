import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ikidz/src/core/theme/resources.dart';

class CardSuccessDeletedDialog extends StatefulWidget {
  const CardSuccessDeletedDialog({super.key});

  static Future<void> show(BuildContext context, {String? underText}) async {
    await showDialog(
      context: context,
      builder: (_) => const CardSuccessDeletedDialog(),
    );
  }

  @override
  State<CardSuccessDeletedDialog> createState() =>
      _CardSuccessDeletedDialogState();
}

class _CardSuccessDeletedDialogState extends State<CardSuccessDeletedDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      // contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),

      title: Center(
        child: Text(
          'Карта успешно удалена',
          style: AppTextStyles.body17w600.copyWith(
            color: AppColors.black000000,
          ),
        ),
      ),

      actionsPadding: const EdgeInsets.only(top: 1),
      actions: [
        const Divider(height: 0.05, thickness: 1, color: AppColors.greyText),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            context.router.maybePop();
          },
          child: const Center(
            child: Text(
              'Ок',
              style: TextStyle(
                color: AppColors.black000000,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
