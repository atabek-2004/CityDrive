import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';

class ChildAddedDialog extends StatefulWidget {
  const ChildAddedDialog({super.key});

  static Future<bool?> show(BuildContext context, {String? underText}) async {
    await showDialog(
      context: context,
      builder: (_) => const ChildAddedDialog(),
    );
  }

  @override
  State<ChildAddedDialog> createState() => _ChildAddedDialogState();
}

class _ChildAddedDialogState extends State<ChildAddedDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      // contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),

      title: Center(
        child: Text(
          'Ребёнок добавлен',
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
            // Navigator.pop(context);
            context.router.push(MyChildrenProfileRoute());
          },
          child: const Center(
            child: Text(
              'Мои дети',
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
