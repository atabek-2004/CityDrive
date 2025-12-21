import 'package:flutter/material.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/main/presentation/widgets/chid_added_dialog.dart';

class LessThreeYearsDialog extends StatefulWidget {
  const LessThreeYearsDialog({super.key});

  static Future<void> show(BuildContext context, {String? underText}) async {
    await showDialog(
      context: context,
      builder: (_) => const LessThreeYearsDialog(),
    );
  }

  @override
  State<LessThreeYearsDialog> createState() => _LessThreeYearsDialogState();
}

class _LessThreeYearsDialogState extends State<LessThreeYearsDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      // contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      
      title: Center(
        child: Text(
          'Внимание!',
          style: AppTextStyles.body17w600.copyWith(
            color: AppColors.black000000,
          ),
        ),
      ),
      
      content: Text(
        'Если ребенку меньше 3 лет, перед началом  занятия родитель (законный представитель) обязан предоставить свидетельство о рождении',
        textAlign: TextAlign.center,
        style: AppTextStyles.body13w400.copyWith(
          color: AppColors.black000000,
        ),
      ),
      actionsPadding: const EdgeInsets.only(top: 1),
      actions: [
        const Divider(height: 0.05, thickness: 1, color: AppColors.greyText),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            ChildAddedDialog.show(context);
          },
          child: const Center(
            child: Text(
              'ОК',
              style: TextStyle(
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
