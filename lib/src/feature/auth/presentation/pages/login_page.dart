import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:city_drive/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:city_drive/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:city_drive/src/core/presentation/widgets/scroll/scroll_wrapper.dart';
import 'package:city_drive/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/core/utils/input/validator_util.dart';
import 'package:city_drive/src/feature/app/bloc/app_bloc.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/auth/bloc/login_cubit.dart';
import 'package:city_drive/src/feature/auth/presentation/utils/auth_navigation.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(repository: context.repository.authRepository),
      child: this,
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<String?> _phoneError = ValueNotifier(null);
  final ValueNotifier<String?> _passwordError = ValueNotifier(null);
  final MaskTextInputFormatter maskFormatter =
      MaskTextInputFormatter(mask: '+7(###) ###-##-##');
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    _obscureText.dispose();
    _passwordError.dispose();
    _phoneError.dispose();
    _allowTapButton.dispose();
    super.dispose();
  }

  void checkAllowTapButton() {
    _allowTapButton.value =
        phoneController.text.length == 17 && passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
        overlayColor: AppColors.barrierColor,
        overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () => context.loaderOverlay.show(),
              error: (message, sendedOldValue, authErrorResponse) {
                context.loaderOverlay.hide();

                Future<void>.delayed(
                  const Duration(milliseconds: 300),
                ).whenComplete(
                  () => _formKey.currentState!.validate(),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              },
              loaded: (user) {
                context.loaderOverlay.hide();
                navigateAfterAuth(context, user);
                if (context.repository.authRepository.isApproved) {
                  Toaster.showTopShortToast(context, message: 'Успешно');
                }
              },
              orElse: () => context.loaderOverlay.hide(),
            );
          },
          builder: (context, state) {
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
                    label: SvgPicture.asset(
                      Assets.icons.backArrow.path,
                      height: 25,
                    ),
                  ),
                ),
                body: SafeArea(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ScrollWrapper(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(27),
                            const Text(
                              'Войти в аккаунт',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                height: 32 / 26,
                              ),
                            ),
                            const Gap(8),
                            const Gap(30),
                            Text(
                              context.localized.phone_number,
                              style: AppTextStyles.texts13w500
                                  .copyWith(color: AppColors.text63636366),
                            ),
                            const Gap(12),
                            CustomValidatorTextfield(
                              controller: phoneController,
                              valueListenable: _phoneError,
                              inputFormatters: [maskFormatter],
                              hintText:
                                  context.localized.enter_your_phone_number,
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                checkAllowTapButton();
                              },
                              validator: (String? value) {
                                return _phoneError.value = ValidatorUtil.phone(
                                  maskFormatter.getUnmaskedText(),
                                );
                              },
                            ),
                            const Gap(16),
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
                                      context.localized.enter_the_password,
                                  onChanged: (value) {
                                    checkAllowTapButton();
                                  },
                                  validator: (String? value) {
                                    return null;
                                  },
                                );
                              },
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {
                                  context
                                      .pushRoute(const PasswordRecoveryRoute());
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: AppColors.blue,
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text(
                                  'Я забыл свой пароль',
                                ),
                              ),
                            ),
                            const Spacer(flex: 3),
                            const Gap(10),
                            ValueListenableBuilder(
                              valueListenable: _allowTapButton,
                              builder: (context, isEnabled, _) {
                                return CustomButton(
                                  allowTapButton: _allowTapButton,
                                  onPressed: () {
                                    BlocProvider.of<LoginCubit>(context).login(
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                    );
                                  },
                                  style: CustomButtonStyles.mainButtonStyle(
                                          context)
                                      .copyWith(
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    backgroundColor: WidgetStatePropertyAll(
                                      isEnabled
                                          ? AppColors.mainColor
                                          : AppColors.backgroundButtonF5F5F5,
                                    ),
                                    foregroundColor: WidgetStatePropertyAll(
                                      isEnabled
                                          ? AppColors.white
                                          : AppColors
                                              .foregroundTextButoonWhenIsnotAllowed,
                                    ),
                                  ),
                                  text: 'Войти',
                                  child: null,
                                );
                              },
                            ),
                            const Gap(16),
                            Center(
                              child: Text.rich(
                                TextSpan(
                                  text: context
                                      .localized.dont_you_have_an_account,
                                  style: AppTextStyles.bodyTitleRegular16,
                                  children: [
                                    TextSpan(
                                      text: context.localized.register,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          context.router
                                              .push(const SignUpFirstRoute());
                                        },
                                      style: AppTextStyles.bodyTitleRegular16
                                          .copyWith(
                                        color: AppColors.mainColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(8),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
