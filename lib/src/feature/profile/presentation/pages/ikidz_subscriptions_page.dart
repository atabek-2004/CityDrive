import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';

@RoutePage()
class IkidzSubscriptionsPage extends StatefulWidget {
  const IkidzSubscriptionsPage({super.key});

  @override
  State<IkidzSubscriptionsPage> createState() => _IkidzSubscriptionsPageState();
}

class _IkidzSubscriptionsPageState extends State<IkidzSubscriptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.only(right: 16),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: TextButton.icon(
          onPressed: () {
            context.router.maybePop();
          },
          label: SvgPicture.asset(
            Assets.icons.backArrow.path,
            color: AppColors.black,
            height: 25,
          ),
        ),
        title: Text(
          'IKIDZ Абонементы',
          style: AppTextStyles.title20BoldW600.copyWith(
            color: AppColors.tabActive,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Gap(10),
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.router.push(const FreezeSubscriptionRoute());
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 16.0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.conteinerFAFAFA,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.images.png.child.path,
                          height: 50,
                          width: 50,
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Камилла Абдрахманова',
                              style: AppTextStyles.body16Regular500.copyWith(
                                color: AppColors.black141414,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              '13 лет',
                              style: AppTextStyles.body14w400.copyWith(
                                color: AppColors.text595959,
                              ),
                            ),
                            const Gap(6),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.done.path,
                                  width: 16,
                                  height: 16,
                                ),
                                const Gap(4),
                                Text(
                                  'Подписка активна: 1 мес',
                                  style: AppTextStyles.body12W500Green.copyWith(
                                    color: AppColors.green389E0D,
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
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 40.0),
        child: CustomButton(
          onPressed: () {
            // context.router.push(const MyChildrenRoute());
          },
          style: CustomButtonStyles.mainButtonStyle(context).copyWith(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            backgroundColor: const WidgetStatePropertyAll(AppColors.mainColor),
            foregroundColor: const WidgetStatePropertyAll(AppColors.white),
          ),
          child: Text(
            'Купить подписку',
            style: AppTextStyles.body18w600.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
