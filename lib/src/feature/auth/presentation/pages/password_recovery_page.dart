import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/feature/auth/bloc/send_sms_cubit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/presentation/widgets/scroll/scroll_wrapper.dart';
import 'package:ikidz/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/core/utils/input/validator_util.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/auth/bloc/password_recovery_cubit.dart';
import 'package:ikidz/src/feature/auth/presentation/auth.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class PasswordRecoveryPage extends StatefulWidget implements AutoRouteWrapper {
  const PasswordRecoveryPage({super.key});

  @override
  _PasswordRecoveryPageState createState() => _PasswordRecoveryPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SendSmsCubit(repository: context.repository.authRepository),
      child: this,
    );
  }
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final ValueNotifier<String?> _emailError = ValueNotifier(null);
  final MaskTextInputFormatter maskFormatter =
      MaskTextInputFormatter(mask: '+7(###) ###-##-##');
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);
  final ValueNotifier<String?> _phoneError = ValueNotifier(null);

  @override
  void dispose() {
    phoneController.dispose();
    _emailError.dispose();
    _allowTapButton.dispose();
    _phoneError.dispose();
    super.dispose();
  }

  // bool isValidEmail(String value) {
  //   const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  //   final regExp = RegExp(pattern);
  //   return regExp.hasMatch(value);
  // }

  void checkAllowTapButton() {
    _allowTapButton.value = phoneController.text.length == 17;
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: BlocConsumer<SendSmsCubit, SendSmsState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              context.loaderOverlay.hide();
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text(
                      message),
                ),
              );
            },
            loading: () {
              context.loaderOverlay.show();
            },
            loaded: (smsDTO) {
              context.loaderOverlay.hide();
              context.router.push(EnterSmsCodeRoute(
                phone: phoneController.text.trim(),
                flowType: EnterSmsCodeType.forgotPassword,
                smsDelay: 60,
              ));
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
                label: SvgPicture.asset(
                  Assets.icons.backArrow.path,
                  height: 25,
                ),
              ),
            ),
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ScrollWrapper(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(20),
                        Text(
                          context.localized.enter_your_phone_number,
                          style: AppTextStyles.title30Semibold,
                        ),
                        const Gap(30),
                        Text(
                          context.localized.phone_number,
                          style: AppTextStyles.body14Regular,
                        ),
                        const Gap(12),
                        CustomValidatorTextfield(
                          controller: phoneController,
                          valueListenable: _phoneError,
                          inputFormatters: [maskFormatter],
                          hintText: context.localized.enter_your_phone_number,
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
                        Spacer(),
                        ValueListenableBuilder(
                          valueListenable: _allowTapButton,
                          builder: (context, isEnabled, _) {
                            return CustomButton(
                              allowTapButton: _allowTapButton,
                              onPressed: () {
                                BlocProvider.of<SendSmsCubit>(context)
                                    .forgotPasswordSmsSend(
                                  phone: phoneController.text
                                      .replaceAll(RegExp(r'[^\d]'), ''),
                                  payload: null,
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
                              text: 'Получить код',
                              child: null,
                            );
                          },
                        ),
                        Gap(24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
