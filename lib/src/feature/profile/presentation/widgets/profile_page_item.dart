import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';

import 'package:ikidz/src/core/theme/resources.dart';

class ProfileMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final VoidCallback onTap;
  final Widget? trailing;
  final bool showDivider;
  final bool isInContainer;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
    this.trailing,
    this.showDivider = true,
    this.isInContainer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            onTap: onTap,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            leading: SvgPicture.asset(icon, width: 32, height: 32),
            title: Text(
              title,
              style: AppTextStyles.body16w400.copyWith(
                color: AppColors.blac0F1721,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                trailing ?? const SizedBox.shrink(),
                const Gap(18),
                SvgPicture.asset(
                  Assets.icons.arrowIos.path,
                  color: AppColors.grey6F747A,
                ),
              ],
            )),
        if (showDivider && !isInContainer)
          const Padding(
            padding: EdgeInsets.only(left: 60),
            child: Divider(
              height: 1,
              color: Color(0xFFEEEEEB),
            ),
          ),
      ],
    );
  }
}
