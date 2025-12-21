import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/auth/bloc/new_password_cubit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/presentation/widgets/scroll/scroll_wrapper.dart';
import 'package:ikidz/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';

@RoutePage()
class NewPasswordPage extends StatefulWidget implements AutoRouteWrapper {
  const NewPasswordPage({
    super.key,
    required this.phone,
    required this.code, required this.resetToken,
    // required this.forgotPasswordToken,
  });
  final String phone;
  final String code;
  final String resetToken;

  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewPasswordCubit(repository: context.repository.authRepository),
      child: this,
    );
  }
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController =
      TextEditingController();
  final ValueNotifier<String?> _passwordError = ValueNotifier(null);
  final ValueNotifier<String?> _passwordRepeatError = ValueNotifier(null);
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

  @override
  void dispose() {
    passwordController.dispose();
    passwordRepeatController.dispose();
    _obscureText.dispose();
    _passwordError.dispose();
    _passwordRepeatError.dispose();
    _allowTapButton.dispose();
    super.dispose();
  }

  void checkAllowTapButton() {
    _allowTapButton.value = passwordController.text.isNotEmpty &&
        passwordRepeatController.text.isNotEmpty &&
        passwordController.text == passwordRepeatController.text;
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocConsumer<NewPasswordCubit, NewPasswordState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                context.loaderOverlay.hide();
                Toaster.showErrorTopShortToast(context, message);
              },
              loading: () {
                context.loaderOverlay.show();
              },
              loaded: (response) {
                context.loaderOverlay.hide();
                context.router.replaceAll([const LauncherRoute()]);
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
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: ScrollWrapper(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          const Text.rich(
                            TextSpan(
                              text: 'Создайте новый пароль',
                              style: AppTextStyles.title30Semibold,
                            ),
                          ),
                          const Gap(30),
                          Text(
                            context.localized.password,
                            style: AppTextStyles.texts13w500
                                .copyWith(color: AppColors.text63636366),
                          ),
                          const Gap(12),
                          ValueListenableBuilder(
                            valueListenable: _obscureText,
                            builder: (context, v, c) {
                              return CustomValidatorTextfield(
                                obscureText: _obscureText,
                                controller: passwordController,
                                valueListenable: _passwordError,
                                hintText:
                                    context.localized.enter_a_new_password,
                                onChanged: (value) {
                                  checkAllowTapButton();
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return _passwordError.value =
                                        context.localized.required_to_fill_in;
                                  }

                                  if (value.length < 6) {
                                    return _passwordError.value = context
                                        .localized
                                        .the_minimum_password_length_is_6;
                                  }

                                  return _passwordError.value = null;
                                },
                              );
                            },
                          ),
                          const Gap(16),
                          Text(
                            context.localized.repeat_the_password,
                            style: AppTextStyles.texts13w500
                                .copyWith(color: AppColors.text63636366),
                          ),
                          const Gap(12),
                          ValueListenableBuilder(
                            valueListenable: _obscureText,
                            builder: (context, v, c) {
                              return CustomValidatorTextfield(
                                obscureText: _obscureText,
                                controller: passwordRepeatController,
                                valueListenable: _passwordRepeatError,
                                hintText: context.localized.repeat_the_password,
                                onChanged: (value) {
                                  checkAllowTapButton();
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return _passwordRepeatError.value =
                                        context.localized.required_to_fill_in;
                                  }

                                  if (value.length < 6) {
                                    return _passwordRepeatError.value = context
                                        .localized
                                        .the_minimum_password_length_is_6;
                                  }

                                  if (value != passwordController.text) {
                                    return _passwordRepeatError.value =
                                        context.localized.passwords_dont_match;
                                  }
                                  return _passwordRepeatError.value = null;
                                },
                              );
                            },
                          ),
                          const Spacer(),
                          const Gap(16),
                          ValueListenableBuilder(
                            valueListenable: _allowTapButton,
                            builder: (context, isEnabled, _) {
                              return CustomButton(
                                allowTapButton: _allowTapButton,
                                onPressed: () {
                                  final password =
                                      passwordController.text.trim();
                                  final confirmPassword =
                                      passwordRepeatController.text.trim();

                                  if (password.isEmpty ||
                                      confirmPassword.isEmpty) {
                                    Toaster.showErrorTopShortToast(
                                        context, 'Заполните оба поля пароля');
                                    return;
                                  }

                                  if (password != confirmPassword) {
                                    Toaster.showErrorTopShortToast(
                                        context, 'Пароли не совпадают');
                                    return;
                                  }

                                  BlocProvider.of<NewPasswordCubit>(context)
                                      .newPassword(
                                    password: password,
                                    passwordConf: confirmPassword,
                                    payload: null,
                                    resetToken: widget.resetToken,
                                  );
                                },
                                style:
                                    CustomButtonStyles.mainButtonStyle(context)
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
                                text: 'Готово',
                                child: null,
                              );
                            },
                          ),
                          const Gap(16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        // child: BlocConsumer<NewPasswordCubit, NewPasswordState>(
        // listener: (context, state) {
        //   state.maybeWhen(
        //     error: (message) {
        //       context.loaderOverlay.hide();
        //       Toaster.showErrorTopShortToast(context, message);
        //     },
        //     loading: () {
        //       context.loaderOverlay.show();
        //     },
        //     loaded: () {
        //       context.loaderOverlay.hide();
        //       context.router.replaceAll([const LauncherRoute()]);
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
        //         child: Form(
        //           key: _formKey,
        //           autovalidateMode: AutovalidateMode.onUserInteraction,
        //           child: ScrollWrapper(
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   vertical: 8, horizontal: 16),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   const Gap(20),
        //                   const Text.rich(
        //                     TextSpan(
        //                       text: 'Создайте новый пароль',
        //                       style: AppTextStyles.title30Semibold,
        //                     ),
        //                   ),
        //                   const Gap(30),
        //                   Text(
        //                     context.localized.password,
        //                     style: AppTextStyles.texts13w500
        //                         .copyWith(color: AppColors.text63636366),
        //                   ),
        //                   const Gap(12),
        //                   ValueListenableBuilder(
        //                     valueListenable: _obscureText,
        //                     builder: (context, v, c) {
        //                       return CustomValidatorTextfield(
        //                         obscureText: _obscureText,
        //                         controller: passwordController,
        //                         valueListenable: _passwordError,
        //                         hintText:
        //                             context.localized.enter_a_new_password,
        //                         onChanged: (value) {
        //                           checkAllowTapButton();
        //                         },
        //                         validator: (String? value) {
        //                           if (value == null || value.isEmpty) {
        //                             return _passwordError.value =
        //                                 context.localized.required_to_fill_in;
        //                           }

        //                           if (value.length < 6) {
        //                             return _passwordError.value = context
        //                                 .localized
        //                                 .the_minimum_password_length_is_6;
        //                           }

        //                           return _passwordError.value = null;
        //                         },
        //                       );
        //                     },
        //                   ),
        //                   const Gap(16),
        //                   Text(
        //                     context.localized.repeat_the_password,
        //                     style: AppTextStyles.texts13w500
        //                         .copyWith(color: AppColors.text63636366),
        //                   ),
        //                   const Gap(12),
        //                   ValueListenableBuilder(
        //                     valueListenable: _obscureText,
        //                     builder: (context, v, c) {
        //                       return CustomValidatorTextfield(
        //                         obscureText: _obscureText,
        //                         controller: passwordRepeatController,
        //                         valueListenable: _passwordRepeatError,
        //                         hintText: context.localized.repeat_the_password,
        //                         onChanged: (value) {
        //                           checkAllowTapButton();
        //                         },
        //                         validator: (String? value) {
        //                           if (value == null || value.isEmpty) {
        //                             return _passwordRepeatError.value =
        //                                 context.localized.required_to_fill_in;
        //                           }

        //                           if (value.length < 6) {
        //                             return _passwordRepeatError.value = context
        //                                 .localized
        //                                 .the_minimum_password_length_is_6;
        //                           }

        //                           if (value != passwordController.text) {
        //                             return _passwordRepeatError.value =
        //                                 context.localized.passwords_dont_match;
        //                           }
        //                           return _passwordRepeatError.value = null;
        //                         },
        //                       );
        //                     },
        //                   ),
        //                   const Spacer(),
        //                   const Gap(16),
        //                   ValueListenableBuilder(
        //                     valueListenable: _allowTapButton,
        //                     builder: (context, isEnabled, _) {
        //                       return CustomButton(
        //                         allowTapButton: _allowTapButton,
        //                         onPressed: () {
        //                           // BlocProvider.of<RegisterCheckCodeCubit>(
        //                           //         context)
        //                           //     .checkCode(
        //                           //   code: pinputController.text,
        //                           //   phone: widget.phone ?? "",
        //                           // );
        //                         },
        //                         style:
        //                             CustomButtonStyles.mainButtonStyle(context)
        //                                 .copyWith(
        //                           shape: WidgetStatePropertyAll(
        //                             RoundedRectangleBorder(
        //                               borderRadius: BorderRadius.circular(16),
        //                             ),
        //                           ),
        //                           backgroundColor: WidgetStatePropertyAll(
        //                             isEnabled
        //                                 ? AppColors.mainColor
        //                                 : const Color(0xFFF5F5F5),
        //                           ),
        //                           foregroundColor: WidgetStatePropertyAll(
        //                             isEnabled ? Colors.white : const Color(0xFF999999),
        //                           ),
        //                         ),
        //                         text: 'Готово',
        //                         child: null,
        //                       );
        //                     },
        //                   ),
        //                   const Gap(16),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
