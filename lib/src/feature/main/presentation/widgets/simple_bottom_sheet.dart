// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:ikidz/src/core/gen/assets.gen.dart';
// import 'package:ikidz/src/core/presentation/widgets/bottomsheet/custom_drag_handle.dart';
// import 'package:ikidz/src/core/theme/resources.dart';
// import 'package:flutter/material.dart';

// class SimpleBottomSheet extends StatefulWidget {
//   const SimpleBottomSheet({super.key, required this.typeBs});
//   final String? typeBs;

//   @override
//   State<SimpleBottomSheet> createState() => _SimpleBottomSheetState();

//   static Future<void> show(BuildContext context, {String? typeBs}) => showModalBottomSheet(
//         context: context,
//         useRootNavigator: true,
//         useSafeArea: true,
//         isScrollControlled: true,
//         backgroundColor: Colors.white,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//         ),
//         builder: (context) => SimpleBottomSheet(typeBs: typeBs),
//       );
// }

// class _SimpleBottomSheetState extends State<SimpleBottomSheet> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom,
//         ),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: LayoutBuilder(
//             builder: (BuildContext context, BoxConstraints constraints) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Gap(8),
//                   const Align(child: CustomDragHandle()),
//                   const Gap(8),
//                   Container(
//                     height: 54,
//                     margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
//                     decoration: const BoxDecoration(
//                         color: Color(0xFFf2f2f2), borderRadius: BorderRadius.all(Radius.circular(10))),
//                     child: Material(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                       child: InkWell(
//                         borderRadius: BorderRadius.circular(10),
//                         onTap: () {},
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 16, right: 16),
//                           child: Row(
//                             children: [
//                               Text(widget.typeBs == 'send_repost' ? 'Сделать репост' : 'Удалить репост',
//                                   style: AppTextStyles.fs17w400),
//                               const Spacer(),
//                               SvgPicture.asset(Assets.icons.chevronRight.path)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
