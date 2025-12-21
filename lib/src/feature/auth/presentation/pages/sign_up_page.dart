// // ignore_for_file: deprecated_member_use

// import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
// import 'package:ikidz/src/feature/app/presentation/widgets/custom_dropdown.dart';
// import 'package:ikidz/src/feature/app/presentation/widgets/app_text.dart';
// import 'package:ikidz/src/feature/app/router/app_router.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
// import 'package:ikidz/src/core/presentation/widgets/textfields/custom_textfield.dart';
// import 'package:ikidz/src/core/theme/resources.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// @RoutePage()
// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();

//   // @override
//   // Widget wrappedRoute(BuildContext context) {
//   //   return MultiBlocProvider(
//   //     providers: [
//   //       BlocProvider(
//   //         create: (context) =>
//   //             RegisterCubit(repository: context.repository.authRepository),
//   //       ),
//   //     ],
//   //     child: this,
//   //   );
//   // }
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _parentPhoneController = TextEditingController();
//   final TextEditingController _iinController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _passwordRepeatController =
//       TextEditingController();

//   final ValueNotifier<String?> _passwordError = ValueNotifier(null);
//   final ValueNotifier<String?> _passwordRepeatError = ValueNotifier(null);
//   final ValueNotifier<bool> _obscureText = ValueNotifier(true);
//   final ValueNotifier<bool> _obscureText2 = ValueNotifier(true);
//   final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

//   MaskTextInputFormatter maskFormatter =
//       MaskTextInputFormatter(mask: '+7(###) ###-##-##');

//   MaskTextInputFormatter iinMaskFormatter =
//       MaskTextInputFormatter(mask: '############');

//   final phoneKey = GlobalKey();
//   final passwordKey = GlobalKey();
//   final passwordRepKey = GlobalKey();

//   String selectedRole = 'Менеджер';
//   int selectedTeam = 1;
//   String selectedSubTeam = 'TIM1';
//   String selectedCity = 'Алматы';

//   void _scrollToWidget(GlobalKey key) {
//     final context = key.currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _passwordRepeatController.dispose();
//     _passwordError.dispose();
//     _passwordRepeatError.dispose();
//     _allowTapButton.dispose();
//     super.dispose();
//   }

