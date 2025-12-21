// import 'package:ikidz/src/core/gen/assets.gen.dart';
// import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
// import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
// import 'package:ikidz/src/core/theme/resources.dart';
// import 'package:ikidz/src/feature/app/bloc/app_bloc.dart';
// import 'package:ikidz/src/feature/app/router/app_router.dart';
// import 'package:ikidz/src/feature/auth/models/response/user_dto.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gap/gap.dart';
// import 'package:loader_overlay/loader_overlay.dart';

// @RoutePage()
// class SuccessRegisterPage extends StatefulWidget {
//   const SuccessRegisterPage({super.key});

//   @override
//   State<SuccessRegisterPage> createState() => _SuccessRegisterPageState();
// }

// class _SuccessRegisterPageState extends State<SuccessRegisterPage> {
//   int state = 0;

//   @override
//   Widget build(BuildContext context) {
//     return LoaderOverlay(
//       overlayColor: AppColors.barrierColor,
//       overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
//       child: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: AppColors.bg,
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,
//           floatingActionButton: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: CustomButton(
//               onPressed: () {
//                 if (state == 0) {
//                 state = 1;

//                 }else if (state == 1) {
//                   // BlocProvider.of<AppBloc>(context)
//                   //             .add(const AppEvent.logining(user: UserDTO()));
//                           context.router.replaceAll([LauncherRoute()]);
//                 }
//                 setState(() {});
//               },
//               style: CustomButtonStyles.mainButtonStyle(context),
//               text: state == 0 ? 'Обновить статус' : 'На главную',
//               child: null,
//             ),
//           ),
//           body: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     Assets.icons.illustration.path,
//                     height: 118,
//                   ),
//                   const Gap(12),
//                    Text( state == 0 ? 'Заявка отправлена на одобрение': 'Вам успешно дали одобрение',
//                       textAlign: TextAlign.center,
//                       style: AppTextStyles.fs28w600),
//                   const Gap(24),
//                   Text(
//                     state == 0 ?
//                       'Ваш профиль создан. Доступ откроется после проверки администратором.' : 'Вы можете зайти в свой профиль',
//                       textAlign: TextAlign.center,
//                       style: AppTextStyles.fs14w400.copyWith(
//                           color: AppColors.baseDay700, letterSpacing: -0.08)),
//                   const Gap(50)
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
