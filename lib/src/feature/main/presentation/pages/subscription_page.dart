import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/auth/bloc/subscription_cubit.dart';

@RoutePage()
class SubscriptionPage extends StatefulWidget implements AutoRouteWrapper {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SubscriptionCubit(repository: context.repository.authRepository),
      child: this,
    );
  }
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int selectedIndex = -1;

  bool hasSubsciption = true;

  @override
  void initState() {
    BlocProvider.of<SubscriptionCubit>(context).getSubscriptions();
    super.initState();
  }

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
      body: BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const CustomLoadingOverlayWidget(),
            loaded: (subsDTO) {
              return Stack(
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
                      height: MediaQuery.of(context).size.height * 0.46,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(16),
                            const Center(
                              child: Text(
                                "IKIDZ Абонементы",
                                style: AppTextStyles.title22BoldW700,
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: ListView.separated(
                                // physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: subsDTO.length,
                                separatorBuilder: (_, __) => const Gap(10),
                                itemBuilder: (context, index) {
                                  final sub = subsDTO[index];
                                  final isSelected = selectedIndex == index;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                        
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: isSelected
                                                ? AppColors.muteBlue12
                                                : AppColors.tertiary,
                                            border: Border.all(
                                              color: isSelected
                                                  ? AppColors.mainColor
                                                  : Colors.transparent,
                                            ),
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
                                                    "${sub.title}",
                                                    style: AppTextStyles
                                                        .fs18w600
                                                        .copyWith(
                                                            color: AppColors
                                                                .black000100),
                                                  ),
                                                  const Gap(4),
                                                  if (sub.discountPercent !=
                                                      null) ...[
                                                    if (sub.discountPercent! >
                                                        0)
                                                      RichText(
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                            text:
                                                                '${sub.discountedPrice} ₸/ ',
                                                            style: AppTextStyles
                                                                .body14w500
                                                                .copyWith(
                                                              color: AppColors
                                                                  .grey646464,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                              text:
                                                                  'скидка ${sub.discountPercent} %',
                                                              style: AppTextStyles
                                                                  .body14w400
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .blue007AFF)),
                                                        ]),
                                                      ),
                                                  ],
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "${sub.price} ₸",
                                                    style: AppTextStyles
                                                        .title18w500
                                                        .copyWith(
                                                      color:
                                                          AppColors.black000100,
                                                    ),
                                                  ),
                                                  const Gap(4),
                                                  if (sub.discountPercent !=
                                                      null) ...[
                                                    if (sub.discountPercent! >
                                                        0)
                                                      Text(
                                                        '${(sub.price ?? 0) - (sub.discountedPrice ?? 0)} ₸',
                                                        style: AppTextStyles
                                                            .body14w400
                                                            .copyWith(
                                                          color: AppColors
                                                              .grey646464,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          decorationColor:
                                                              AppColors
                                                                  .grey646464,
                                                        ),
                                                      ),
                                                  ],
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 40, left: 16, right: 16, top: 10),
        child: CustomButton(
          onPressed: selectedIndex != -1
              ? () {
                  hasSubsciption
                      ? context.router.push(const PaymentMethodsRoute())
                      : context.router.push(const AddCardRoute());
                }
              : null,
          style: null,
          child: const Text(
            'Оформить подписку',
            style: AppTextStyles.title18MediumW600,
          ),
        ),
      ),
    );
  }
}
