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
// import 'package:ikidz/src/feature/auth/bloc/new_password_cubit.dart';
// import 'package:ikidz/src/feature/auth/models/request/user_payload.dart';
// import 'package:loader_overlay/loader_overlay.dart';

// @RoutePage()
// class ResetPasswordPage extends StatefulWidget implements AutoRouteWrapper {
//   const ResetPasswordPage({super.key, required this.resetToken});
//   final String resetToken;

//   @override
//   State<ResetPasswordPage> createState() => _ResetPasswordPageState();

//   @override
//   Widget wrappedRoute(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) =>
//               NewPasswordCubit(repository: context.repository.authRepository),
//         ),
//       ],
//       child: this,
//     );
//   }
// }

// class _ResetPasswordPageState extends State<ResetPasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _passwordRepeatController =
//       TextEditingController();
//   final ValueNotifier<String?> _passwordError = ValueNotifier(null);
//   final ValueNotifier<String?> _passwordRepeatError = ValueNotifier(null);
//   final ValueNotifier<bool> _obscureText = ValueNotifier(true);
//   final ValueNotifier<bool> _obscureText2 = ValueNotifier(true);
//   final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _passwordRepeatController.dispose();
//     _passwordError.dispose();
//     _passwordRepeatError.dispose();
//     _allowTapButton.dispose();
//     super.dispose();
//   }

