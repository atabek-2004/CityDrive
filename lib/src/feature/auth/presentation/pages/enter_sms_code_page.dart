import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:ikidz/src/feature/app/bloc/app_bloc.dart';
import 'package:ikidz/src/feature/auth/bloc/enter_sms_code_cubit.dart';
import 'package:ikidz/src/feature/auth/bloc/register_verify_cubit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pinput/pinput.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/presentation/widgets/scroll/scroll_wrapper.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/core/utils/extensions/integer_extension.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/auth/enum/enter_sms_code_type.dart';
import 'package:ikidz/src/feature/auth/models/request/user_payload.dart';

@RoutePage()
class EnterSmsCodePage extends StatefulWidget implements AutoRouteWrapper {
  const EnterSmsCodePage({
    super.key,
    required this.flowType,
    required this.smsDelay,
    this.userPayload,
    required this.phone,
    this.isSignUpSecond = false,
  });

  final EnterSmsCodeType flowType;
  final bool isSignUpSecond;
  final String phone;
  final int smsDelay;
  final UserPayload? userPayload; // for resend register sms code

  @override
  _EnterSmsCodePageState createState() => _EnterSmsCodePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              EnterSmsCodeCubit(repository: context.repository.authRepository),
        ),
        BlocProvider(
          create: (context) => RegisterVerifyCubit(
            repository: context.repository.authRepository,
          ),
        ),
      ],
      child: this,
    );
  }
}

