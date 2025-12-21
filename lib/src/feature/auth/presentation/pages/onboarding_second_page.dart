import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/auth/bloc/subscription_cubit.dart';

@RoutePage()
class OnboardingSeondPage extends StatefulWidget implements AutoRouteWrapper {
  const OnboardingSeondPage({super.key});

  @override
  State<OnboardingSeondPage> createState() => _OnboardingSeondPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SubscriptionCubit(repository: context.repository.authRepository),
      child: this,
    );
  }
}

class _OnboardingSeondPageState extends State<OnboardingSeondPage> {
  @override
  void initState() {
    BlocProvider.of<SubscriptionCubit>(context).getSubscriptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return BlocBuilder<SubscriptionCubit, SubscriptionState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const CustomLoadingOverlayWidget(),
                    loaded: (subsDTO) {
                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Column(
                            children: [
                              const Gap(18),
                              SizedBox(
                                width: double.infinity,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      child: Image.asset(
                                        Assets.images.png.authBackgSecond.path,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -30,
                                      child: Image.asset(
                                        Assets.images.png.authStack.path,
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(40),
                              Text(
                                'IKIDZ Абонементы ',
                                style: AppTextStyles.title20BoldW600.copyWith(
                                  color: AppColors.muteBlue1890FF,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const Gap(16),
                              // containerSubscription('1 мес', '10 000 ₸'),
                              // const Gap(8),
                              // containerSubscription('6 мес', '20 000 ₸'),
                              // const Gap(8),
                              // containerSubscription('9 мес', '50 000 ₸'),
                              // const Gap(8),
                              // containerSubscription('12 мес', '100 000 ₸'),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const Gap(12),
                                itemCount: subsDTO.length,
                                itemBuilder: (context, index) {
                                  return containerSubscription(
                                      subsDTO[index].title ?? '',
                                      subsDTO[index].price.toString() ?? '');
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 45, right: 16, left: 16),
        child: CustomButton(
          onPressed: () {
            context.router.push(const SignUpFirstRoute());
          },
          style: CustomButtonStyles.mainButtonStyle(context).copyWith(
            backgroundColor: const WidgetStatePropertyAll(
              AppColors.muteButton63B,
            ),
          ),
          text: 'Далее',
          child: null,
        ),
      ),
    );
  }

  Widget containerSubscription(String text, String price) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.muteBlue12,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            Text(price, style: AppTextStyles.title16W500.copyWith(color: AppColors.black3A3A3C),),
          ],
        ),
      ),
    );
  }
}
