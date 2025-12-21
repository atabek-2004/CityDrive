import 'package:flutter/material.dart';

class CustomDragHandle extends StatelessWidget {
  final bool isShopBottomSheet;
  const CustomDragHandle({super.key, required this.isShopBottomSheet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 4,
        width: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(const Radius.circular(5)),
          color: isShopBottomSheet ? const Color(0xff121212) :Color(0xffCCCCCC),
        ),
      ),
    );
  }
}
