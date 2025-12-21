// import 'package:ikidz/src/core/presentation/widgets/textfields/custom_textfield.dart';
// import 'package:ikidz/src/feature/app/presentation/widgets/app_text.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:ikidz/src/core/gen/assets.gen.dart';
// import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
// import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
// import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
// import 'package:ikidz/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
// import 'package:ikidz/src/core/theme/resources.dart';
// import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
// import 'package:ikidz/src/feature/app/presentation/widgets/custom_back_button.dart';
// import 'package:ikidz/src/feature/app/router/app_router.dart';
// import 'package:ikidz/src/feature/auth/bloc/send_sms_cubit.dart';
// import 'package:ikidz/src/feature/auth/models/request/user_payload.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// @RoutePage()
// class ForgetPasswordPage extends StatefulWidget implements AutoRouteWrapper {
//   const ForgetPasswordPage({super.key});

//   @override
//   State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();

//   @override
//   Widget wrappedRoute(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) =>
//               SendSmsCubit(repository: context.repository.authRepository),
//         ),
//       ],
//       child: this,
//     );
//   }
// }

// class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
//   final TextEditingController _phoneController = TextEditingController();
//   final ValueNotifier<String?> _phoneError = ValueNotifier(null);
//   final MaskTextInputFormatter maskFormatter =
//       MaskTextInputFormatter(mask: '+7(###) ###-##-##');

//   bool checkAllowTapButton() {
//     return maskFormatter.getUnmaskedText().length == 10;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LoaderOverlay(
//       overlayColor: AppColors.barrierColor,
//       overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
//       child: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: AppColors.bg,
//           body: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomBackButton(
//                     height: 40,
//                     width: 40,
//                     padding: 4,
//                     borderRadius: 100,
//                     bgColor: AppColors.grey1.withValues(alpha: 0.2),
//                     child: Transform.rotate(
//                         angle: 90 * 3.1415926535 / 180,
//                         child: SvgPicture.asset(Assets.icons.rightIcons.path)),
//                     onTap: () {
//                       context.router.maybePop();
//                     },
//                   ),
//                   const Gap(20),
//                   title('Введите номер \nтелефона'),
//                   const Gap(24),

//                   // Номер телефона
//                   titleTextField('Номер телефона'),
//                   const Gap(6),
//                   CustomTextField(
//                     height: 48,
//                     contentPadding: const EdgeInsets.only(left: 10),
//                     controller: _phoneController,
//                     inputFormatters: [maskFormatter],
//                     hintText: 'Ваш номер телефона',
//                     hintStyle: AppTextStyles.fs16w400
//                         .copyWith(color: AppColors.grey3, letterSpacing: -0.4),
//                     keyboardType: TextInputType.number,
//                     fillColor: Colors.white,
//                     textStyle:
//                         AppTextStyles.fs16w400.copyWith(letterSpacing: -0.4),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none),
//                     onChanged: (v) {
//                       checkAllowTapButton();
//                       setState(() {});
//                     },
//                   ),
//                   const Gap(14),
//                   const Spacer(),
//                   // Кнопка "Получить код"
//                   CustomButton(
//                     onPressed: () {
//                       context.router.push(SmsRoute(phone: '+7 (777) 777 77 77', type: 'forget_password'));
//                     },
//                     style: CustomButtonStyles.mainButtonStyle(context),
//                     text: 'Получить код',
//                     child: null,
//                   ),
//                   const Gap(16),
//                   const Gap(10)
//                   // const Spacer(),
//                   // BlocListener<LoginCubit, LoginState>(
//                   //   listener: (context, state) {
//                   //     state.maybeWhen(
//                   //       loading: () => context.loaderOverlay.show(),
//                   //       error: (message) {
//                   //         context.loaderOverlay.hide();
//                   //         Toaster.showErrorTopShortToast(context, message);
//                   //         Future<void>.delayed(
//                   //           const Duration(milliseconds: 300),
//                   //         ).whenComplete(
//                   //           () => _formKey.currentState?.validate(),
//                   //         );
//                   //       },
//                   //       loaded: (user) {
//                   //         context.loaderOverlay.hide();
//                   //         BlocProvider.of<AppBloc>(context)
//                   //             .add(AppEvent.logining(user: user));
//                   //         context.router.replaceAll([LauncherRoute()]);
//                   //       },
//                   //       orElse: () => context.loaderOverlay.hide(),
//                   //     );
//                   //   },
//                   //   child: Padding(
//                   //     padding: const EdgeInsets.symmetric(horizontal: 16),
//                   //     child: CustomButton(
//                   //       height: 52,
//                   //       onPressed: checkAllowTapButton()
//                   //           ? () {
//                   //               BlocProvider.of<LoginCubit>(context).login(
//                   //                   payload: UserPayload(
//                   //                 phone: '+7${maskFormatter.getUnmaskedText()}',
//                   //                 password: passwordController.text,
//                   //               ));
//                   //             }
//                   //           : () {
//                   //               log(maskFormatter
//                   //                   .getUnmaskedText()
//                   //                   .length
//                   //                   .toString());
//                   //               Toaster.showErrorTopShortToast(
//                   //                   context, 'Заполните данные');
//                   //             },
//                   //       style: CustomButtonStyles.mainButtonStyle(context,
//                   //           backgroundColor: AppColors.mainColor, radius: 24),
//                   //       child: Text(
//                   //         'Войти',
//                   //         style: AppTextStyles.fs16w700
//                   //             .copyWith(color: Colors.white, letterSpacing: -0.4),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   // const Gap(20),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   spacing: 4,
//                   //   children: [
//                   //     Text(
//                   //       'У вас нет аккаунта? ',
//                   //       style: AppTextStyles.fs14w400
//                   //           .copyWith(height: 1.3, color: AppColors.grey1),
//                   //     ),
//                   //     GestureDetector(
//                   //       // onTap: () => context.router.push(const ChooseRoleRoute()),
//                   //       child: Text(
//                   //         'Зарегистрируйтесь',
//                   //         style: AppTextStyles.fs14w700.copyWith(
//                   //             height: 1.3,
//                   //             color: AppColors.purlple,
//                   //             letterSpacing: -0.41),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   // const Gap(12),
//                 ],
//               ),
//             ),
//           ),

