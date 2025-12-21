import 'package:flutter/material.dart';
import 'package:ikidz/src/core/theme/resources.dart';

class RegisterIsNotAvailableDialog extends StatefulWidget {
  const RegisterIsNotAvailableDialog({super.key});

  static Future<void> show(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => const RegisterIsNotAvailableDialog(),
    );
  }

  @override
  State<RegisterIsNotAvailableDialog> createState() =>
      _RegisterIsNotAvailableDialogState();
}

class _RegisterIsNotAvailableDialogState
    extends State<RegisterIsNotAvailableDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text(
          'Регистрация недоступна\nРегистрация доступна только пользователям старше 18 лет.',
          textAlign: TextAlign.center,
          style: AppTextStyles.body17w600.copyWith(color: AppColors.black000000),
        ),
      ),
      actionsPadding: EdgeInsets.zero,
      actions: [
        const Divider(height: 1, thickness: 1, color: AppColors.greyText),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
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
