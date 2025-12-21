import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';

class HallContaynerWidget extends StatefulWidget {
  final CentersDTO center;
  final Color color;
  final void Function()? onTap;
  const HallContaynerWidget({
    super.key,
    required this.color,
    required this.onTap,
    required this.center,
  });

  @override
  State<HallContaynerWidget> createState() => _HallContaynerWidgetState();
}

class _HallContaynerWidgetState extends State<HallContaynerWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 20, top: 15, bottom: 20, right: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: widget.color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(98),
                  Text(
                    widget.center.name ?? '',
                    style: AppTextStyles.title24Bold
                        .copyWith(color: AppColors.white),
                  ),
                  const Gap(8),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, top: 5, bottom: 5, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.color0x1C313234,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.icons.location.path),
                        const Gap(7),
                        Text(widget.center.address ?? '',
                            style: AppTextStyles.body12W500White
                                .copyWith(color: AppColors.white)),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(15),
              widget.center.banner != null
                  ? Expanded(
                      child: Image.network(
                      widget.center.banner!,
                      width: 146,
                      height: 130,
                    ))
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: widget.onTap,
            ),
          ),
        ),
      ],
    );
  }
}
