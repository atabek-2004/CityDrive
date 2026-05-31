import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordEyeSuffixIcon extends StatelessWidget {
  const PasswordEyeSuffixIcon({
    super.key,
    required this.valueListenable,
    this.hasError = true,
  });
  final ValueNotifier<bool> valueListenable;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        valueListenable.value = !valueListenable.value;
        log('${valueListenable.value}');
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 10),
        child: SvgPicture.asset(valueListenable.value ? Assets.icons.eyeOpen.path : Assets.icons.eyeClose.path),
        // child: Icon(
        //   valueListenable.value ? Icons.visibility : Icons.visibility_off,
        //   color: AppColors.base500,
        // ),
      ),
    );
  }
}
