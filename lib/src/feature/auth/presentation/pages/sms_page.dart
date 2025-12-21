// import 'dart:async';

// import 'package:ikidz/src/feature/app/presentation/widgets/app_text.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:ikidz/src/core/gen/assets.gen.dart';
// import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
// import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
// import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
// import 'package:ikidz/src/core/presentation/widgets/scroll/scroll_wrapper.dart';
// import 'package:ikidz/src/core/theme/resources.dart';
// import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
// import 'package:ikidz/src/core/utils/extensions/integer_extension.dart';
// import 'package:ikidz/src/feature/app/presentation/widgets/custom_back_button.dart';
// import 'package:ikidz/src/feature/app/router/app_router.dart';
// import 'package:ikidz/src/feature/auth/bloc/code_cubit.dart';
// import 'package:ikidz/src/feature/auth/bloc/send_sms_cubit.dart';
// import 'package:ikidz/src/feature/auth/models/request/user_payload.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:pinput/pinput.dart';

// @RoutePage()
// class SmsPage extends StatefulWidget implements AutoRouteWrapper {
//   const SmsPage({super.key, required this.phone, required this.type});
//   final String phone;
//   final String type;

//   @override
//   State<SmsPage> createState() => _SmsPageState();

//   @override
//   Widget wrappedRoute(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) =>
//               CodeCubit(repository: context.repository.authRepository),
//         ),
//         BlocProvider(
//           create: (context) =>
//               SendSmsCubit(repository: context.repository.authRepository),
//         ),
//       ],
//       child: this,
//     );
//   }
// }

// class _SmsPageState extends State<SmsPage> {
//   final oneSec = const Duration(seconds: 1);
//   MaskTextInputFormatter maskFormatter =
//       MaskTextInputFormatter(mask: '+#(###) ###-##-##');
//   final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);
//   final TextEditingController pinputController = TextEditingController();
//   late final ValueNotifier<int> timerSeconds;
//   late Timer timer;
//   final ValueNotifier<bool> forceErrorState = ValueNotifier(false);

//   final defaultPinTheme = PinTheme(
//     width: 64,
//     height: 64,
//     decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(16)),
//         border: Border.all(color: AppColors.grey1),
//         color: Colors.transparent),
//     textStyle: const TextStyle(
//         fontWeight: FontWeight.w600, fontSize: 28, height: 39.2 / 28),
//   );

//   final focusedPinTheme = PinTheme(
//     width: 64,
//     height: 64,
//     decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(16)),
//         border: Border.all(color: AppColors.primary),
//         color: AppColors.geekBlue),
//     textStyle: const TextStyle(
//         fontWeight: FontWeight.w600, fontSize: 28, height: 39.2 / 28),
//   );

//   final submittedPinTheme = PinTheme(
//     width: 64,
//     height: 64,
//     decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(16)),
//         border: Border.all(color: AppColors.borderColor),
//         color: AppColors.borderColor),
//     textStyle: const TextStyle(
//         fontWeight: FontWeight.w600, fontSize: 28, height: 39.2 / 28),
//   );

//   @override
//   void initState() {
//     timerSeconds = ValueNotifier(15);

//     maskFormatter = MaskTextInputFormatter(
//       mask: '+#(###) ###-##-##',
//       filter: {"#": RegExp('[0-9]')},
//       initialText: widget.phone,
//     );

//     startTimer();
//     super.initState();
//   }

//   void startTimer() {
    
//     if (!mounted) return;
//     timer = Timer.periodic(oneSec, (Timer timer) {
//       debugPrint(timerSeconds.value.toString());
//       if (!context.mounted) {
//         timer.cancel();
//         return;
//       }
//       if (timerSeconds.value == 0) {
//         timer.cancel();
//       } else {
//         timerSeconds.value--;
//       }
//     });
//   }

//   void checkAllowTapButton() {
//     forceErrorState.value = false;
//     _allowTapButton.value = pinputController.text.length == 4;
//   }

//   @override
//   void dispose() {
//     _allowTapButton.dispose();
//     timer.cancel();
//     timerSeconds.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LoaderOverlay(
//       overlayColor: AppColors.barrierColor,
//       overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
//       child: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: BlocListener<CodeCubit, CodeState>(
//           listener: (context, state) {
//             state.maybeWhen(
//                 orElse: () => context.loaderOverlay.hide(),
//                 loading: () => context.loaderOverlay.show(),
//                 loaded: (smsDTO) {
//                   context.loaderOverlay.hide();
//                   Toaster.showTopShortToast(context,
//                       message: smsDTO.message ?? '');

