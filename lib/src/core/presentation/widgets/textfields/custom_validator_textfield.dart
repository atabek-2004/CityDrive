import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:city_drive/src/core/presentation/widgets/error/error_text_widget.dart';
import 'package:city_drive/src/core/presentation/widgets/textfields/custom_textfield.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/feature/auth/presentation/widgets/password_eye_suffix_icon.dart';

class CustomValidatorTextfield extends StatelessWidget {
  final bool showEye;
  const CustomValidatorTextfield({
    super.key,
    required this.controller,
    this.validator,
    required this.valueListenable,
    this.onChanged,
    this.hintText,
    this.obscureText,
    this.inputFormatters,
    this.suffixIcon,
    this.hintStyle,
    this.onTap,
    this.autofocus = false,
    this.readOnly = false,
    this.keyboardType,
    this.focusedBorder,
    this.fillColor,
    this.showEye = true,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueNotifier<String?> valueListenable;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? hintText;
  final ValueNotifier<bool>? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final bool autofocus;
  final TextInputType? keyboardType;
  final InputBorder? focusedBorder;
  final bool readOnly;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, v, c) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              fillColor: fillColor == null ? null : AppColors.inputTextFildEAECED,
              obscureText: obscureText?.value,
              controller: controller,
              onChanged: onChanged,
              onTap: onTap,
              focusedBorder: focusedBorder,
              autofocus: autofocus,
              readOnly: readOnly,
              inputFormatters: inputFormatters,
              hintStyle: hintStyle,
              hintText: hintText,
              
              keyboardType: keyboardType,
              errorStyle: const TextStyle(
                height: 0,
                fontSize: 0,
              ),
              validator: validator,
              suffixIcon: obscureText != null 
                  ? showEye ? (PasswordEyeSuffixIcon(
                      valueListenable: obscureText!,
                      hasError: valueListenable.value != null,
                    ))
                  : suffixIcon : null,
            ),
            // const Gap(4),
            Align(
              alignment: Alignment.centerLeft,
              child: ErrorTextWidget(
                text: valueListenable.value,
              ),
            ),
          ],
        );
      },
    );
  }
}
