import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/main/presentation/widgets/subscription_only_for_child_conteyner.dart';

@RoutePage()
class MyChildrenPage extends StatefulWidget {
  const MyChildrenPage({super.key});

  @override
  State<MyChildrenPage> createState() => _MyChildrenPageState();
}

class _MyChildrenPageState extends State<MyChildrenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'Мои дети',
          style: AppTextStyles.title20BoldW600.copyWith(
            color: AppColors.tabActive,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: ListView(
          children: [
            Expanded(
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
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
                                      style: AppTextStyles.body16Regular500
                                          .copyWith(
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
                                          style: AppTextStyles.body12W500Green
                                              .copyWith(
                                            color: AppColors.green389E0D,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Gap(16),
                        ],
                      );
                    },
                  ),
                  const SubscriptionOnlyForChildConteyner(),
                ],
              ),
            ),
          ],
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
          text: 'Готово',
          child: null,
        ),
      ),
    );
  }
}
