// import 'dart:developer';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:intl/intl.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:ikidz/src/core/constant/constants.dart';
// import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
// import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
// import 'package:ikidz/src/core/presentation/widgets/textfields/custom_textfield_clear_icon.dart';
// import 'package:ikidz/src/core/theme/resources.dart';

// import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
// import 'package:ikidz/src/core/utils/extensions/string_extension.dart';
// import 'package:ikidz/src/feature/app/presentation/widgets/custom_appbar_widget.dart';
// import 'package:ikidz/src/feature/app/presentation/widgets/empty_widget.dart';
// import 'package:ikidz/src/feature/app/presentation/widgets/field_debouncer.dart';
// import 'package:ikidz/src/feature/app/router/app_router.dart';
// import 'package:ikidz/src/feature/auth/models/user_dto.dart';
// import 'package:ikidz/src/feature/chat/bloc/chat_list_cubit.dart';

// @RoutePage()
// class ChatsPage extends StatefulWidget implements AutoRouteWrapper {
//   const ChatsPage({super.key});

//   @override
//   _ChatsPageState createState() => _ChatsPageState();

//   @override
//   Widget wrappedRoute(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => ChatListCubit(
//             repository: context.repository.chatRepository,
//           ),
//         ),
//       ],
//       child: this,
//     );
//   }
// }

// class _ChatsPageState extends State<ChatsPage> {
//   final RefreshController _refreshController = RefreshController();
//   final ScrollController _scrollController = ScrollController();
//   final TextEditingController searchController = TextEditingController();
//   final FieldDebouncer debouncer = FieldDebouncer(milliseconds: 500);

//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<ChatListCubit>(context).getChatList();
//   }

//   @override
//   void dispose() {
//     _refreshController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   // void _completeRefreshControllers() {
//   //   if (_refreshController.isLoading) {
//   //     _refreshController.loadComplete();
//   //   }