//           // body: SafeArea(
//           //   child: Column(
//           //     crossAxisAlignment: CrossAxisAlignment.start,
//           //     children: [
//           //       // Padding(
//           //       //   padding: const EdgeInsets.only(left: 10),
//           //       //   child: CustomBackButton(
//           //       //     height: 40,
//           //       //     width: 40,
//           //       //     padding: 8,
//           //       //     borderRadius: 100,
//           //       //     bgColor: AppColors.grey1.withValues(alpha: 0.2),
//           //       //     child: SvgPicture.asset(Assets.icons.back.path),
//           //       //     onTap: () {
//           //       //       context.router.maybePop();
//           //       //     },
//           //       //   ),
//           //       // ),
//           //       const Gap(81),
//           //       const Padding(
//           //         padding: EdgeInsets.only(left: 16),
//           //         child: Text('Забыли пароль?', style: AppTextStyles.fs30w700),
//           //       ),
//           //       const Gap(32),
//           //       Padding(
//           //         padding: const EdgeInsets.symmetric(horizontal: 16),
//           //         child: CustomValidatorTextfield(
//           //           controller: phoneController,
//           //           valueListenable: _phoneError,
//           //           inputFormatters: [maskFormatter],
//           //           hintText: "Номер телефон",
//           //           keyboardType: TextInputType.number,
//           //           onChanged: (value) {
//           //             checkAllowTapButton();
//           //             setState(() {});
//           //           },
//           //         ),
//           //       ),
//           //       const Spacer(),
//           //       BlocListener<SendSmsCubit, SendSmsState>(
//           //         listener: (context, state) {
//           //           state.maybeWhen(
//           //               orElse: () => context.loaderOverlay.hide(),
//           //               loading: () => context.loaderOverlay.show(),
//           //               loaded: (smsDTO) {
//           //                 context.loaderOverlay.hide();
//           //                 Toaster.showTopShortToast(context,
//           //                     message: smsDTO?.message ?? '');
//           //                 context.router.push(
//           //                     SmsRoute(phone: '+7${maskFormatter.getUnmaskedText()}',));
//           //               },
//           //               error: (message) {
//           //                 context.loaderOverlay.hide();
//           //                 Toaster.showErrorTopShortToast(context, message);
//           //               });
//           //         },
//           //         child: Padding(
//           //           padding: const EdgeInsets.symmetric(horizontal: 16),
//           //           child: CustomButton(
//           //             height: 52,
//           //             onPressed: () {
//           //               BlocProvider.of<SendSmsCubit>(context).forgetPassword(
//           //                   payload: UserPayload(
//           //                 phone: '+7${maskFormatter.getUnmaskedText()}',
//           //               ));
//           //             },
//           //             style: CustomButtonStyles.mainButtonStyle(context,
//           //                 backgroundColor: AppColors.mainColor, radius: 24),
//           //             child: Text(
//           //               'Далее',
//           //               style: AppTextStyles.fs16w700
//           //                   .copyWith(color: Colors.white, letterSpacing: -0.4),
//           //             ),
//           //           ),
//           //         ),
//           //       ),
//           //       const Gap(20),
//           //     ],
//           //   ),
//           // ),
//         ),
//       ),
//     );
//   }
// }
