// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
// import 'package:ikidz/src/core/presentation/widgets/bottomsheet/custom_drag_handle.dart';
// import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
// import 'package:ikidz/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
// import 'package:ikidz/src/core/theme/resources.dart';
// import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
// import 'package:ikidz/src/feature/profile/bloc/create_address_cubit.dart';
// import 'package:ikidz/src/feature/profile/models/request/address_payload.dart';

// class AddAddressBottomSheetWidget extends StatefulWidget {
//   const AddAddressBottomSheetWidget({super.key, this.chosenCity});
//   final String? chosenCity;

//   @override
//   _AddAddressBottomSheetWidgetState createState() => _AddAddressBottomSheetWidgetState();

//   static Future<String?> show(
//     BuildContext context, {
//     String? chosenCity,
//   }) =>
//       showModalBottomSheet(
//         context: context,
//         isScrollControlled: true, // Make sure the bottom sheet adjusts to the keyboard
//         builder: (context) => BlocProvider(
//           create: (context) => CreateAddressCubit(
//             repository: context.repository.profileRepository,
//           ),
//           child: AddAddressBottomSheetWidget(
//             chosenCity: chosenCity,
//           ),
//         ),
//       );
// }

// class _AddAddressBottomSheetWidgetState extends State<AddAddressBottomSheetWidget> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   List<String> days = [];
//   List<String> daysName = [];

//   final MaskTextInputFormatter maskFormatterDate = MaskTextInputFormatter(mask: '##:##-##:##');

//   TextEditingController addressController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController timeController = TextEditingController();

//   List<String> russianDays = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'];
//   List<String> ruDays = ['пн', 'вт', 'ср', 'чт', 'пт', 'сб', 'вс'];

//   List<String> kazakhstanDays = ['Дс', 'Сс', 'Ср', 'Бс', 'Жм', 'Сб', 'Жк'];
//   List<String> kzDays = ['дс', 'сс', 'ср', 'бс', 'жм', 'сб', 'жк'];

//   final ValueNotifier<String?> _addressError = ValueNotifier(null);
//   RichText _getAstericsHint(String content) => RichText(
//         text: TextSpan(
//           text: content,
//           style: AppTextStyles.body14RegularText,
//           children: const [
//             TextSpan(
//               text: ' *',
//               style: TextStyle(
//                 color: Colors.red,
//               ),
//             ),
//           ],
//         ),
//       );
//   final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(mask: '+7(###) ###-##-##');

//   @override
//   Widget build(BuildContext context) {
//     // Detect the keyboard height
//     final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return AnimatedPadding(
//           duration: const Duration(milliseconds: 200), // Smooth transition
//           padding: EdgeInsets.only(
//             bottom: keyboardHeight,
//           ), // Add bottom padding for keyboard
//           child: DraggableScrollableSheet(
//             expand: false,
//             maxChildSize: 0.95,
//             minChildSize: 0.5,
//             initialChildSize: keyboardHeight > 0 ? 0.85 : 0.68, // Adjust size when keyboard is visible
//             builder: (context, scrollController) => SingleChildScrollView(
//               controller: scrollController,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Align(child: CustomDragHandle()),
//                   const Gap(16),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           context.localized.addAddress,
//                           style: AppTextStyles.title24Bold,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             context.router.maybePop();
//                           },
//                           child: SvgPicture.asset(Assets.icons.closeIcon1.path),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Gap(22),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _getAstericsHint(
//                           context.localized.addresses,
//                         ),
//                         const Gap(12),
//                         CustomValidatorTextfield(
//                           controller: addressController,
//                           hintText: context.localized.enterAddress,
//                           onChanged: (value) {},
//                           validator: (String? value) {
//                             return null;
//                           },
//                           valueListenable: _addressError,
//                         ),
//                         const Gap(16),
//                         Text(
//                           context.localized.phoneNumber,
//                           style: AppTextStyles.body14RegularText,
//                         ),
//                         const Gap(12),
//                         CustomValidatorTextfield(
//                           controller: phoneController,
//                           hintText: context.localized.enterYourPhoneNumber,
//                           onChanged: (value) {},
//                           keyboardType: TextInputType.number,
//                           inputFormatters: [maskFormatter],
//                           validator: (String? value) {
//                             return null;
//                           },
//                           valueListenable: _addressError,
//                         ),
//                         const Gap(16),
//                         _getAstericsHint(context.localized.workSchedule),
//                         const Gap(12),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: List.generate(
//                             7,
//                             (index) => Container(
//                               decoration: BoxDecoration(
//                                 color: days.contains(russianDays[index]) ? AppColors.mainColor : Colors.white,
//                                 border: Border.all(
//                                   color: days.contains(russianDays[index]) ? AppColors.mainColor : AppColors.lineGrey,
//                                 ),
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                               child: Material(
//                                 color: Colors.transparent,
//                                 child: InkWell(
//                                   onTap: () {
//                                     if (days.contains(russianDays[index])) {
//                                       days.remove(russianDays[index]);
//                                       daysName.remove(ruDays[index]);
//                                     } else {
//                                       days.add(russianDays[index]);
//                                       daysName.add(ruDays[index]);
//                                     }
//                                     setState(() {});
//                                   },
//                                   borderRadius: BorderRadius.circular(16),
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       vertical: 17,
//                                       horizontal: 13,
//                                     ),
//                                     child: Text(
//                                       russianDays[index],
//                                       style: days.contains(russianDays[index])
//                                           ? AppTextStyles.body12RegularWhite
//                                           : AppTextStyles.body12RegularText,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const Gap(16),
//                         _getAstericsHint(
//                           context.localized.time,
//                         ),
//                         const Gap(12),
//                         CustomValidatorTextfield(
//                           controller: timeController,
//                           hintText: context.localized.enterTime,
//                           inputFormatters: [maskFormatterDate],
//                           onChanged: (value) {},
//                           keyboardType: const TextInputType.numberWithOptions(),
//                           validator: (String? value) {
//                             return null;
//                           },
//                           valueListenable: _addressError,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Gap(22),
//                   BlocListener<CreateAddressCubit, CreateAddressState>(
//                     listener: (context, state) {
//                       state.whenOrNull(
//                         loading: () => context.loaderOverlay.show(),
//                         error: (message) {
//                           context.loaderOverlay.hide();
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text(message),
//                             ),
//                           );
//                         },
//                         loaded: (message) {
//                           context.loaderOverlay.hide();
//                           context.router.maybePop();
//                         },
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       child: CustomButton(
//                         onPressed: () {
//                           final AddressPayload addressPayload = AddressPayload(
//                             address: addressController.text,
//                             phone: phoneController.text,
//                             workTimes: daysName,
//                             time: timeController.text,
//                           );
//                           BlocProvider.of<CreateAddressCubit>(context).createAddress(
//                             addressPayload: addressPayload,
//                           );
//                           // Return the selected city when "Save" is pressed
//                         },
//                         style: null,
//                         text: context.localized.save,
//                         child: null,
//                       ),
//                     ),
//                   ),
//                   const Gap(22),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
