// import 'dart:developer';
// import 'dart:io';

// import 'package:auto_route/auto_route.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// import 'package:ikidz/src/core/theme/resources.dart';
// import 'package:ikidz/src/core/utils/image_util.dart';
// import 'package:ikidz/src/feature/chat/model/chat_dto.dart';

// //FIXME: fix the controlling and changing with images
// //FIXME: put the border corners to little images

// @RoutePage()
// class DetailImagePage extends StatefulWidget {
//   final List<PhotoDTO>? photos;
//   final List<ImagesDTO>? images;
//   final String? imageFrom;
//   final String? avatarImage;
//   // final bool type;
//   const DetailImagePage({
//     super.key,
//     this.photos,
//     this.imageFrom,
//     this.avatarImage,
//     this.images,
//   });

//   @override
//   State<DetailImagePage> createState() => _DetailImagePageState();
// }

// class _DetailImagePageState extends State<DetailImagePage> {
//   int imageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//       ),
//       backgroundColor: AppColors.muteGrey,
//       body: Column(
//         children: [
//           const Gap(34),
//           SizedBox(
//             height: 430,
//             child: PageView.builder(
//               onPageChanged: (index) {
//                 setState(() {
//                   imageIndex = index;
//                   log('$imageIndex', name: 'image index');
//                 });
//               },
//               itemCount: widget.imageFrom == 'comment'
//                   ? widget.photos?.length
//                   : widget.imageFrom == 'avatar' || widget.imageFrom == 'chat'
//                       ? 1
//                       : widget.images?.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
//                   child: InteractiveViewer(
//                     panEnabled: false,
//                     boundaryMargin: const EdgeInsets.all(100),
//                     minScale: 0.5,
//                     maxScale: 2,
//                     child: widget.imageFrom == 'comment'
//                         ? Image.network(
//                             widget.photos?[index].image ?? '', // Display the image based on the index
//                             fit: BoxFit.contain,
//                             width: double.infinity,
//                             height: 430,
//                           )
//                         : widget.imageFrom == 'avatar'
//                             ? Image.network(
//                                 widget.avatarImage ?? '', // Display the image based on the index
//                                 fit: BoxFit.contain,
//                                 width: double.infinity,
//                                 height: 430,
//                               )
//                             : widget.imageFrom == 'chat'
//                                 ? CachedNetworkImage(
//                                     imageUrl: widget.avatarImage ?? '',
//                                     fit: BoxFit.contain,
//                                     width: double.infinity,
//                                     height: 430,
//                                     progressIndicatorBuilder: ImageUtil.cachedLoadingBuilder,
//                                   )
//                                 : CachedNetworkImage(
//                                     imageUrl: widget.images![index].image ?? '', // Display the image based on the index
//                                     fit: BoxFit.contain,
//                                     width: double.infinity,
//                                     height: 430,
//                                     progressIndicatorBuilder: ImageUtil.cachedLoadingBuilder,
//                                   ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const Gap(6),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: widget.imageFrom == 'comment'
//                 ? List.generate(widget.photos!.length, (index) {
//                     return AnimatedContainer(
//                       duration: const Duration(milliseconds: 300),
//                       margin: const EdgeInsets.symmetric(horizontal: 4),
//                       width: imageIndex == index ? 24 : 16,
//                       height: 4,
//                       decoration: BoxDecoration(
//                         color: imageIndex == index ? AppColors.mainColor : AppColors.buttonGrey,
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                     );
//                   })
//                 : widget.imageFrom == 'avatar' || widget.imageFrom == 'chat'
//                     ? [
//                         AnimatedContainer(
//                           duration: const Duration(milliseconds: 300),
//                           margin: const EdgeInsets.symmetric(horizontal: 4),
//                           width: 24,
//                           height: 4,
//                           decoration: BoxDecoration(
//                             color: AppColors.mainColor,
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         ),
//                       ]
//                     : List.generate(widget.images!.length, (index) {
//                         return AnimatedContainer(
//                           duration: const Duration(milliseconds: 300),
//                           margin: const EdgeInsets.symmetric(horizontal: 4),
//                           width: imageIndex == index ? 24 : 16,
//                           height: 4,
//                           decoration: BoxDecoration(
//                             color: imageIndex == index ? AppColors.mainColor : AppColors.buttonGrey,
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         );
//                       }),
//           ),
//           const Gap(16),
//           SizedBox(
//             height: 60,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: widget.imageFrom == 'comment'
//                   ? widget.photos?.length
//                   : widget.imageFrom == 'avatar' || widget.imageFrom == 'chat'
//                       ? 1
//                       : widget.images?.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       imageIndex = index;
//                       log('$imageIndex', name: 'image index');
//                     });
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 8.0),
//                     child: SizedBox(
//                       height: 60,
//                       width: 60,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: widget.imageFrom == 'comment'
//                             ? Image.network(
//                                 widget.photos?[index].image ?? '', // Display the image based on the index
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                                 height: 430,
//                               )
//                             : widget.imageFrom == 'avatar'
//                                 ? Image.network(
//                                     widget.avatarImage ?? '', // Display the image based on the index
//                                     fit: BoxFit.cover,
//                                     width: double.infinity,
//                                     height: 430,
//                                   )
//                                 : widget.imageFrom == 'chat'
//                                     ? Image.network(
//                                         widget.avatarImage ?? '', // Display the image based on the index
//                                         fit: BoxFit.cover,
//                                         width: double.infinity,
//                                         height: 430,
//                                       )
//                                     : Image.network(
//                                         widget.images![index].image ?? '', // Display the image based on the index
//                                         fit: BoxFit.cover,
//                                         width: double.infinity,
//                                         height: 430,
//                                       ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
