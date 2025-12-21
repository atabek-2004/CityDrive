// import 'dart:developer';
// import 'dart:io';

// import 'package:auto_route/auto_route.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:ikidz/src/core/constant/constants.dart';
// import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
// import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
// import 'package:ikidz/src/core/presentation/widgets/textfields/custom_textfield.dart';
// import 'package:ikidz/src/core/theme/resources.dart';

// import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
// import 'package:ikidz/src/core/utils/extensions/datetime_extension.dart';
// import 'package:ikidz/src/core/utils/image_util.dart';
// import 'package:ikidz/src/feature/app/presentation/widgets/custom_appbar_widget.dart';
// import 'package:ikidz/src/feature/app/presentation/widgets/field_debouncer.dart';
// import 'package:ikidz/src/feature/app/router/app_router.dart';
// import 'package:ikidz/src/feature/chat/bloc/chat_detail_bloc_ws.dart';
// import 'package:ikidz/src/feature/chat/bloc/upload_image_cubit.dart';
// import 'package:ikidz/src/feature/chat/logic/chat_ws.dart';
// import 'package:ikidz/src/feature/chat/model/chat_dto.dart';
// import 'package:ikidz/src/feature/chat/model/message_dto.dart';
// import 'package:ikidz/src/feature/chat/presentation/grouped_list/smart_grouped_list.dart';
// import 'package:ikidz/src/feature/chat/presentation/widgets/message_body_widget.dart';

// @RoutePage()
// class ChatsDetailPage extends StatefulWidget implements AutoRouteWrapper {
//   final ChatDTO? chat;
//   final int localeUserId;
//   const ChatsDetailPage({super.key, this.chat, required this.localeUserId});

//   @override
//   _ChatsDetailPageState createState() => _ChatsDetailPageState();

//   @override
//   Widget wrappedRoute(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => ChatDetailBlocWS(
//             context.repository.chatRepository,
//             ChatWS(context.repository.authRepository),
//             localeUserId: localeUserId,
//             chat: chat ?? const ChatDTO(),
//           ),
//         ),
//         BlocProvider(
//           create: (context) => ImageUploadCubit(
//             repository: context.repository.chatRepository,
//           ),
//         ),
//       ],
//       child: this,
//     );
//   }
// }

// class _ChatsDetailPageState extends State<ChatsDetailPage> {
//   final RefreshController _refreshController = RefreshController();
//   final ScrollController _scrollController = ScrollController();
//   final TextEditingController _messageController = TextEditingController();
//   final FieldDebouncer debouncer = FieldDebouncer(milliseconds: 500);
//   DateTime? appMinimizedTime;

//   List<XFile> _images = [];
//   final List<String> _imagesLink = [];
//   final ImagePicker picker = ImagePicker();

//   final FocusNode textFieldFocus = FocusNode();

//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     debugPrint(state.toString());
//     if (state == AppLifecycleState.paused) {
//       // Save the current time when the app is minimized
//       appMinimizedTime = DateTime.now();
//     } else if (state == AppLifecycleState.resumed && appMinimizedTime != null) {
//       // Calculate the time difference when the app is resumed

//       final Duration timeDifference = DateTime.now().difference(appMinimizedTime!);

//       debugPrint('appMinimizedTime - $appMinimizedTime');
//       debugPrint('now - ${DateTime.now()}');
//       debugPrint('timeDifference  - $timeDifference');

