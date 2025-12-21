import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/theme/resources.dart';

class PaymentCotainer extends StatefulWidget {
  final String text;
  final String number;
  final String pngPath;
  final bool showDeleteButton;
  final void Function()? onTap;
  const PaymentCotainer({
    super.key,
    required this.text,
    required this.number,
    required this.pngPath,
    this.showDeleteButton = false,
    this.onTap,
  });

  @override
  State<PaymentCotainer> createState() => _PaymentCotainerState();
}

class _PaymentCotainerState extends State<PaymentCotainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.tertiary,
        // border: Border.all(
        //   color: isSelected ? AppColors.mainColor : Colors.transparent,
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(widget.pngPath, width: 40, height: 24),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text,
                        style: AppTextStyles.body14w400.copyWith(
                          color: AppColors.text444040,
                        ),
                      ),
                      const Gap(2),
                      Text(
                        widget.number,
                        style: AppTextStyles.body14w400.copyWith(
                          color: AppColors.text444040,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (widget.showDeleteButton) ...[
                GestureDetector(
                  onTap: widget.onTap,
                  child: SvgPicture.asset(
                    Assets.icons.delete.path,
                  ),
                ),
              ] else ...[
                const SizedBox.shrink(),
              ]
            ],
          ),
        ],
      ),
    );
  }
}
