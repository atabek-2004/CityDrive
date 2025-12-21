import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/theme/resources.dart';

class RecordedConteyner extends StatefulWidget {
  final String time;
  const RecordedConteyner({super.key, required this.time});

  @override
  State<RecordedConteyner> createState() => _RecordedConteynerState();
}

class _RecordedConteynerState extends State<RecordedConteyner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF6FFED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          row(text: 'Записан:', icon: Assets.icons.done.path, isDoneIcon: true),
          const Gap(8),
          row(
              text: 'Камилла Абдрахманова',
              icon: Assets.icons.person.path,
              iconColor: const Color(0xFFFA8C16)),
          const Gap(8),
          row(
              text: '25 Октября, 2025',
              icon: Assets.icons.scheduleActive.path,
              iconColor: AppColors.muteBlue1890FF),
          const Gap(8),
          row(
              text: widget.time,
              icon: Assets.icons.time.path,
              iconColor: AppColors.colorF759AB),
        ],
      ),
    );
  }

  Widget row(
      {required String text,
      required String icon,
      Color? iconColor,
      bool isDoneIcon = false}) {
    return Row(
      children: [
        SvgPicture.asset(
          color: iconColor,
          icon,
          width: isDoneIcon ? 18 : 16,
          height: isDoneIcon ? 18 : 16,
        ),
        const Gap(12),
        Text(
          text,
          style: isDoneIcon
              ? AppTextStyles.body18w700.copyWith(
                  color: AppColors.tabActive,
                )
              : AppTextStyles.body14w400.copyWith(
                  color: AppColors.black000000,
                ),
        ),
      ],
    );
  }
}
