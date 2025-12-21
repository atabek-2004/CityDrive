import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart' show Assets;
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';

@RoutePage()
class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController cardController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final ValueNotifier<bool> _cvvObscure = ValueNotifier<bool>(true);
  final ValueNotifier<String?> _expiryError = ValueNotifier<String?>(null);
  final ValueNotifier<String?> _cvvError = ValueNotifier<String?>(null);
  final ValueNotifier<String?> _cardError = ValueNotifier(null);
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

  void checkAllowTapButton() {
    _allowTapButton.value = cardController.text.isNotEmpty &&
        expiryController.text.isNotEmpty &&
        cvvController.text.isNotEmpty;
  }

  @override
  void dispose() {
    cardController.dispose();
    _cardError.dispose();
    _allowTapButton.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: TextButton.icon(
          onPressed: () {
            context.router.maybePop();
          },
          label: SvgPicture.asset(
            Assets.icons.backArrow.path,
            color: AppColors.black,
            height: 25,
          ),
        ),
        title: Text(
          'Добавить карту',
          style: AppTextStyles.title20BoldW600.copyWith(
            color: AppColors.tabActive,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: ListView(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Номер карты',
                    style: AppTextStyles.texts13w500
                        .copyWith(color: AppColors.text63636366),
                  ),
                  const Gap(6),
                  ValueListenableBuilder(
                    valueListenable: _allowTapButton,
                    builder: (context, v, c) {
                      return CustomValidatorTextfield(
                        controller: cardController,
                        hintText: 'Введите номер карты',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(
                            19,
                          ),
                          _CardNumberInputFormatter(),
                        ],
                        onChanged: (value) {
                          checkAllowTapButton();
                        },
                        validator: (String? value) {
                          final cleanValue = value?.replaceAll(' ', '') ?? '';
                          if (cleanValue.length < 16) {
                            return '';
                          }
                          return null;
                        },
                        valueListenable: _cardError,
                      );
                    },
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Срок годность',
                              style: AppTextStyles.texts13w500
                                  .copyWith(color: AppColors.text63636366),
                            ),
                            const Gap(8),
                            ValueListenableBuilder(
                              valueListenable: _expiryError,
                              builder: (context, String? error, _) {
                                return CustomValidatorTextfield(
                                  controller: expiryController,
                                  hintText: 'MM/YY',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(
                                      5,
                                    ),
                                    _ExpiryDateInputFormatter(),
                                  ],
                                  onChanged: (value) {
                                    // Обновляем ошибку в реальном времени (если нужно)
                                    // _expiryError.value = validateExpiry(value);
                                    checkAllowTapButton();
                                  },
                                  // validator: (String? value) {
                                  //   return validateExpiry(value);
                                  // },
                                  valueListenable: _expiryError,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CVV',
                              style: AppTextStyles.texts13w500
                                  .copyWith(color: AppColors.text63636366),
                            ),
                            const Gap(8),
                            ValueListenableBuilder(
                              valueListenable: _cvvObscure,
                              builder: (context, bool obscure, _) {
                                return ValueListenableBuilder(
                                  valueListenable: _cvvError,
                                  builder: (context, String? error, _) {
                                    return CustomValidatorTextfield(
                                      showEye: false,
                                      controller: cvvController,
                                      hintText: '***',
                                      keyboardType: TextInputType.number,
                                      obscureText: ValueNotifier(obscure),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(3),
                                      ],
                                      onChanged: (value) {
                                        // _cvvError.value = validateCvv(value);
                                        checkAllowTapButton();
                                      },
                                      // validator: (String? value) {
                                      //   return validateCvv(value);
                                      // },
                                      valueListenable: _cvvError,
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 40.0),
        child: ValueListenableBuilder(
          valueListenable: _allowTapButton,
          builder: (context, isEnabled, _) {
            return CustomButton(
              allowTapButton: _allowTapButton,
              onPressed: () {
                context.router.push(const ChangeCardRoute());
              },
              style: CustomButtonStyles.mainButtonStyle(context).copyWith(
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
                      : AppColors.foregroundTextButoonWhenIsnotAllowed,
                ),
              ),
              text: 'Добавить',
              child: null,
            );
          },
        ),
      ),
    );
  }

  // String? validateExpiry(String? value) {
  //   if (value == null || value.isEmpty) return 'Введите срок действия';
  //   final clean = value.replaceAll('/', '');
  //   if (clean.length != 4) return 'Неверный формат MM/YY';

  //   final monthStr = clean.substring(0, 2);
  //   final yearStr = clean.substring(2, 4);

  //   final month = int.tryParse(monthStr);
  //   final year = int.tryParse(yearStr);

  //   if (month == null || year == null) return 'Неверный формат';
  //   if (month < 1 || month > 12) return 'Месяц от 01 до 12';

  //   final now = DateTime.now();
  //   final currentYearTwoDigits = now.year % 100;
  //   final currentMonth = now.month;

  //   if (year < currentYearTwoDigits ||
  //       (year == currentYearTwoDigits && month < currentMonth)) {
  //     return '';
  //   }

  //   return null;
  // }

  // String? validateCvv(String? value) {
  //   if (value == null || value.isEmpty) return '';
  //   final clean = value.replaceAll(' ', '');
  //   if (clean.length != 3) return '';
  //   if (int.tryParse(clean) == null) return '';
  //   return null;
  // }
}

class _CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var digits = newValue.text.replaceAll(' ', '');

    if (digits.length > 16) {
      digits = digits.substring(0, 16);
    }

    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);

      if ((i + 1) % 4 == 0 && i + 1 != digits.length) {
        buffer.write(' ');
      }
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class _ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var digits = newValue.text.replaceAll('/', '');

    if (digits.length > 4) digits = digits.substring(0, 4);

    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i == 2) buffer.write('/');
      buffer.write(digits[i]);
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