class _EnterSmsCodePageState extends State<EnterSmsCodePage> {
  final oneSec = const Duration(seconds: 1);
  final MaskTextInputFormatter maskFormatter =
      MaskTextInputFormatter(mask: '+#(###) ###-##-##');
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);
  final TextEditingController pinputController = TextEditingController();
  late final ValueNotifier<int> timerSeconds;
  late Timer timer;
  final ValueNotifier<bool> forceErrorState = ValueNotifier(false);

  final defaultPinTheme = PinTheme(
    width: double.infinity,
    // height: 55,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      color: AppColors.backgroundInputGrey,
      border: Border.all(color: AppColors.line2),
    ),
    textStyle: const TextStyle(
      color: AppColors.text,
      fontWeight: FontWeight.w600,
      fontSize: 28,
      height: 39.2 / 28,
    ),
  );

  final errorPinTheme = PinTheme(
    width: double.infinity,
    // height: 55,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      color: AppColors.muteRed,
      border: Border.all(color: AppColors.red),
    ),
    textStyle: const TextStyle(
      color: AppColors.text,
      fontWeight: FontWeight.w600,
      fontSize: 28,
      height: 39.2 / 28,
    ),
  );

  @override
  void initState() {
    timerSeconds = ValueNotifier<int>(60);

    startTimer();
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        debugPrint(timerSeconds.value.toString());
        // if (!context.mounted) {
        //   timer.cancel();
        //   return;
        // }
        if (timerSeconds.value == 0) {
          timer.cancel();
        } else {
          timerSeconds.value--;
        }
      },
    );
  }

  void checkAllowTapButton() {
    forceErrorState.value = false;
    _allowTapButton.value = pinputController.text.length == 4;
  }

  @override
  void dispose() {
    _allowTapButton.dispose();
    timer.cancel();
    timerSeconds.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: BlocConsumer<EnterSmsCodeCubit, EnterSmsCodeState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              context.loaderOverlay.hide();
              Toaster.showErrorTopShortToast(context, message);
              forceErrorState.value = true;
            },
            loading: () {
              context.loaderOverlay.show();
            },
            forgotPasswordState: (forgotPasswordToken) {
              context.loaderOverlay.hide();

              context.router.push(
                NewPasswordRoute(
                  phone: widget.phone,
                  code: pinputController.text.trim(),
                  resetToken: forgotPasswordToken,
                ),
              );
            },
            registerLoaded: (user) {
              context.loaderOverlay.hide();

              BlocProvider.of<AppBloc>(context)
                  .add(AppEvent.logining(user: user));

              context.router.replaceAll([const LauncherRoute()]);
            },
            resendForgotPasswordSmsState: (smsDelay) {
              context.loaderOverlay.hide();

              timerSeconds.value = 60;
              startTimer();
            },
            resendRegisterSmsState: (smsDelay) {
              context.loaderOverlay.hide();

              timerSeconds.value = smsDelay;
              startTimer();
            },
            orElse: () {
              context.loaderOverlay.hide();
            },
          );
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: TextButton.icon(
                onPressed: () {
                  context.router.maybePop();
                },
                label: SvgPicture.asset(Assets.icons.backArrow.path),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ScrollWrapper(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(30),
                      Text(
                        'Введите код для регистрации',
                        textAlign: TextAlign.start,
                        style: AppTextStyles.title28w700
                            .copyWith(color: AppColors.tabActive),
                      ),
                      const Gap(12),
                      Text(
                        'Введите код из SMS, отправленный на номер',
                        textAlign: TextAlign.start,
                        style: AppTextStyles.body14Regular
                            .copyWith(color: const Color(0x80000000)),
                      ),
                      Text(
                        widget.phone,
                        textAlign: TextAlign.start,
                        style: AppTextStyles.body18Regular
                            .copyWith(color: const Color(0xFF0F0F0F)),
                      ),
                      const Gap(26),
                      Center(
                        child: ValueListenableBuilder(
                          valueListenable: forceErrorState,
                          builder: (context, v, c) {
                            return Pinput(
                              autofocus: true,
                              controller: pinputController,
                              forceErrorState: forceErrorState.value,
                              separatorBuilder: (index) =>
                                  const SizedBox(width: 16),
                              onChanged: (value) {
                                checkAllowTapButton();
                              },
                              closeKeyboardWhenCompleted: false,
                              preFilledWidget: const Text(
                                '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28,
                                  color: AppColors.greyText,
                                  height: 39.2 / 28,
                                ),
                              ),
                              // androidSmsAutofillMethod: ,
                              defaultPinTheme: defaultPinTheme,
                              // submittedPinTheme: defaultPinTheme,
                              // focusedPinTheme: defaultPinTheme,
                              // followingPinTheme: defaultPinTheme,
                              errorPinTheme: errorPinTheme,
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      BlocListener<RegisterVerifyCubit, RegisterVerifyState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () => context.loaderOverlay.show(),
                            loading: () => context.loaderOverlay.show(),
                            error: (message) {
                              context.loaderOverlay.hide();
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(message)));
                            },
                            loaded: () {
                              context.loaderOverlay.hide();

                              if (widget.isSignUpSecond) {
                                context.router.replaceAll(
                                  [
                                    const CompanyDataRoute(),
                                  ],
                                );
                              } else {
                                context.router.replaceAll(
                                  [
                                    const LoginRoute(),
                                  ],
                                );
                              }
                            },
                          );
                        },
                        child: ValueListenableBuilder(
                          valueListenable: _allowTapButton,
                          builder: (context, isEnabled, _) {
                            return CustomButton(
                              allowTapButton: _allowTapButton,
                              onPressed: () {
                                BlocProvider.of<RegisterVerifyCubit>(context)
                                    .registerVerify(
                                  code: pinputController.text,
                                  phone: widget.phone
                                      .replaceAll(RegExp(r'[^\d]'), ''),
                                );
                              },
                              style: CustomButtonStyles.mainButtonStyle(context)
                                  .copyWith(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  isEnabled
                                      ? AppColors.mainColor
                                      : const Color(0xFFF5F5F5),
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  isEnabled
                                      ? Colors.white
                                      : const Color(0xFF999999),
                                ),
                              ),
                              text: 'Далее',
                              child: null,
                            );
                          },
                        ),
                      ),
                      const Gap(20),
                      Center(
                        child: ValueListenableBuilder<int>(
                          valueListenable: timerSeconds,
                          builder: (context, seconds, _) {
                            if (seconds == 0) {
                              return GestureDetector(
                                onTap: () {},
                                child: Text(
                                  context.localized.get_it_again,
                                  style: AppTextStyles.fs14w400
                                      .copyWith(color: AppColors.mainColor),
                                ),
                              );
                            }
                            return Text(
                              ' Отправить повторно через ${seconds.formattedTime()} ${context.localized.sec}',
                              style: AppTextStyles.body14Semibold
                                  .copyWith(color: AppColors.mainColor),
                            );
                          },
                        ),
                      ),
                      const Gap(22),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      // child: BlocConsumer<EnterSmsCodeCubit, EnterSmsCodeState>(
      // listener: (context, state) {
      //   state.maybeWhen(
      //     error: (message) {
      //       context.loaderOverlay.hide();
      //       Toaster.showErrorTopShortToast(context, message);
      //       forceErrorState.value = true;
      //     },
      //     loading: () {
      //       context.loaderOverlay.show();
      //     },
      //     forgotPasswordState: (forgotPasswordToken) {
      //       context.loaderOverlay.hide();

      //       context.router.push(
      //         NewPasswordRoute(email: widget.email),
      //       );
      //     },
      //     registerLoaded: (user) {
      //       context.loaderOverlay.hide();

      //       BlocProvider.of<AppBloc>(context)
      //           .add(AppEvent.logining(user: user));

      //       context.router.replaceAll([const LauncherRoute()]);
      //     },
      //     resendForgotPasswordSmsState: (smsDelay) {
      //       context.loaderOverlay.hide();

      //       timerSeconds.value = 60;
      //       startTimer();
      //     },
      //     resendRegisterSmsState: (smsDelay) {
      //       context.loaderOverlay.hide();

      //       timerSeconds.value = smsDelay;
      //       startTimer();
      //     },
      //     orElse: () {
      //       context.loaderOverlay.hide();
      //     },
      //   );
      // },
      //   builder: (context, state) {
      //     return Scaffold(
      //       appBar: AppBar(
      //         leading: TextButton.icon(
      //           onPressed: () {
      //             context.router.maybePop();
      //           },
      //           label: SvgPicture.asset(Assets.icons.backArrow.path),
      //         ),
      //       ),
      //       body: SafeArea(
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16),
      //           child: ScrollWrapper(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 const Gap(30),
      //                 const Text(
      //                   'Восстановление доступа',
      //                   textAlign: TextAlign.start,
      //                   style: AppTextStyles.title30Semibold,
      //                 ),
      //                 const Gap(12),
      //                 Text(
      //                   'Введите код из SMS, отправленный на номер',
      //                   textAlign: TextAlign.start,
      //                   style: AppTextStyles.body14Regular
      //                       .copyWith(color: const Color(0x80000000)),
      //                 ),
      //                 Text(
      //                   '+7 747 552 22 70',
      //                   textAlign: TextAlign.start,
      //                   style: AppTextStyles.body18Regular
      //                       .copyWith(color: const Color(0xFF0F0F0F)),
      //                 ),
      //                 const Gap(26),
      //                 Center(
      //                   child: ValueListenableBuilder(
      //                     valueListenable: forceErrorState,
      //                     builder: (context, v, c) {
      //                       return Pinput(
      //                         autofocus: true,
      //                         controller: pinputController,
      //                         forceErrorState: forceErrorState.value,
      //                         separatorBuilder: (index) =>
      //                             const SizedBox(width: 16),
      //                         onChanged: (value) {
      //                           checkAllowTapButton();
      //                         },
      //                         closeKeyboardWhenCompleted: false,
      //                         preFilledWidget: const Text(
      //                           '',
      //                           style: TextStyle(
      //                             fontWeight: FontWeight.w500,
      //                             fontSize: 28,
      //                             color: AppColors.greyText,
      //                             height: 39.2 / 28,
      //                           ),
      //                         ),
      //                         // androidSmsAutofillMethod: ,
      //                         defaultPinTheme: defaultPinTheme,
      //                         // submittedPinTheme: defaultPinTheme,
      //                         // focusedPinTheme: defaultPinTheme,
      //                         // followingPinTheme: defaultPinTheme,
      //                         errorPinTheme: errorPinTheme,
      //                       );
      //                     },
      //                   ),
      //                 ),
      //                 const Spacer(),
      //                 ValueListenableBuilder(
      //                       valueListenable: _allowTapButton,
      //                       builder: (context, isEnabled, _) {
      //                         return CustomButton(
      //                           allowTapButton: _allowTapButton,
      //                           onPressed: () {
      //                             // BlocProvider.of<RegisterCheckCodeCubit>(
      //                             //         context)
      //                             //     .checkCode(
      //                             //   code: pinputController.text,
      //                             //   phone: widget.phone ?? "",
      //                             // );
      //                             context.router.push(NewPasswordRoute(email: ''));
      //                           },
      //                           style:
      //                               CustomButtonStyles.mainButtonStyle(context)
      //                                   .copyWith(
      //                             shape: WidgetStatePropertyAll(
      //                               RoundedRectangleBorder(
      //                                 borderRadius: BorderRadius.circular(16),
      //                               ),
      //                             ),
      //                             backgroundColor: WidgetStatePropertyAll(
      //                               isEnabled
      //                                   ? AppColors.mainColor
      //                                   : const Color(0xFFF5F5F5),
      //                             ),
      //                             foregroundColor: WidgetStatePropertyAll(
      //                               isEnabled ? Colors.white : const Color(0xFF999999),
      //                             ),
      //                           ),
      //                           text: 'Получить код',
      //                           child: null,
      //                         );
      //                       },
      //                     ),
      //                 const Gap(20),
      //                 Center(
      //                   child: ValueListenableBuilder<int>(
      //                     valueListenable: timerSeconds,
      //                     builder: (context, seconds, _) {
      //                       if (seconds == 0) {
      //                         return GestureDetector(
      //                           onTap: () {},
      //                           child: Text(
      //                             context.localized.get_it_again,
      //                             style: AppTextStyles.fs14w400
      //                                 .copyWith(color: AppColors.mainColor),
      //                           ),
      //                         );
      //                       }
      //                       return Text(
      //                         ' Отправить повторно через ${seconds.formattedTime()} ${context.localized.sec}',
      //                         style: AppTextStyles.body14Semibold
      //                             .copyWith(color: AppColors.mainColor),
      //                       );
      //                     },
      //                   ),
      //                 ),
      //                 const Gap(22),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
