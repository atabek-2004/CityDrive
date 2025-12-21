import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';


@sealed
class Toaster {
  const Toaster._();

  static void showTopShortToast(
    BuildContext context, {
    required String message,
    double radius = 12,
    EdgeInsetsGeometry? padding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    Color? color,
    Widget? body,
    String? svgIconPath,
  }) {
    FToast().removeQueuedCustomToasts();

    final Widget toast = Container(
      padding: body != null ? const EdgeInsets.all(10) : padding,
      // margin: const EdgeInsets.symmetric(horizontal: 50),
      // width: MediaQuery.of(context).size.width,
      margin: body != null ? const EdgeInsets.symmetric(horizontal: 16, vertical: 16) : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF8BADF0), width: 0.5),
        color: color ?? const Color(0xFFE9EBF5),
        // color: color ?? AppColors.mainColor,
        boxShadow: const [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 24,
          ),
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 2,
          ),
        ],
      ),
      child: body ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SvgPicture.asset(
              //   Assets.icons.info.path,
              //   width: 22,
              //   height: 22,
              // ),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  message,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5
                  ),
                ),
              ),
            ],
          ),
    );

    FToast().showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
      positionedToastBuilder: (context, child, q) {
        return Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          // left: MediaQuery.of(context).size.width / 3,
          child: child,
        );
      },
    );
  }

  static void showErrorTopShortToast(
    BuildContext context,
    String message, {
    double radius = 12,
    EdgeInsetsGeometry? padding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    Color? color,
    Widget? body,
  }) {
    FToast().removeQueuedCustomToasts();

    final Widget toast = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: const Color(0xFFFFA3A6), width: 1),
          color: const Color(0xFFF7E4E4),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Color.fromRGBO(12, 12, 13, 0.05),
              blurRadius: 4,
            ),
            BoxShadow(
              offset: Offset(0, 1),
              color: Color.fromRGBO(12, 12, 13, 0.1),
              blurRadius: 4,
            ),
          ],
        ),
        child: body ??
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SvgPicture.asset(
                //   Assets.icons.redClose.path,
                //   width: 22,
                //   height: 22,
                // ),
                Gap(8),
                // Flexible(
                //   child: Text(
                //     message,
                //     maxLines: 2,
                //     overflow: TextOverflow.ellipsis,
                //     style: AppTextStyles.fs14w500.copyWith(),
                //   ),
                // ),
              ],
            ),
      ),
    );

    FToast().showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
      positionedToastBuilder: (context, child, q) {
        return Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          // left: MediaQuery.of(context).size.width / 3,
          child: child,
        );
      },
    );
  }
}
