import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:ikidz/src/core/theme/resources.dart';

class FreezeSubscriptionDialog extends StatefulWidget {
  const FreezeSubscriptionDialog({super.key});

  static Future<void> show(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => const FreezeSubscriptionDialog(),
    );
  }

  @override
  State<FreezeSubscriptionDialog> createState() =>
      _FreezeSubscriptionDialogState();
}

class _FreezeSubscriptionDialogState extends State<FreezeSubscriptionDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(
        'Заморозить подписку?',
        textAlign: TextAlign.center,
        style: AppTextStyles.body18w600.copyWith(
          color: AppColors.black000000,
        ),
      ),
      content: Text(
        'Вы уверены, что хотите заморозить абонемент?',
        textAlign: TextAlign.center,
        style: AppTextStyles.body13w400.copyWith(
          color: AppColors.black000000,
        ),
      ),
      actionsPadding: EdgeInsets.zero,
      actions: [
        const Divider(height: 0.05, thickness: 1, color: AppColors.greyText),
        SizedBox(
          height: 48,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Center(
                    child: Text('Нет',
                        style: AppTextStyles.body17w400
                            .copyWith(color: AppColors.redCF1322)),
                  ),
                ),
              ),
              Container(
                  width: 1, height: double.infinity, color: AppColors.greyText),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Toaster.showTopShortToast(
                      context,
                      message: '',
                      color: const Color(0xFFF6FFED),
                      body: Row(
                        children: [
                          SvgPicture.asset(Assets.icons.toasterDone.path, width: 24, height: 24,),
                          const Gap(10),
                          const Text(
                            'Подписка успешно заморожена',
                            style: AppTextStyles.body14w400,
                          ),
                        ],
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Да',
                      style: AppTextStyles.body17w600.copyWith(
                        color: AppColors.blue007AFF,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
