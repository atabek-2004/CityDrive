import 'package:flutter/material.dart';
import 'package:ikidz/src/core/theme/resources.dart';

class CustomBackButton extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final double borderRadius;
  final double padding;
  final void Function()? onTap;
  final Color bgColor;
  // final Color borderColor;
  final List<BoxShadow>? boxShadow;

  const CustomBackButton({
    super.key,
    required this.child,
    this.onTap,
    this.height = 48,
    this.width = 48,
    this.borderRadius = 12,
    this.padding = 16,
    this.bgColor = AppColors.backgroundButtonF5F5F5,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        // color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: child,
          ),
        ),
      ),
    );
  }
}