//   bool checkAllowTapButton() {
//     return true;
//     // return _nameController.text.isNotEmpty &&
//     //     _dateController.text.isNotEmpty &&
//     //     userNameController.text.isNotEmpty &&
//     //     maskFormatter.getUnmaskedText().length == 10 &&
//     //     passwordController.text.isNotEmpty &&
//     //     passwordRepeatController.text.isNotEmpty &&
//     //     passwordRepeatController.text == passwordController.text;
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     FocusScope.of(context).addListener(() {
//       setState(() {});
//     });
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LoaderOverlay(
//       overlayColor: AppColors.barrierColor,
//       overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
//       child: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: Scaffold(
//           backgroundColor: AppColors.bg,
//           body: SafeArea(
//             child: Form(
//               key: _formKey,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Gap(16),
//                       title('Добро пожаловать!'),
//                       const Gap(12),
//                       subTitle(
//                           'Если вы впервые у нас, просим вас создать новый аккаунт'),
//                       const Gap(24),

//                       // ФИО
//                       titleTextField('ФИО'),
//                       const Gap(6),
//                       CustomTextField(
//                         height: 48,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         controller: _nameController,
//                         fillColor: Colors.white,
//                         hintText: 'Введите фамилию и имя',
//                         hintStyle: AppTextStyles.fs16w400.copyWith(
//                             color: AppColors.grey3, letterSpacing: -0.4),
//                         textStyle: AppTextStyles.fs16w400
//                             .copyWith(letterSpacing: -0.4),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none),
//                         onChanged: (v) {
//                           checkAllowTapButton();
//                           setState(() {});
//                         },
//                       ),
//                       const Gap(14),

//                       // Номер телефона
//                       titleTextField('Номер телефона'),
//                       const Gap(6),
//                       CustomTextField(
//                         height: 48,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         controller: _phoneController,
//                         inputFormatters: [maskFormatter],
//                         hintText: 'Ваш номер телефона',
//                         hintStyle: AppTextStyles.fs16w400.copyWith(
//                             color: AppColors.grey3, letterSpacing: -0.4),
//                         keyboardType: TextInputType.number,
//                         fillColor: Colors.white,
//                         textStyle: AppTextStyles.fs16w400
//                             .copyWith(letterSpacing: -0.4),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none),
//                         onChanged: (v) {
//                           checkAllowTapButton();
//                           setState(() {});
//                         },
//                       ),
//                       const Gap(14),

//                       // ИНН
//                       titleTextField('ИНН'),
//                       const Gap(6),
//                       CustomTextField(
//                         height: 48,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         controller: _iinController,
//                         inputFormatters: [iinMaskFormatter],
//                         hintText: 'Ваш ИИН',
//                         hintStyle: AppTextStyles.fs16w400.copyWith(
//                             color: AppColors.grey3, letterSpacing: -0.4),
//                         keyboardType: TextInputType.number,
//                         fillColor: Colors.white,
//                         textStyle: AppTextStyles.fs16w400
//                             .copyWith(letterSpacing: -0.4),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none),
//                         onChanged: (v) {
//                           checkAllowTapButton();
//                           setState(() {});
//                         },
//                       ),
//                       const Gap(14),

//                       // Выберите роль
//                       titleTextField('Выберите роль'),
//                       const Gap(6),
//                       CustomDropdown<String>(
//                         items: _role,
//                         hint: '',
//                         value: selectedRole,
//                         selectedWidget: Text(
//                           selectedRole,
//                           style: AppTextStyles.fs16w400,
//                         ),
//                         menuItems: _role
//                             .map(
//                               (String item) => DropdownMenuItem<String>(
//                                 value: item,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       item,
//                                       style: AppTextStyles.fs16w400,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     if (selectedRole == item)
//                                       const Icon(Icons.check)
//                                   ],
//                                 ),
//                               ),
//                             )
//                             .toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             selectedRole = value ?? '';
//                           });
//                         },
//                       ),
//                       const Gap(14),

//                       // Выберите команду
//                       titleTextField('Выберите команду'),
//                       const Gap(6),
//                       Row(
//                         children: [
//                           _chooseTeamWidget(
//                             title: 'TIM',
//                             selected: selectedTeam == 1,
//                             onTap: () {
//                               selectedTeam = 1;
//                               selectedSubTeam = 'TIM1';
//                               setState(() {});
//                             },
//                           ),
//                           const Gap(16),
//                           _chooseTeamWidget(
//                             title: 'WEN',
//                             selected: selectedTeam == 2,
//                             onTap: () {
//                               selectedTeam = 2;
//                               selectedSubTeam = 'WEN1';
//                               setState(() {});
//                             },
//                           ),
//                         ],
//                       ),
//                       const Gap(14),

//                       // Выберите подкоманду
//                       titleTextField('Выберите подкоманду'),
//                       const Gap(6),
//                       CustomDropdown<String>(
//                         items: selectedTeam == 1 ? _timTeam : _wenTeam,
//                         hint: '',
//                         value: selectedSubTeam,
//                         selectedWidget: Text(
//                           selectedSubTeam,
//                           style: AppTextStyles.fs16w400,
//                         ),
//                         menuItems: (selectedTeam == 1 ? _timTeam : _wenTeam)
//                             .map(
//                               (String item) => DropdownMenuItem<String>(
//                                 value: item,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       item,
//                                       style: AppTextStyles.fs16w400,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     if (selectedSubTeam == item)
//                                       const Icon(Icons.check)
//                                   ],
//                                 ),
//                               ),
//                             )
//                             .toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             selectedSubTeam = value ?? '';
//                           });
//                         },
//                       ),
//                       const Gap(14),

//                       // Город
//                       titleTextField('Город'),
//                       const Gap(6),
//                       CustomDropdown<String>(
//                         items: _city,
//                         hint: '',
//                         value: selectedCity,
//                         selectedWidget: Text(
//                           selectedCity,
//                           style: AppTextStyles.fs16w400,
//                         ),
//                         menuItems: _city
//                             .map(
//                               (String item) => DropdownMenuItem<String>(
//                                 value: item,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       item,
//                                       style: AppTextStyles.fs16w400,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     if (selectedCity == item)
//                                       const Icon(Icons.check)
//                                   ],
//                                 ),
//                               ),
//                             )
//                             .toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             selectedCity = value ?? '';
//                           });
//                         },
//                       ),
//                       const Gap(14),

//                       // Адрес проживания
//                       titleTextField('Адрес проживания'),
//                       const Gap(6),
//                       CustomTextField(
//                         height: 48,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         controller: _addressController,
//                         hintText: 'Ваш адрес',
//                         hintStyle: AppTextStyles.fs16w400.copyWith(
//                             color: AppColors.grey3, letterSpacing: -0.4),
//                         fillColor: Colors.white,
//                         textStyle: AppTextStyles.fs16w400
//                             .copyWith(letterSpacing: -0.4),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none),
//                         onChanged: (v) {
//                           checkAllowTapButton();
//                           setState(() {});
//                         },
//                       ),
//                       const Gap(14),

//                       // Номер телефон родителя
//                       titleTextField('Номер телефон родителя'),
//                       const Gap(6),
//                       CustomTextField(
//                         height: 48,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         controller: _parentPhoneController,
//                         inputFormatters: [maskFormatter],
//                         hintText: 'Введите номер телефон родителя',
//                         hintStyle: AppTextStyles.fs16w400.copyWith(
//                             color: AppColors.grey3, letterSpacing: -0.4),
//                         keyboardType: TextInputType.number,
//                         fillColor: Colors.white,
//                         textStyle: AppTextStyles.fs16w400
//                             .copyWith(letterSpacing: -0.4),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide.none),
//                         onChanged: (v) {
//                           checkAllowTapButton();
//                           setState(() {});
//                         },
//                       ),
//                       const Gap(14),

//                       // Пароль
//                       titleTextField('Пароль'),
//                       const Gap(6),
//                       ValueListenableBuilder(
//                         valueListenable: _obscureText,
//                         builder: (context, value, child) {
//                           return CustomTextField(
//                             height: 48,
//                             contentPadding: const EdgeInsets.only(left: 10),
//                             controller: _passwordController,
//                             obscureText: _obscureText,
//                             hintText: 'Придумайте пароль',
//                             hintStyle: AppTextStyles.fs16w400.copyWith(
//                                 color: AppColors.grey3, letterSpacing: -0.4),
//                             fillColor: Colors.white,
//                             textStyle: AppTextStyles.fs16w400
//                                 .copyWith(letterSpacing: -0.4),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: BorderSide.none),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: BorderSide.none),
//                             onTap: () {
//                               _scrollToWidget(passwordKey);
//                             },
//                             onChanged: (value) {
//                               checkAllowTapButton();
//                               setState(() {});
//                             },
//                           );
//                         },
//                       ),
//                       const Gap(14),

//                       // Повторить  пароль
//                       titleTextField('Повторить  пароль'),
//                       const Gap(6),
//                       ValueListenableBuilder(
//                         valueListenable: _obscureText2,
//                         builder: (context, value, child) {
//                           return CustomTextField(
//                             height: 48,
//                             contentPadding: const EdgeInsets.only(left: 10),
//                             controller: _passwordRepeatController,
//                             obscureText: _obscureText2,
//                             hintText: 'Повторить  пароль',
//                             hintStyle: AppTextStyles.fs16w400.copyWith(
//                                 color: AppColors.grey3, letterSpacing: -0.4),
//                             fillColor: Colors.white,
//                             textStyle: AppTextStyles.fs16w400
//                                 .copyWith(letterSpacing: -0.4),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: BorderSide.none),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: BorderSide.none),
//                             onTap: () {
//                               _scrollToWidget(passwordKey);
//                             },
//                             onChanged: (value) {
//                               checkAllowTapButton();
//                               setState(() {});
//                             },
//                           );
//                         },
//                       ),
//                       const Gap(19),

//                       // Кнопка "Далее"
//                       CustomButton(
//                         onPressed: () {
//                           context.router.push(SmsRoute(
//                               phone: '+7 (777) 777 77 77', type: 'register'));
//                         },
//                         style: CustomButtonStyles.mainButtonStyle(context),
//                         text: 'Далее',
//                         child: null,
//                       ),
//                       const Gap(16),

//                       // У вас есть аккаунт? Войти
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('У вас есть аккаунт?',
//                               style: AppTextStyles.fs16w400.copyWith(
//                                   color: AppColors.baseDay700,
//                                   letterSpacing: -0.4)),
//                           GestureDetector(
//                             onTap: () =>
//                                 context.router.push(const LoginRoute()),
//                             child: Text('  Войти',
//                                 style: AppTextStyles.fs16w600.copyWith(
//                                     color: AppColors.primary,
//                                     letterSpacing: -0.08)),
//                           ),
//                         ],
//                       ),
//                       const Gap(30)
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget _chooseTeamWidget(
//     {required String title, void Function()? onTap, required bool selected}) {
//   return Expanded(
//     child: GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 45,
//         padding: const EdgeInsets.only(left: 10),
//         alignment: AlignmentDirectional.centerStart,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             border: selected
//                 ? Border.all(color: AppColors.primary, width: 1)
//                 : Border.all(color: Colors.white, width: 1)),
//         child: Text(title,
//             style: AppTextStyles.fs16w400.copyWith(letterSpacing: -0.08)),
//       ),
//     ),
//   );
// }

// List<String> _role = ['Старший менеджер', 'Конвейсер', 'Менеджер'];
// List<String> _timTeam = ['TIM1', 'TIM2', 'TIM3'];
// List<String> _wenTeam = ['WEN1', 'WEN2', 'WEN3'];
// List<String> _city = ['Алматы', 'Астана', 'Шымкент', 'Тараз'];