//   //   if (_refreshController.isRefresh) {
//   //     _refreshController.refreshCompleted();
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return LoaderOverlay(
//       child: Scaffold(
//         appBar: CustomAppBar(
//           quarterTurns: 0,
//           title: context.localized.chat,
//         ),
//         body: BlocConsumer<ChatListCubit, ChatListState>(
//           listener: (context, state) {
//             state.maybeWhen(
//               error: (message) {
//                 context.loaderOverlay.hide();
//                 Toaster.showErrorTopShortToast(context, message);
//                 // _completeRefreshControllers();
//               },
//               loading: () {
//                 // context.loaderOverlay.show();
//                 // _refreshController.resetNoData();
//               },
//               orElse: () {
//                 context.loaderOverlay.hide();
//                 // _completeRefreshControllers();
//               },
//             );
//           },
//           builder: (context, state) {
//             return state.maybeWhen(
//               orElse: () => CustomScrollView(
//                 slivers: [
//                   // search bar
//                   SliverToBoxAdapter(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: AppColors.muteGrey,
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: TextFormField(
//                             controller: searchController,
//                             decoration: InputDecoration(
//                               contentPadding: EdgeInsets.zero,
//                               isCollapsed: true,
//                               prefixIcon: Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 12),
//                                 child: SvgPicture.asset(
//                                   Assets.icons.icSearch.path,
//                                 ),
//                               ),
//                               hintText: context.localized.search,
//                               hintStyle: AppTextStyles.body16Medium.copyWith(color: AppColors.greyText),
//                               border: InputBorder.none,
//                               enabledBorder: InputBorder.none,
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: searchController.text.isEmpty ? Colors.transparent : AppColors.text,
//                                   width: 0.8,
//                                 ),
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                               suffixIcon: searchController.text.isEmpty
//                                   ? null
//                                   : CustomTextfieldClearIcon(
//                                       onTap: () {
//                                         searchController.clear();
//                                         setState(() {});
//                                       },
//                                     ),
//                               suffixIconConstraints: const BoxConstraints(maxHeight: 24, maxWidth: 36),
//                             ),
//                             style: const TextStyle(
//                               color: Colors.black,
//                             ),
//                             textAlignVertical: TextAlignVertical.center,
//                             onTap: () {},
//                             onChanged: (value) {
//                               final trimmedValue = value.trim();
//                               setState(() {});
//                               if (trimmedValue.isEmpty) {
//                                 log('Trimmed value is empty, ignoring search');
//                                 return;
//                               }

//                               log('SEARCHVALUE::::::$trimmedValue');

//                               debouncer.run(() {
//                                 BlocProvider.of<ChatListCubit>(context).getChatList(search: trimmedValue);
//                               });
//                             },
//                             onFieldSubmitted: (value) {
//                               if (value.isNotEmpty) {}
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SliverToBoxAdapter(
//                     child: Gap(16),
//                   ),
//                   const SliverToBoxAdapter(
//                     child: Center(child: CircularProgressIndicator.adaptive()),
//                   ),
//                 ],
//               ),
//               loaded: (chat) => CustomScrollView(
//                 slivers: [
//                   // search bar
//                   SliverToBoxAdapter(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: AppColors.muteGrey,
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: TextFormField(
//                             controller: searchController,
//                             decoration: InputDecoration(
//                               contentPadding: EdgeInsets.zero,
//                               isCollapsed: true,
//                               prefixIcon: Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 12),
//                                 child: SvgPicture.asset(
//                                   Assets.icons.icSearch.path,
//                                 ),
//                               ),
//                               hintText: context.localized.search,
//                               hintStyle: AppTextStyles.body16Medium.copyWith(color: AppColors.greyText),
//                               border: InputBorder.none,
//                               enabledBorder: InputBorder.none,
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: searchController.text.isEmpty ? Colors.transparent : AppColors.text,
//                                   width: 0.8,
//                                 ),
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                               suffixIcon: searchController.text.isEmpty
//                                   ? null
//                                   : CustomTextfieldClearIcon(
//                                       onTap: () {
//                                         searchController.clear();
//                                         setState(() {});
//                                       },
//                                     ),
//                               suffixIconConstraints: const BoxConstraints(maxHeight: 24, maxWidth: 36),
//                             ),
//                             style: const TextStyle(
//                               color: Colors.black,
//                             ),
//                             textAlignVertical: TextAlignVertical.center,
//                             onTap: () {},
//                             onChanged: (value) {
//                               final trimmedValue = value.trim();
//                               setState(() {});
//                               if (trimmedValue.isEmpty) {
//                                 debouncer.run(() {
//                                   BlocProvider.of<ChatListCubit>(context).getChatList();
//                                 });
//                                 log('Trimmed value is empty, ignoring search');
//                                 return;
//                               }

//                               log('SEARCHVALUE::::::$trimmedValue');

//                               debouncer.run(() {
//                                 BlocProvider.of<ChatListCubit>(context).getChatList(search: trimmedValue);
//                               });
//                             },
//                             onFieldSubmitted: (value) {
//                               if (value.isNotEmpty) {}
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SliverToBoxAdapter(
//                     child: Gap(16),
//                   ),
//                   if (chat.isNotEmpty)
//                     SliverList.builder(
//                       itemCount: chat.length,
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () {
//                             final UserDTO? user = context.repository.authRepository.user;
//                             log('${user?.id}', name: 'userIDDD');
//                             log('${chat[index]}', name: 'chat');
//                             context.router
//                                 .push(
//                               ChatsDetailRoute(
//                                 localeUserId: user?.id ?? 0,
//                                 chat: chat[index],
//                               ),
//                             )
//                                 .whenComplete(() {
//                               if (!context.mounted) return;
//                               BlocProvider.of<ChatListCubit>(context).getChatList();
//                             });
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   // crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     ClipRRect(
//                                       borderRadius: BorderRadius.circular(30),
//                                       child: chat[index].avatar != null
//                                           ? Image.network(
//                                               chat[index].avatar ?? NO_IMAGE_AVAILABLE,
//                                               fit: BoxFit.cover,
//                                               // chat[index].avatar ?? NO_IMAGE_AVAILABLE,
//                                               width: 52,
//                                               height: 52,
//                                             )
//                                           : const SizedBox(
//                                               width: 52,
//                                               height: 52,
//                                               child: CircleAvatar(
//                                                 backgroundColor: Color(0xFFD9D9D9),
//                                                 child: Icon(
//                                                   Icons.person,
//                                                   color: Colors.white,
//                                                   size: 30,
//                                                 ),
//                                               ),
//                                             ),
//                                     ),
//                                     const Gap(10),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           chat[index].userId == null
//                                               ? context.localized.deletedProfile
//                                               : chat[index].name ?? '',
//                                           style: AppTextStyles.body16Medium.copyWith(color: AppColors.text),
//                                         ),
//                                         const Gap(4),
//                                         Text(
//                                           chat[index].latestMessage ?? '',
//                                           style: AppTextStyles.body12W500Green.copyWith(color: AppColors.greyText),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 Column(
//                                   children: [
//                                     Text(
//                                       DateFormat('HH:mm')
//                                           .format(chat[index].createdAt ?? DateTime.now())
//                                           .monthToUpperCase(),
//                                       style: AppTextStyles.body12W500Green.copyWith(color: AppColors.greyText),
//                                     ),
//                                     const Gap(8),
//                                     if (chat[index].unreadCount == 0 || chat[index].userId == null)
//                                       Container()
//                                     else
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           color: AppColors.mutePink,
//                                           borderRadius: BorderRadius.circular(8),
//                                         ),
//                                         padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//                                         child: Text(
//                                           chat[index].unreadCount.toString(),
//                                           style: AppTextStyles.body12W500Green.copyWith(color: AppColors.mainColor),
//                                         ),
//                                       ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       // separatorBuilder: (context, index) => const Gap(20),
//                     )
//                   else
//                     SliverToBoxAdapter(
//                       child: EmptyWidget(
//                         title: context.localized.nothingWasFound,
//                         image: Assets.images.png.emptyChat.path,
//                       ),
//                     ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
