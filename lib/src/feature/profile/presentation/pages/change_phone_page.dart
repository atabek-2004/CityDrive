import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/scroll/scroll_wrapper.dart';
import 'package:ikidz/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/auth/enum/enter_sms_code_type.dart';

@RoutePage()
class ChangePhonePage extends StatefulWidget {
  const ChangePhonePage({super.key});

  @override
  _ChangePhonePageState createState() => _ChangePhonePageState();
}

class _ChangePhonePageState extends State<ChangePhonePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final ValueNotifier<String?> _phoneError = ValueNotifier(null);
  final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '+7(###) ###-##-##',
    filter: {"#": RegExp('[0-9]')},
    type: MaskAutoCompletionType.eager,
  );
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

  @override
  void dispose() {
    phoneController.dispose();
    _phoneError.dispose();
    _allowTapButton.dispose();
    super.dispose();
  }

  void checkAllowTapButton() {
    _allowTapButton.value = maskFormatter.getUnmaskedText().length == 10;
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
            'Изменить номер телефона',
            style: AppTextStyles.title18w500,
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
                    const Gap(30),
                    const Text(
                      'Номер телефона',
                      style: AppTextStyles.bodyTitleSemibold16,
                    ),
                    const Gap(12),
                    CustomValidatorTextfield(
                      controller: phoneController,
                      valueListenable: _phoneError,
                      inputFormatters: [maskFormatter],
                      hintText: 'Введите номер телефона',
                      onChanged: (value) {
                        checkAllowTapButton();
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return _phoneError.value = 'Обязательно к заполнению';
                        }
                        if (maskFormatter.getUnmaskedText().length != 10) {
                          return _phoneError.value = 'Неверный формат номера';
                        }
                        return _phoneError.value = null;
                      },
                    ),
                    const Gap(38),
                    CustomButton(
                      allowTapButton: _allowTapButton,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.pushRoute(
                            EnterSmsCodeRoute(
                             phone: phoneController.text.trim(),
                              flowType: EnterSmsCodeType.changePhone,
                              // FIXME:
                              smsDelay: 60,
                            ),
                          );
                        }
                      },
                      style: null,
                      text: 'Изменить номер',
                      child: null,
                    ),
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
