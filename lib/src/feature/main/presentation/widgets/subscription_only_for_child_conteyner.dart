import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/theme/resources.dart';

class SubscriptionOnlyForChildConteyner extends StatefulWidget {
  const SubscriptionOnlyForChildConteyner({super.key});

  @override
  State<SubscriptionOnlyForChildConteyner> createState() =>
      _SubscriptionOnlyForChildConteynerState();
}

class _SubscriptionOnlyForChildConteynerState
    extends State<SubscriptionOnlyForChildConteyner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.colorFFF7E6,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            Assets.icons.info.path,
            height: 24,
            width: 24,
          ),
          const Gap(8),
          Expanded(
            child: Text(
              'Абонемент является именным и может использоваться только одним ребёнком. Передача абонемента другому лицу или использование его несколькими детьми не допускается.',
              style: AppTextStyles.body14w400.copyWith(
                color: const Color(0xD9000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
