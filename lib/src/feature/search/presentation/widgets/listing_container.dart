import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/constants.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/image_util.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';
import 'package:ikidz/src/feature/search/model/schedule_dto.dart';

class ListingConteynerWidget extends StatefulWidget {
  final CentersDTO? center;
  const ListingConteynerWidget({
    super.key,
    this.center,
  });

  @override
  State<ListingConteynerWidget> createState() => _ListingConteynerWidgetState();
}

class _ListingConteynerWidgetState extends State<ListingConteynerWidget> {
  String formatTime(String? time) {
    if (time == null || time.isEmpty) return '';

    final parts = time.split(':');
    if (parts.length < 2) return '';

    final hour = int.tryParse(parts[0]);
    if (hour == null) return '';

    return '${hour.toString().padLeft(2, '0')}:${parts[1]}';
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: CachedNetworkImage(
                            imageUrl:
                                widget.center?.banner ?? NO_IMAGE_AVAILABLE,
                            fit: BoxFit.cover,
                            width: 40,
                            height: 40,
                            progressIndicatorBuilder:
                                ImageUtil.cachedLoadingBuilder,
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.center?.name ?? '',
                                style: AppTextStyles.body14w400.copyWith(
                                  color: AppColors.black141414,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Gap(4),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.location.path,
                                    color: AppColors.muteBlue1890FF,
                                  ),
                                  const Gap(4),
                                  Expanded(
                                    child: Text(
                                      widget.center?.address ?? '',
                                      style: AppTextStyles.body12W500.copyWith(
                                        color: AppColors.text595959,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(8),
                  SvgPicture.asset(
                    Assets.icons.arrowIos.path,
                  ),
                ],
              ),
              const Gap(13),
              Text(
                '12:00',
                style: AppTextStyles.body16w600.copyWith(
                  color: AppColors.text434343,
                ),
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
                context.router.push(
                  HallDetailsRoute(
                    ceterId: widget.center?.id ?? 0,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