//       if (timeDifference.inSeconds > 30) {
//         if (widget.chat?.id != null) {
//           BlocProvider.of<ChatDetailBlocWS>(context).add(
//             ChatDetailEventWS.getChatDetail(chatId: widget.chat!.id),
//           );
//         }
//       }
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<ChatDetailBlocWS>(context).add(
//       ChatDetailEventWS.getChatDetail(chatId: widget.chat?.id),
//     );
//     // BlocProvider.of<ChatDetailBlocWS>(context).add(
//     //   ChatDetailEventWS.readMessage(
//     //     chatId: widget.chat?.id,
//     //     partnerId: widget.chat?.userId,
//     //   ),
//     // );

//     log('${widget.chat?.id}', name: 'chat id');
//     log('${widget.localeUserId}', name: 'my user id');
//     log('${widget.chat?.userId}', name: 'partner id');
//   }

//   @override
//   void dispose() {
//     _refreshController.dispose();
//     _scrollController.dispose();
//     _messageController.dispose();
//     textFieldFocus.dispose();
//     super.dispose();
//   }

//   void _completeRefreshControllers() {
//     if (_refreshController.isLoading) {
//       _refreshController.loadComplete();
//     }

//     if (_refreshController.isRefresh) {
//       _refreshController.refreshCompleted();
//     }
//   }

//   void _removeInputTextFocus() {
//     FocusScope.of(context).requestFocus(FocusNode());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ChatDetailBlocWS, ChatDetailStateWS>(
//       listener: (context, state) {
//         state.maybeWhen(
//           error: (message) {
//             // context.loaderOverlay.hide();
//             Toaster.showErrorTopShortToast(context, message);
//             _completeRefreshControllers();
//           },
//           loaded: (messages, localeUserId, isLastPage) {
//             _imagesLink.clear();
//             context.loaderOverlay.hide();
//           },
//           loading: () {
//             // context.loaderOverlay.show();
//             _refreshController.resetNoData();
//           },
//           orElse: () {
//             // context.loaderOverlay.hide();
//             _completeRefreshControllers();
//           },
//         );
//       },
//       builder: (context, state) => state.maybeWhen(
//         orElse: () => Scaffold(
//           backgroundColor: Colors.white,
//           appBar: CustomAppBar(
//             quarterTurns: 0,
//             title: '${widget.chat?.name}',
//           ),
//           body: SafeArea(
//             child: Column(
//               children: [
//                 // body
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: _removeInputTextFocus,
//                     child: const Center(
//                       child: SizedBox(
//                         width: 60,
//                         height: 60,
//                         child: CircularProgressIndicator.adaptive(),
//                       ),
//                     ),
//                   ),
//                 ),

//                 // bottom
//                 Column(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.only(
//                         left: 16,
//                         right: 16,
//                         top: 20,
//                         bottom: 20,
//                       ),
//                       height: 94,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(23),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 17.6,
//                           ),
//                         ],
//                       ),
//                       child: CustomTextField(
//                         controller: _messageController,
//                         hintText: context.localized.writeComment,
//                         onFieldSubmitted: (value) {
//                           if (_messageController.text.trim().isNotEmpty) {
//                             BlocProvider.of<ChatDetailBlocWS>(context).add(
//                               ChatDetailEventWS.sendMessage(
//                                 text: _messageController.text.trim(),
//                                 partnerId: widget.chat?.userId,
//                                 images: _imagesLink.isNotEmpty ? _imagesLink : null,
//                               ),
//                             );

//                             _messageController.clear();

//                             _scrollController.animateTo(
//                               0,
//                               duration: const Duration(milliseconds: 300),
//                               curve: Curves.linear,
//                             );
//                           }
//                         },
//                         prefixIcon: Assets.icons.camera16.path,
//                         onTapPrefixIcon: () async {},
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         loaded: (messages, localeUserId, isLastPage) {
//           return Scaffold(
//             backgroundColor: Colors.white,
//             appBar: CustomAppBar(
//               quarterTurns: 0,
//               title: '${widget.chat?.name}',
//             ),
//             body: Column(
//               children: [
//                 ///
//                 /// body
//                 ///
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: _removeInputTextFocus,
//                     child: state.maybeWhen(
//                       // loadedState: (messages, localeUserId, isLastPage) => ChatTimeline(
//                       //   localeUserId: widget.localeUserId,
//                       //   messages: messages,
//                       //   smartRefreshController: smartRefreshController,
//                       //   scrollController: _scrollController,
//                       //   opponentId: widget.chat?.userId,
//                       // ),
//                       loaded: (messages, localeUserId, isLastPage) {
//                         return Scrollbar(
//                           controller: _scrollController,
//                           thumbVisibility: true,
//                           radius: const Radius.circular(15),
//                           child: SmartGroupedListView<MessageDTO, DateTime>(
//                             refreshController: _refreshController,
//                             // enablePullUp: true,
//                             enablePullDown: false,
//                             // refresherFooter: const RefreshClassicFooter(),
//                             // onLoading: () {
//                             //   BlocProvider.of<ChatDetailBlocWS>(context)
//                             //       .add(const ChatDetailEventWS.loadMessages());
//                             // },
//                             controller: _scrollController,
//                             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//                             elements: messages,
//                             // order: GroupedListOrder.ASC,
//                             sort: false,
//                             reverse: true,
//                             floatingHeader: true,
//                             // useStickyGroupSeparators: true,
//                             padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//                             groupBy: (MessageDTO element) => DateTime(
//                               element.createdAt!.year,
//                               element.createdAt!.month,
//                               element.createdAt!.day,
//                             ),
//                             groupHeaderBuilder: (element) => GroupHeaderDate(date: element.createdAt!),
//                             interdependentItemBuilder: (
//                               context,
//                               MessageDTO? previousElement,
//                               MessageDTO currentElement,
//                               MessageDTO? nextElement,
//                             ) {
//                               return MessageBox(
//                                 myId: widget.localeUserId,
//                                 previousElement: previousElement,
//                                 currentElement: currentElement,
//                                 nextElement: nextElement,
//                                 opponentId: widget.chat?.userId,
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       initial: () => const SizedBox(),
//                       orElse: () => const Center(
//                         child: SizedBox(
//                           width: 60,
//                           height: 60,
//                           child: CircularProgressIndicator.adaptive(),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 ///
//                 /// bottom
//                 ///
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 16,
//                     right: 16,
//                     top: 20,
//                     bottom: 20,
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: AppColors.muteGrey,
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(
//                         color: AppColors.lineGrey,
//                       ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             IconButton(
//                               onPressed: widget.chat?.userId == null
//                                   ? null
//                                   : () async {
//                                       // Toaster.showErrorTopShortToast(context, 'Пока что нет функции камеры');
//                                       try {
//                                         final List<XFile> pickedImages = await picker.pickMultiImage();

//                                         if (pickedImages.isNotEmpty) {
//                                           _images.addAll(pickedImages);
//                                           if (!context.mounted) return;
//                                           BlocProvider.of<ImageUploadCubit>(context).uploadImage(
//                                             images: pickedImages,
//                                           );
//                                           log('Выбранные изображения: $_images');
//                                         } else {
//                                           log('Пользователь не выбрал изображения.');
//                                         }

//                                         setState(() {});
//                                       } catch (e) {
//                                         // ignore: use_build_context_synchronously
//                                         Toaster.showErrorTopShortToast(context, 'Ошибка при выборе изображений');
//                                       }
//                                       // if (hasImages) {
//                                       //   // show the delete dialog
//                                       //   showMyAnimatedDialog(
//                                       //     context: context,
//                                       //     title: 'Delete Images',
//                                       //     content: 'Are you sure you want to delete the images?',
//                                       //     actionText: 'Delete',
//                                       //     onActionPressed: (value) {
//                                       //       if (value) {
//                                       //         widget.chatProvider.setImagesFileList(listValue: []);
//                                       //       }
//                                       //     },
//                                       //   );
//                                       // } else {
//                                       //   pickImage();
//                                       // }
//                                     },
//                               icon: SvgPicture.asset(Assets.icons.camera.path),
//                             ),
//                             Expanded(
//                               child: Scrollbar(
//                                 controller: _scrollController,
//                                 thumbVisibility: true,
//                                 thickness: 4.0,
//                                 child: TextFormField(
//                                   focusNode: textFieldFocus,
//                                   controller: _messageController,
//                                   textInputAction: TextInputAction.send,
//                                   maxLines: 3,
//                                   minLines: 1,
//                                   readOnly: widget.chat?.userId == null ? true : false,
//                                   decoration: InputDecoration(
//                                     focusedBorder: widget.chat?.userId == null
//                                         ? OutlineInputBorder(
//                                             borderRadius: BorderRadius.circular(16),
//                                             borderSide: BorderSide.none,
//                                           )
//                                         : const OutlineInputBorder(borderSide: BorderSide.none),
//                                     enabledBorder: widget.chat?.userId == null
//                                         ? OutlineInputBorder(
//                                             borderRadius: BorderRadius.circular(16),
//                                             borderSide: BorderSide.none,
//                                           )
//                                         : const OutlineInputBorder(borderSide: BorderSide.none),
//                                     hintText: widget.chat?.userId == null
//                                         ? context.localized.itIsImpossible
//                                         : context.localized.writeMessage,
//                                     border: const OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       // borderRadius: BorderRadius.circular(30),
//                                     ),
//                                   ),
//                                   onFieldSubmitted: (value) {
//                                     if (_messageController.text.trim().isNotEmpty) {
//                                       BlocProvider.of<ChatDetailBlocWS>(context).add(
//                                         ChatDetailEventWS.sendMessage(
//                                           text: _messageController.text.trim(),
//                                           partnerId: widget.chat?.userId,
//                                           images: _imagesLink.isNotEmpty ? _imagesLink : null,
//                                         ),
//                                       );

//                                       _messageController.clear();

//                                       _scrollController.animateTo(
//                                         0,
//                                         duration: const Duration(milliseconds: 300),
//                                         curve: Curves.linear,
//                                       );
//                                     }
//                                   },
//                                 ),
//                               ),
//                             ),
//                             if (widget.chat?.userId != null)
//                               BlocConsumer<ImageUploadCubit, ImageUploadState>(
//                                 listener: (context, state) {
//                                   state.maybeWhen(
//                                     loaded: (paths) {
//                                       for (int i = 0; i < paths.length; i++) {
//                                         _imagesLink.add(paths[i].image ?? '');
//                                       }
//                                       BlocProvider.of<ImageUploadCubit>(context).toInitState();
//                                       _images = [];
//                                       setState(() {});
//                                     },
//                                     error: (message) {
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         SnackBar(
//                                           content: Text(message),
//                                         ),
//                                       );
//                                     },
//                                     orElse: () {},
//                                   );
//                                 },
//                                 builder: (context, state) {
//                                   return IconButton(
//                                     onPressed: () {
//                                       log('$_images');
//                                       if (_images.isNotEmpty) {
//                                         BlocProvider.of<ImageUploadCubit>(context).uploadImage(
//                                           images: _images,
//                                         );
//                                       } else {
//                                         if (_messageController.text.trim().isNotEmpty) {
//                                           BlocProvider.of<ChatDetailBlocWS>(context).add(
//                                             ChatDetailEventWS.sendMessage(
//                                               text: _messageController.text.trim(),
//                                               partnerId: widget.chat?.userId,
//                                               images: _imagesLink.isNotEmpty ? _imagesLink : null,
//                                             ),
//                                           );

//                                           _messageController.clear();

//                                           _scrollController.animateTo(
//                                             0,
//                                             duration: const Duration(milliseconds: 300),
//                                             curve: Curves.linear,
//                                           );
//                                         }
//                                       }
//                                     },
//                                     icon: SvgPicture.asset(Assets.icons.chatSend.path),
//                                   );
//                                 },
//                               ),
//                           ],
//                         ),
//                         if ((_imagesLink ?? []).isNotEmpty)
//                           SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 16, bottom: 16),
//                               child: Row(
//                                 children: List.generate((_imagesLink ?? []).length, (index) {
//                                   return Padding(
//                                     padding: const EdgeInsets.only(right: 8.0),
//                                     child: Stack(
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(top: 5, right: 5),
//                                           child: ClipRRect(
//                                             borderRadius: BorderRadius.circular(16),
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 context.router.push(
//                                                   DetailImageRoute(
//                                                     avatarImage: _imagesLink[index],
//                                                     imageFrom: 'chat',
//                                                   ),
//                                                 );
//                                               },
//                                               child: CachedNetworkImage(
//                                                 imageUrl: _imagesLink[index],
//                                                 width: 80,
//                                                 height: 80,
//                                                 fit: BoxFit.cover,
//                                                 progressIndicatorBuilder: ImageUtil.cachedLoadingBuilder,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Positioned(
//                                           top: 0,
//                                           right: 0,
//                                           child: GestureDetector(
//                                             onTap: () {
//                                               _removeImage(index);
//                                               log('$_images');
//                                             },
//                                             child: const CircleAvatar(
//                                               radius: 12,
//                                               backgroundColor: Colors.white,
//                                               child: Icon(Icons.close, size: 16),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }),
//                               ),
//                             ),
//                           )
//                         // Container(
//                         //   height: 50,
//                         //   width: 50,
//                         //   decoration: const BoxDecoration(
//                         //     color: Colors.black,
//                         //   ),
//                         // )
//                         else
//                           Container(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void _removeImage(int index) {
//     setState(() {
//       _imagesLink.removeAt(index);
//     });
//   }
// }

// class MessageBox extends StatelessWidget {
//   const MessageBox({
//     super.key,
//     required this.previousElement,
//     required this.currentElement,
//     required this.nextElement,
//     this.opponentId,
//     required this.myId,
//   });

//   final int myId;
//   final int? opponentId;
//   final MessageDTO? previousElement;
//   final MessageDTO currentElement;
//   final MessageDTO? nextElement;

//   @override
//   Widget build(BuildContext context) {
//     // log('$myId = $opponentId', name: 'chaeck');
//     // log('my type / chat user type => $myUserableType = ${currentElement.chatUserableType}');
//     // myUserableType == currentElement.chatUserableType ? log('${currentElement.chatUserableType}') : log('-----');
//     // log('${currentElement.userType} ${currentElement.text}', name: 'ckdl');

//     final currentIsLocalUser = currentElement.userType == 'partner';
//     // ? (myUserableType == currentElement.chatUserableType)
//     // : false;

//     // final currentIsLocalUser =
//     //     (localeUserId == currentElement.chatUserableId) && (myUserableType == currentElement.chatUserableType);
//     // final currentIsLocalUser = myUserableType == currentElement.chatUserableType;
//     final boxWidth = MediaQuery.sizeOf(context).width * 0.76;
//     // ignore: unused_local_variable
//     final minBoxWidth = MediaQuery.sizeOf(context).width * 0.25;

//     return Row(
//       mainAxisAlignment: currentIsLocalUser ? MainAxisAlignment.end : MainAxisAlignment.start,
//       children: [
//         Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: currentIsLocalUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             if (currentIsLocalUser)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   ConstrainedBox(
//                     constraints: BoxConstraints(
//                       maxWidth: boxWidth,
//                     ),
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                         decoration: BoxDecoration(
//                           color: currentIsLocalUser ? AppColors.mainColor : AppColors.muteGrey,
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(32),
//                             topRight: Radius.circular(32),
//                             bottomLeft: Radius.circular(32),
//                             bottomRight: Radius.circular(4),
//                           ),
//                         ),
//                         margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
//                         child: Column(
//                           children: [
//                             if ((currentElement.text ?? '').isNotEmpty)
//                               TextMessageBodyWidget(
//                                 key: UniqueKey(),
//                                 text: currentElement.text ?? '',
//                                 style: AppTextStyles.body16RegularWhite,
//                                 sentAtStyle: const TextStyle(
//                                   fontSize: 11,
//                                 ),
//                                 linkStyle: const TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w600,
//                                   // height: 20 / 17,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   if (currentElement.images != null)
//                     if (currentElement.images!.isNotEmpty)
//                       Column(
//                         children: List.generate(
//                           currentElement.images!.length,
//                           (index) {
//                             return Padding(
//                               padding: const EdgeInsets.only(bottom: 8, right: 8),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(16),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     context.router.push(
//                                       DetailImageRoute(
//                                         avatarImage: currentElement.images?[index].path,
//                                         imageFrom: 'avatar',
//                                       ),
//                                     );
//                                   },
//                                   child: CachedNetworkImage(
//                                     imageUrl: currentElement.images?[index].path ?? '',
//                                     height: 80,
//                                     width: 80,
//                                     fit: BoxFit.cover,
//                                     progressIndicatorBuilder: ImageUtil.cachedLoadingBuilder,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                 ],
//               )
//             else
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ConstrainedBox(
//                     constraints: BoxConstraints(
//                       maxWidth: boxWidth,
//                     ),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                         decoration: const BoxDecoration(
//                           color: AppColors.muteGrey,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(32),
//                             topRight: Radius.circular(32),
//                             bottomLeft: Radius.circular(4),
//                             bottomRight: Radius.circular(32),
//                           ),
//                         ),
//                         margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                         child: Column(
//                           children: [
//                             TextMessageBodyWidget(
//                               key: UniqueKey(),
//                               text: currentElement.text ?? '',
//                               style: AppTextStyles.body16Regular400,
//                               sentAtStyle: const TextStyle(
//                                 fontSize: 11,
//                               ),
//                               linkStyle: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   if (currentElement.images != null)
//                     if (currentElement.images!.isNotEmpty)
//                       Column(
//                         children: List.generate(
//                           currentElement.images!.length,
//                           (index) {
//                             return Padding(
//                               padding: const EdgeInsets.only(bottom: 8, left: 8),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(16),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     context.router.push(
//                                       DetailImageRoute(
//                                         avatarImage: currentElement.images?[index].path,
//                                         imageFrom: 'avatar',
//                                       ),
//                                     );
//                                   },
//                                   child: CachedNetworkImage(
//                                     imageUrl: currentElement.images?[index].path ?? '',
//                                     height: 80,
//                                     width: 80,
//                                     fit: BoxFit.cover,
//                                     progressIndicatorBuilder: ImageUtil.cachedLoadingBuilder,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                 ],
//               ),
//           ],
//         ),
//         if (currentElement.messageStatus == MessageStatus.loading) ...[
//           const SizedBox.square(
//             dimension: 10,
//             child: CupertinoActivityIndicator(),
//           ),
//           const SizedBox(width: 16),
//         ],
//         if (currentElement.messageStatus == MessageStatus.error) ...[
//           IconButton(
//             onPressed: () {
//               final List<String> imagesLink = [];
//               for (int i = 0; i < (currentElement.images ?? []).length; i++) {
//                 imagesLink.add(currentElement.images?[i].image ?? '');
//               }
//               BlocProvider.of<ChatDetailBlocWS>(context).add(
//                 ChatDetailEventWS.sendMessage(
//                   text: currentElement.text ?? '',
//                   partnerId: opponentId,
//                   images: imagesLink.isNotEmpty ? imagesLink : null,
//                 ),
//               );
//             },
//             splashRadius: 12,
//             icon: const Icon(
//               Icons.error,
//               color: Colors.red,
//             ),
//           ),
//           const SizedBox(width: 16),
//         ],
//       ],
//     );
//   }
// }

// class GroupHeaderDate extends StatelessWidget {
//   final DateTime date;

//   const GroupHeaderDate({required this.date, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         decoration: const BoxDecoration(
//           color: AppColors.buttonGrey,
//           borderRadius: BorderRadius.all(Radius.circular(16)),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//         child: Text(
//           // 'date',
//           date.chatDetailTimeHeader(context),
//           style: AppTextStyles.body12Regular,
//         ),
//       ),
//     );
//   }
// }
