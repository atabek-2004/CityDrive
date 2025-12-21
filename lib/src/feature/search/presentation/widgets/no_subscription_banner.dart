import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_material_button.dart';
import 'package:ikidz/src/core/theme/resources.dart';

class NoSubscriptionBanner extends StatelessWidget {
  final OverlayEntry entry;

  const NoSubscriptionBanner({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.text262626,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => entry.remove(), 
            child: SvgPicture.asset(
              Assets.icons.closeWithConteyner.path,
              width: 46,
              height: 46,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'У вас нет подписки',
                  style: AppTextStyles.title16W600.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  'Оформите подписку, чтобы открыть доступ ко всем занятиям и материалам',
                  style: AppTextStyles.body13w400
                      .copyWith(color: AppColors.greyC8C5C5),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 38,
                    width: 148,
                    child: CustomMaterialButton(
                      onTap: () {},
                      materialColor: const Color(0xFFF2F2F7),
                      child: Center(
                        child: Text(
                          'Купить подписку',
                          style: AppTextStyles.body14w400
                              .copyWith(color: AppColors.black000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
