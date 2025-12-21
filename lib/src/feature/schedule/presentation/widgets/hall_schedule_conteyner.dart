import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';

class HallScheduleConteyner extends StatefulWidget {
  const HallScheduleConteyner({super.key});

  @override
  State<HallScheduleConteyner> createState() => _HallScheduleConteynerState();
}

class _HallScheduleConteynerState extends State<HallScheduleConteyner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding:
              const EdgeInsets.only(right: 16, top: 18, bottom: 18, left: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.backgroundButtonF5F5F5,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Камилла Абдрахманова',
                style: AppTextStyles.body16w600.copyWith(
                  color: AppColors.black141414,
                ),
              ),
              const Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hip-hop',
                    style: AppTextStyles.body16w400.copyWith(
                      color: AppColors.text434343,
                    ),
                  ),
                  Text(
                    '15:00',
                    style: AppTextStyles.body16w500.copyWith(
                      color: AppColors.text434343,
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        Assets.images.png.child.path,
                        width: 40,
                        height: 40,
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dance Kids',
                            style: AppTextStyles.body14w400.copyWith(
                              color: AppColors.black141414,
                            ),
                          ),
                          const Gap(4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.icons.location.path,
                                color: AppColors.muteBlue1890FF,
                              ),
                              const Gap(4),
                              Text(
                                'Проспект Сейфуллина 45',
                                style: AppTextStyles.body12W500.copyWith(
                                  color: AppColors.text595959,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    Assets.icons.arrowIos.path,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                context.router.push(const ScheduleClassRoute());
              },
            ),
          ),
        ),
      ],
    );
  }
}
