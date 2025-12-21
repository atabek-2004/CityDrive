import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/profile/presentation/widgets/freeze_subscription_dialog.dart';

@RoutePage()
class FreezeSubscriptionPage extends StatefulWidget {
  const FreezeSubscriptionPage({super.key});

  @override
  State<FreezeSubscriptionPage> createState() => _FreezeSubscriptionPageState();
}

class _FreezeSubscriptionPageState extends State<FreezeSubscriptionPage> {
  int selectedIndex = -1;

  bool canFreeze = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: TextButton.icon(
          onPressed: () {
            context.router.maybePop();
          },
          label: SvgPicture.asset(
            Assets.icons.backArrow.path,
            color: AppColors.white,
            height: 25,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            Assets.images.png.subscriptionBackg.path,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.42,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(16),
                              const Center(
                                child: Text(
                                  "IKIDZ Абонемент",
                                  style: AppTextStyles.title22BoldW700,
                                ),
                              ),
                              const Gap(10),
                              Container(
                                height: 80,
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.muteBlue12,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "1 мес",
                                          style: AppTextStyles.fs18w600
                                              .copyWith(
                                                  color: AppColors.black000100),
                                        ),
                                        const Gap(4),
                                        Text(
                                          'Действует до: 01.11.2025',
                                          style:
                                              AppTextStyles.body14W500.copyWith(
                                            color: AppColors.grey646464,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "11,042 ₸ ₸",
                                          style: AppTextStyles.title18w500
                                              .copyWith(
                                            color: AppColors.black000100,
                                          ),
                                        ),
                                        const Gap(4),
                                        Text(
                                          '3000 ₸',
                                          style:
                                              AppTextStyles.body14w400.copyWith(
                                            color: AppColors.grey646464,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor:
                                                AppColors.grey646464,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(10),
                              Container(
                                height: 80,
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.backgroundButtonF5F5F5,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Камилла Абдрахманова',
                                          style:
                                              AppTextStyles.body16w600.copyWith(
                                            color: AppColors.black141414,
                                          ),
                                        ),
                                        Text(
                                          '13 лет ',
                                          style:
                                              AppTextStyles.body14w400.copyWith(
                                            color: AppColors.text595959,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(7),
                              Container(
                                height: 45,
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.colorFFF7E6,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Assets.icons.info.path,
                                      height: 30,
                                      width: 30,
                                    ),
                                    const Gap(4),
                                    Text(
                                      canFreeze
                                          ? 'Вы сможете заморозить 7 дней'
                                          : 'Заморозка невозможна',
                                      style: AppTextStyles.body14w400.copyWith(
                                        color: const Color(0xD9000000),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Gap(16),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 40, left: 16, right: 16, top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              onPressed: canFreeze
                  ? () {
                      FreezeSubscriptionDialog.show(context);
                    }
                  : null,
              style: canFreeze
                  ? null
                  : const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          AppColors.backgroundButtonF5F5F5)),
              child: const Text(
                'Заморозить',
                style: AppTextStyles.title18MediumW600,
              ),
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            const Gap(12),
          ],
        ),
      ),
    );
  }
}
