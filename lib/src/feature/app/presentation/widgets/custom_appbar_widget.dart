// import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
// import 'package:ikidz/src/core/gen/assets.gen.dart';
// import 'package:ikidz/src/feature/app/presentation/widgets/custom_back_button.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:ikidz/src/core/theme/resources.dart';
// import 'package:gap/gap.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool isWithBackButton;
//   final String? title;

//   final String? svg;
//   final Color? color;
//   final int? quarterTurns;
//   final List<Widget>? actions;
//   final void Function()? onPressed;
//   final ShapeBorder? shape;
//   final TextStyle? textStyle;
//   final bool isBackButton;
//   const CustomAppBar({
//     super.key,
//     this.title,
//     this.actions,
//     this.onPressed,
//     this.color,
//     this.svg,
//     this.quarterTurns,
//     this.shape,
//     this.textStyle,
//     this.isBackButton = true,
//     required this.isWithBackButton,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: Padding(
//         padding:
//             const EdgeInsets.only(left: 16, right: 16, top: 70, bottom: 10),
//         child: isWithBackButton
//             ? Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomBackButton(
//                     height: 40,
//                     width: 40,
//                     padding: 4,
//                     borderRadius: 100,
//                     bgColor: AppColors.grey1.withValues(alpha: 0.2),
//                     child: Transform.rotate(
//                         angle: 90 * 3.1415926535 / 180,
//                         child: SvgPicture.asset(Assets.icons.rightIcons.path)),
//                     onTap: () {
//                       context.router.maybePop();
//                     },
//                   ),
//                   Text(title ?? '', style: AppTextStyles.fs20w600),
//                   const Gap(40)
//                 ],
//               )
//             : Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Global Group', style: AppTextStyles.fs24w600),
//                   GestureDetector(
//                     onTap: () {
//                       Toaster.showTopShortToast(context,
//                           message: 'Раздел в разработке');
//                     },
//                     child: Stack(
//                       children: [
//                         Container(
//                           width: 44,
//                           height: 44,
//                           margin: const EdgeInsets.all(2),
//                           padding: const EdgeInsets.all(10),
//                           decoration: const BoxDecoration(
//                             color: Color(0xFF2C3E6F),
//                             shape: BoxShape.circle,
//                           ),
//                           child:
//                               SvgPicture.asset(Assets.icons.notification.path),
//                           // child: const Icon(
//                           //   Icons.notifications_outlined,
//                           //   color: Colors.white,
//                           //   size: 24,
//                           // ),
//                         ),
//                         Positioned(
//                           right: 0,
//                           top: 2,
//                           child: Container(
//                             width: 14,
//                             height: 14,
//                             decoration: const BoxDecoration(
//                               color: Colors.red,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
