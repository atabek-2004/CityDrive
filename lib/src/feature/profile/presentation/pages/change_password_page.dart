import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/scroll/scroll_wrapper.dart';
import 'package:ikidz/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:ikidz/src/core/theme/resources.dart';

@RoutePage()
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController = TextEditingController();
  final ValueNotifier<String?> _oldPasswordError = ValueNotifier(null);
  final ValueNotifier<String?> _passwordError = ValueNotifier(null);
  final ValueNotifier<String?> _passwordRepeatError = ValueNotifier(null);
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

  @override
  void dispose() {
    oldPasswordController.dispose();
    passwordController.dispose();
    passwordRepeatController.dispose();
    _obscureText.dispose();
    _passwordError.dispose();
    _oldPasswordError.dispose();
    _passwordRepeatError.dispose();
    _allowTapButton.dispose();
    super.dispose();
  }

  void checkAllowTapButton() {
    _allowTapButton.value = oldPasswordController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        passwordRepeatController.text.isNotEmpty &&
        passwordController.text == passwordRepeatController.text;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton.icon(
            onPressed: () {
              context.router.maybePop();
            },
            label: SvgPicture.asset(Assets.icons.backArrow.path),
          ),
          title: const Text(
            'Придумайте новый пароль',
            style: AppTextStyles.title18w500,
          ),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ScrollWrapper(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(30),
                    const Text(
                      'Старый пароль',
                      style: AppTextStyles.bodyTitleSemibold16,
                    ),
                    const Gap(12),
                    ValueListenableBuilder(
                      valueListenable: _obscureText,
                      builder: (context, v, c) {
                        return CustomValidatorTextfield(
                          obscureText: _obscureText,
                          controller: oldPasswordController,
                          valueListenable: _oldPasswordError,
                          hintText: 'Введите старый пароль',
                          onChanged: (value) {
                            checkAllowTapButton();
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return _oldPasswordError.value = 'Обязательно к заполнению';
                            }

                            return _oldPasswordError.value = null;
                          },
                        );
                      },
                    ),
                    const Gap(16),
                    const Text(
                      'Пароль',
                      style: AppTextStyles.bodyTitleSemibold16,
                    ),
                    const Gap(12),
                    ValueListenableBuilder(
                      valueListenable: _obscureText,
                      builder: (context, v, c) {
                        return CustomValidatorTextfield(
                          obscureText: _obscureText,
                          controller: passwordController,
                          valueListenable: _passwordError,
                          hintText: 'Введите пароль',
                          onChanged: (value) {
                            checkAllowTapButton();
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return _passwordError.value = 'Обязательно к заполнению';
                            }

                            if (value.length < 6) {
                              return _passwordError.value = 'Минимальная длина пароля - 6';
                            }

                            return _passwordError.value = null;
                          },
                        );
                      },
                    ),
                    const Gap(16),
                    const Text(
                      'Повторите пароль',
                      style: AppTextStyles.bodyTitleSemibold16,
                    ),
                    const Gap(12),
                    ValueListenableBuilder(
                      valueListenable: _obscureText,
                      builder: (context, v, c) {
                        return CustomValidatorTextfield(
                          obscureText: _obscureText,
                          controller: passwordRepeatController,
                          valueListenable: _passwordRepeatError,
                          hintText: 'Введите пароль',
                          onChanged: (value) {
                            checkAllowTapButton();
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return _passwordRepeatError.value = 'Обязательно к заполнению';
                            }

                            if (value.length < 6) {
                              return _passwordRepeatError.value = 'Минимальная длина пароля - 6';
                            }

                            if (value != passwordController.text) {
                              return _passwordRepeatError.value = 'Пароли не совпадают';
                            }
                            return _passwordRepeatError.value = null;
                          },
                        );
                      },
                    ),
                    const Gap(38),
                    CustomButton(
                      allowTapButton: _allowTapButton,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      style: null,
                      text: 'Зарегистрироваться',
                      child: null,
                    ),
                    const Gap(16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
