// import 'package:ikidz/src/core/gen/assets.gen.dart';
// import 'package:ikidz/src/core/theme/resources.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// // ignore: must_be_immutable
// class CustomDropdown<T> extends StatelessWidget {
//   final List<T> items;
//   final List<DropdownMenuItem<T>>? menuItems;
//   final TextStyle? style;
//   final String hint;
//   final String? prefixIcon;
//   final T? value;
//   void Function(T?)? onChanged;
//   final String? iconWidget;
//   final Widget? selectedWidget;

//   CustomDropdown({
//     super.key,
//     required this.items,
//     this.menuItems,
//     this.style,
//     required this.hint,
//     this.prefixIcon,
//     required this.value,
//     this.onChanged,
//     this.iconWidget,
//     this.selectedWidget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2<T>(
//         isExpanded: true,
//         hint: Row(
//           children: [
//             if (prefixIcon != null)
//               Container(
//                 padding: const EdgeInsets.only(right: 16),
//                 child: SvgPicture.asset('$prefixIcon'),
//               ),
//             Text(
//               hint,
//               style: AppTextStyles.fs16w400
//                   .copyWith(color: AppColors.base500, letterSpacing: -0.41),
//             ),
//           ],
//         ),
//         selectedItemBuilder: (context) => items
//             .map(
//               (e) => Row(
//                 children: [
//                   if (prefixIcon != null)
//                     Container(
//                       padding: const EdgeInsets.only(right: 16),
//                       child: SvgPicture.asset('$prefixIcon'),
//                     ),
//                   selectedWidget ?? Text('$e', style: AppTextStyles.fs16w400),
//                 ],
//               ),
//             )
//             .toList(),
//         items: menuItems ??
//             items
//                 .map(
//                   (T item) => DropdownMenuItem<T>(
//                     value: item,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           '$item',
//                           style: style ??
//                               AppTextStyles.fs16w400.copyWith(height: 1.1),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         // if (value == item)
//                         //   SvgPicture.asset(
//                         //     Assets.icons.radioOff24.path,
//                         //   )
//                         // else
//                         //   SvgPicture.asset(
//                         //     Assets.icons.radioOn24.path,
//                         //   ),
//                       ],
//                     ),
//                   ),
//                 )
//                 .toList(),
//         value: value,
//         onChanged: onChanged,
//         buttonStyleData: ButtonStyleData(
//           height: 48,
//           // padding: const EdgeInsets.only(right: 16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             // border: Border.all(
//             //   color: AppColors.lightStroke1,
//             // ),
//             color: Colors.white,
//           ),
//         ),
//         iconStyleData: IconStyleData(
//           icon: Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: SvgPicture.asset(Assets.icons.rightIcons.path),
//           ),
//         ),
//         dropdownStyleData: DropdownStyleData(
//           maxHeight: 300,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             // border: Border.all(color: Colors.black, width: 0.6),
//           ),
//         ),
//       ),
//     );
//   }
// }