//   bool checkAllowTapButton() {
//     return true;
//     // return passwordController.text.isNotEmpty &&
//     //     passwordRepeatController.text.isNotEmpty &&
//     //     passwordController.text == passwordRepeatController.text;
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LoaderOverlay(
//       overlayColor: AppColors.barrierColor,
//       overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
//       child: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: Scaffold(
//           backgroundColor: AppColors.bg,
//           body: SafeArea(
//             child: Form(
//               key: _formKey,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
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
//                     title('Создайте новый пароль'),
//                     const Gap(24),
//                     // Пароль
//                     titleTextField('Пароль'),
//                     const Gap(6),
//                     ValueListenableBuilder(
//                       valueListenable: _obscureText,
//                       builder: (context, value, child) {
//                         return CustomTextField(
//                           height: 48,
//                           contentPadding: const EdgeInsets.only(left: 10),
//                           controller: _passwordController,
//                           obscureText: _obscureText,
//                           hintText: 'Придумайте пароль',
//                           hintStyle: AppTextStyles.fs16w400.copyWith(
//                               color: AppColors.grey3, letterSpacing: -0.4),
//                           fillColor: Colors.white,
//                           textStyle: AppTextStyles.fs16w400
//                               .copyWith(letterSpacing: -0.4),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide.none),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide.none),
//                           onTap: () {},
//                           onChanged: (value) {
//                             checkAllowTapButton();
//                             setState(() {});
//                           },
//                         );
//                       },
//                     ),
//                     const Gap(14),

//                     // Повторить  пароль
//                     titleTextField('Повторить  пароль'),
//                     const Gap(6),
//                     ValueListenableBuilder(
//                       valueListenable: _obscureText2,
//                       builder: (context, value, child) {
//                         return CustomTextField(
//                           height: 48,
//                           contentPadding: const EdgeInsets.only(left: 10),
//                           controller: _passwordRepeatController,
//                           obscureText: _obscureText2,
//                           hintText: 'Повторить  пароль',
//                           hintStyle: AppTextStyles.fs16w400.copyWith(
//                               color: AppColors.grey3, letterSpacing: -0.4),
//                           fillColor: Colors.white,
//                           textStyle: AppTextStyles.fs16w400
//                               .copyWith(letterSpacing: -0.4),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide.none),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide.none),
//                           onTap: () {},
//                           onChanged: (value) {
//                             checkAllowTapButton();
//                             setState(() {});
//                           },
//                         );
//                       },
//                     ),
//                     const Gap(19),

//                     const Spacer(),
//                     // Кнопка "Войти"
//                     CustomButton(
//                       onPressed: () {
//                         context.router.popUntil((route) => route.settings.name == LoginRoute.name);
//                       },
//                       style: CustomButtonStyles.mainButtonStyle(context),
//                       text: 'Готово',
//                       child: null,
//                     ),
//                     // Padding(
//                     //   padding: const EdgeInsets.only(left: 10),
//                     //   child: CustomBackButton(
//                     //     height: 40,
//                     //     width: 40,
//                     //     padding: 8,
//                     //     borderRadius: 100,
//                     //     bgColor: AppColors.grey1.withValues(alpha: 0.2),
//                     //     child: SvgPicture.asset(Assets.icons.back.path),
//                     //     onTap: () {
//                     //       context.router.maybePop();
//                     //     },
//                     //   ),
//                     // ),
//                     // Padding(
//                     //   padding: const EdgeInsets.symmetric(horizontal: 16),
//                     //   child: ValueListenableBuilder(
//                     //     valueListenable: _obscureText,
//                     //     builder: (context, value, child) {
//                     //       return CustomValidatorTextfield(
//                     //         controller: passwordController,
//                     //         valueListenable: _passwordError,
//                     //         obscureText: _obscureText,
//                     //         hintText: "Новый пароль",
//                     //         onChanged: (value) {
//                     //           checkAllowTapButton();
//                     //           setState(() {});
//                     //         },
//                     //       );
//                     //     }
//                     //   ),
//                     // ),
//                     // const Gap(12),
//                     // Padding(
//                     //   padding: const EdgeInsets.symmetric(horizontal: 16),
//                     //   child: ValueListenableBuilder(
//                     //     valueListenable: _obscureText2,
//                     //     builder: (context, v, c) {
//                     //       return CustomValidatorTextfield(
//                     //         controller: passwordRepeatController,
//                     //         valueListenable: _passwordRepeatError,
//                     //         hintText: "Повторите пароль",
//                     //         obscureText: _obscureText2,
//                     //         // suffixIcon: SvgPicture.asset(Assets.icons.back.path),
//                     //         onChanged: (value) {
//                     //           checkAllowTapButton();
//                     //           setState(() {});
//                     //         },
//                     //       );
//                     //     }
//                     //   ),
//                     // ),
//                     // const Spacer(),
//                     // BlocListener<NewPasswordCubit, NewPasswordState>(
//                     //   listener: (context, state) {
//                     //     state.maybeWhen(
//                     //       loading: () => context.loaderOverlay.show(),
//                     //       error: (message) {
//                     //         context.loaderOverlay.hide();
//                     //         Toaster.showErrorTopShortToast(context, message);
//                     //         Future<void>.delayed(
//                     //           const Duration(milliseconds: 300),
//                     //         ).whenComplete(
//                     //           () => _formKey.currentState!.validate(),
//                     //         );
//                     //       },
//                     //       loaded: (message) {
//                     //         context.loaderOverlay.hide();
//                     //         Toaster.showTopShortToast(context,
//                     //             message: message?.message ?? '');
//                     //         context.router.popUntil((route) => route.settings.name == LoginRoute.name);
//                     //       },
//                     //       orElse: () => context.loaderOverlay.hide(),
//                     //     );
//                     //   },
//                     //   child: Padding(
//                     //     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     //     child: CustomButton(
//                     //       height: 52,
//                     //       onPressed: () {
//                     //         if (checkAllowTapButton()) {
//                     //           BlocProvider.of<NewPasswordCubit>(context)
//                     //               .newPassword(
//                     //                   payload: UserPayload(
//                     //                       resetToken: widget.resetToken,
//                     //                       password: passwordController.text,
//                     //                       passwordConfirmation:
//                     //                           passwordRepeatController.text));
//                     //         } else {
//                     //           Toaster.showErrorTopShortToast(
//                     //                 context, 'Напишите пароль');
//                     //         }
//                     //       },
//                     //       style: CustomButtonStyles.mainButtonStyle(context,
//                     //           backgroundColor: AppColors.mainColor, radius: 24),
//                     //       child: Text(
//                     //         'Изменить',
//                     //         style: AppTextStyles.fs16w700.copyWith(
//                     //             color: Colors.white, letterSpacing: -0.4),
//                     //       ),
//                     //     ),
//                     //     // child: CustomButton(
//                     //     //             height: 52,
//                     //     //             onPressed: () {},
//                     //     //             style: CustomButtonStyles.mainButtonStyle(context, backgroundColor: AppColors.mainColor.withOpacity(0.14), radius: 14),
//                     //     //             child: Text(
//                     //     //               'Войти',
//                     //     //               style: AppTextStyles.fs16w700.copyWith(color: AppColors.mainColor, letterSpacing: -0.4),
//                     //     //             ),
//                     //     //           ),
//                     //   ),
//                     // ),
//                     // const Gap(20),
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