//                   context.router.push(ResetPasswordRoute(
//                       resetToken: smsDTO.resetToken ?? 'null'));
//                 },
//                 error: (message) {
//                   context.loaderOverlay.hide();
//                   Toaster.showErrorTopShortToast(context, message);
//                 });
//           },
//           child: Scaffold(
//             // resizeToAvoidBottomInset: false,
//             backgroundColor: AppColors.bg,
//             body: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomBackButton(
//                       height: 40,
//                       width: 40,
//                       padding: 4,
//                       borderRadius: 100,
//                       bgColor: AppColors.grey1.withValues(alpha: 0.2),
//                       child: Transform.rotate(
//                           angle: 90 * 3.1415926535 / 180,
//                           child:
//                               SvgPicture.asset(Assets.icons.rightIcons.path)),
//                       onTap: () {
//                         context.router.maybePop();
//                       },
//                     ),
//                     const Gap(20),
//                     title(widget.type == 'register' ?  'Введите код для регистрации' : 'Восстановление \nдоступа'),
//                     const Gap(24),
//                     subTitle('Введите код из SMS, отправленный на номер'),
//                     const Gap(2),
//                     Text('${maskFormatter.getMaskedText()}.  ',
//                         style: AppTextStyles.fs14w600),
//                     const Gap(36),
//                     Center(
//                       child: ValueListenableBuilder(
//                         valueListenable: forceErrorState,
//                         builder: (context, v, c) {
//                           return Pinput(
//                             autofocus: true,
//                             controller: pinputController,
//                             forceErrorState: forceErrorState.value,
//                             scrollPadding: EdgeInsets.zero,
//                             separatorBuilder: (index) =>
//                                 const SizedBox(width: 10),
//                             onChanged: (value) {
//                               checkAllowTapButton();
//                             },
//                             closeKeyboardWhenCompleted: false,
//                             defaultPinTheme: defaultPinTheme,
//                             submittedPinTheme: submittedPinTheme,
//                             errorPinTheme: defaultPinTheme,
//                             focusedPinTheme: focusedPinTheme,
//                           );
//                         },
//                       ),
//                     ),
//                     const Spacer(),
//                     // Кнопка "Далее"
//                     CustomButton(
//                       onPressed: () {
//                         widget.type == 'register' ? 
//                         context.router.push(const SuccessRegisterRoute())
//                         : context.router.push(ResetPasswordRoute(resetToken: ''));
//                       },
//                       style: CustomButtonStyles.mainButtonStyle(context),
//                       text: 'Далее',
//                       child: null,
//                     ),
//                     const Gap(16),
//                     ValueListenableBuilder(
//                         valueListenable: timerSeconds,
//                         builder: (context, v, c) {
//                           if (timerSeconds.value == 0) {
//                             return Center(
//                               child: Text.rich(
//                                 TextSpan(
//                                   text: '',
//                                   style: AppTextStyles.fs16w400,
//                                   children: [
//                                     TextSpan(
//                                       text: 'Получить код',
//                                       recognizer: TapGestureRecognizer()
//                                         ..onTap = () {
//                                           timerSeconds.value = 15;
//                             startTimer();
//                                           // BlocProvider.of<SendSmsCubit>(context)
//                                           //     .forgetPassword(
//                                           //         payload: UserPayload(
//                                           //   phone: widget.phone,
//                                           // ));
//                                         },
//                                       style: AppTextStyles.fs16w600.copyWith(color: AppColors.primary)
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }
//                           return Center(
//                               child: Text.rich(TextSpan(
//                                   text:
//                                       'Отправить повторно через ${timerSeconds.value.formattedTime()} с', style: AppTextStyles.fs16w600.copyWith(color: AppColors.primary))));
//                         },
//                       ),
//                     const Gap(16),
//                     // BlocListener<SendSmsCubit, SendSmsState>(
//                     //   listener: (context, state) {
//                     //     state.maybeWhen(
//                     //       orElse: () => context.loaderOverlay.hide(),
//                     //       loading: () => context.loaderOverlay.show(),
//                     //       loaded: (smsDTO) {
//                     //         context.loaderOverlay.hide();
//                     //         timerSeconds.value = 15;
//                     //         startTimer();
//                     //       },
//                     //       error: (message) {
//                     //         context.loaderOverlay.hide();
//                     //         Toaster.showErrorTopShortToast(context, message);
//                     //       },
//                     //     );
//                     //   },
//                     //   child: ValueListenableBuilder(
//                     //     valueListenable: timerSeconds,
//                     //     builder: (context, v, c) {
//                     //       if (timerSeconds.value == 0) {
//                     //         return Center(
//                     //           child: Text.rich(
//                     //             TextSpan(
//                     //               text: '',
//                     //               style: AppTextStyles.fs16w400,
//                     //               children: [
//                     //                 TextSpan(
//                     //                   text: 'Получить код',
//                     //                   recognizer: TapGestureRecognizer()
//                     //                     ..onTap = () {
//                     //                       BlocProvider.of<SendSmsCubit>(context)
//                     //                           .forgetPassword(
//                     //                               payload: UserPayload(
//                     //                         phone: widget.phone,
//                     //                       ));
//                     //                     },
//                     //                   style: AppTextStyles.fs14w500
//                     //                       .copyWith(color: AppColors.mainColor),
//                     //                 ),
//                     //               ],
//                     //             ),
//                     //           ),
//                     //         );
//                     //       }
//                     //       return Center(
//                     //           child: Text.rich(TextSpan(
//                     //               text:
//                     //                   ' ${timerSeconds.value.formattedTime()} сек')));
//                     //     },
//                     //   ),
//                     // ),
//                     // const Spacer(),
//                     // Padding(
//                     //   padding: const EdgeInsets.symmetric(horizontal: 16),
//                     //   child: CustomButton(
//                     //     height: 52,
//                     //     onPressed: () {
//                     //       BlocProvider.of<CodeCubit>(
//                     //         context,
//                     //       ).checkCode(
//                     //           payload: UserPayload(
//                     //               phone: widget.phone,
//                     //               code: pinputController.text));
//                     //     },
//                     //     style: CustomButtonStyles.mainButtonStyle(context,
//                     //         backgroundColor: AppColors.mainColor, radius: 24),
//                     //     child: Text(
//                     //       'Отправить',
//                     //       style: AppTextStyles.fs16w700
//                     //           .copyWith(color: Colors.white, letterSpacing: -0.4),
//                     //     ),
//                     //   ),
//                     // ),
//                     const Gap(10),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
