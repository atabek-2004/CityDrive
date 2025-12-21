import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_material_button.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/search/presentation/widgets/no_subscription_banner.dart';

@RoutePage()
class ConfirmEntryPage extends StatefulWidget {
  const ConfirmEntryPage({super.key});

  @override
  State<ConfirmEntryPage> createState() => _ConfirmEntryPageState();
}

class _ConfirmEntryPageState extends State<ConfirmEntryPage> {
  int? selectedChildIndex;
  bool? hasSubscription;

  final List<String> genders = ['Камилла Абдрахманова', 'Амир Абдрахманов'];

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
          'Подтвердить запись',
          style: AppTextStyles.title20BoldW600
              .copyWith(color: AppColors.tabActive),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  // Контент

                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          conteyner(
                            title: 'Верховая езда ',
                            subTitle: 'Категория: Спорт',
                          ),
                          const Gap(16),
                          conteyner(
                            title: 'Дата и время',
                            subTitle: '1 Окт 2025, 12:00-13:00',
                          ),
                          const Gap(16),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.conteinerFAFAFA,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Зал',
                                  style: AppTextStyles.body16w500
                                      .copyWith(color: AppColors.tabActive),
                                ),
                                const Gap(4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Happy Choice',
                                              style: AppTextStyles.body14w400
                                                  .copyWith(
                                                color: AppColors.black141414,
                                              ),
                                            ),
                                            const Gap(4),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Assets.icons.location.path,
                                                  color:
                                                      const Color(0xFF1890FF),
                                                ),
                                                const Gap(5),
                                                Text(
                                                  'Проспект Сейфуллина 45',
                                                  style: AppTextStyles
                                                      .body12W500
                                                      .copyWith(
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
                                        Assets.icons.arrowIos.path),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Gap(16),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.conteinerFAFAFA,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Выберите ребенка',
                                  style: AppTextStyles.body16w500
                                      .copyWith(color: AppColors.tabActive),
                                ),
                                const Gap(11),
                                ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const Gap(17),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    final gender = genders[index];
                                    final isSelected =
                                        selectedChildIndex == index;
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedChildIndex = index;
                                        });
                                      },
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      gender,
                                                      style: AppTextStyles
                                                          .body14w400
                                                          .copyWith(
                                                        color: AppColors
                                                            .black141414,
                                                      ),
                                                    ),
                                                    const Gap(4),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '16 лет',
                                                          style: AppTextStyles
                                                              .body12W400
                                                              .copyWith(
                                                            color: AppColors
                                                                .text595959,
                                                          ),
                                                        ),
                                                        const Gap(10),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            right: 6,
                                                            left: 6,
                                                            top: 4,
                                                            bottom: 4,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xFFDBF4D2),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: RichText(
                                                            text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        'Подписка активна: ',
                                                                    style: AppTextStyles
                                                                        .body12W500
                                                                        .copyWith(
                                                                      color:
                                                                          const Color(
                                                                        0xFF254000,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        '1 мес',
                                                                    style: AppTextStyles
                                                                        .body12W700
                                                                        .copyWith(
                                                                      color:
                                                                          const Color(
                                                                        0xFF254000,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SvgPicture.asset(
                                              isSelected
                                                  ? Assets
                                                      .icons.genderSelected.path
                                                  : Assets.icons
                                                      .genferNotSeleceted.path,
                                              height: 20,
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Gap(8),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: CustomMaterialButton(
                              onTap: () {
                                context.router.push(AddChildSearchRoute());
                              },
                              materialColor: AppColors.muteBlue12,
                              child: Row(
                                children: [
                                  const Gap(12),
                                  Image.asset(
                                    Assets.images.png.addCard.path,
                                    width: 26,
                                    height: 26,
                                  ),
                                  const Gap(12),
                                  Text(
                                    'Добавить ребенка',
                                    style: AppTextStyles.body14w400.copyWith(
                                      color: AppColors.tabActive,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(12),
                  CustomButton(
                    // allowTapButton: _allowTapButton,
                    onPressed: () {
                      // context.router.push(const ConfirmEntryRoute());
                      hasSubscription = true;
                      showTopBanner(context);
                      setState(() {});
                    },
                    style: CustomButtonStyles.mainButtonStyle(context).copyWith(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.mainColor),
                      foregroundColor: WidgetStatePropertyAll(AppColors.white),
                    ),
                    text: 'Подтвердить',
                    child: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showTopBanner(BuildContext context) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          left: 0,
          right: 0,
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: NoSubscriptionBanner(entry: entry),
            ),
          ),
        );
      },
    );

    overlay.insert(entry);

    Future.delayed(const Duration(seconds: 3), () => entry.remove());
  }

  Widget conteyner({required String title, required String subTitle}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.conteinerFAFAFA,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.title16W500.copyWith(
              color: AppColors.tabActive,
            ),
          ),
          const Gap(2),
          Text(
            subTitle,
            style: AppTextStyles.body14w400.copyWith(
              color: AppColors.text595959,
            ),
          ),
        ],
      ),
    );
  }
}
