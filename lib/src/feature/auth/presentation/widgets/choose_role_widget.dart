
// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:ikidz/src/core/gen/assets.gen.dart';
// import 'package:ikidz/src/core/theme/resources.dart';

// class ChooseRoleWidget extends StatelessWidget {
//   const ChooseRoleWidget(
//       {super.key,
//       required this.role,
//       required this.selected,
//       this.onTap,
//       this.roleNumber});
//   final String role;
//   final int selected;
//   final int? roleNumber;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: Column(
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Container(
//             height: 215,
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 border: selected == roleNumber
//                     ? Border.all(color: Colors.white.withOpacity(0.5), width: 5)
//                     : Border.all(color: Colors.transparent, width: 5),
//                 borderRadius: BorderRadius.circular(26)),
//             child: ClipRRect(
//                 borderRadius: BorderRadiusGeometry.circular(20),
//                 child: Image.asset(
//                     role == 'parent'
//                         ? Assets.images.parentRole.path
//                         : Assets.images.childRole.path,
//                     fit: BoxFit.cover,
//                     height: 205)),
//           ),
//         ),
//         const Gap(7),
//         Text(
//           role == 'parent' ? 'Родитель' : 'Ребенок',
//           textAlign: TextAlign.center,
//           style: AppTextStyles.fs18w700
//               .copyWith(height: 1.3, color: Colors.white, letterSpacing: -0.5),
//         ),
        
//       ],
//     ));
//   }
// }
