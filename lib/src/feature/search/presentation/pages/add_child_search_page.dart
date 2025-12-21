import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/textfields/custom_textfield.dart';
import 'package:ikidz/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:intl/intl.dart';

@RoutePage()
class AddChildSearchPage extends StatefulWidget {
  const AddChildSearchPage({super.key});

  @override
  State<AddChildSearchPage> createState() => _AddChildSearchPageState();
}

class _AddChildSearchPageState extends State<AddChildSearchPage> {
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

  final TextEditingController nameController = TextEditingController();

  int page = 0;
  DateTime? _selectedDate;
  bool _showDate = false;
  String? selectedGender;

  void checkAllowTapButton() {
    _allowTapButton.value = nameController.text.isNotEmpty &&
        selectedGender != null &&
        _selectedDate != null;
  }

  @override
  void dispose() {
    _allowTapButton.dispose();
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
     final genders = ['Мужской', 'Женский'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: TextButton.icon(
          onPressed: () {
            context.router.maybePop();
          },
          label: SvgPicture.asset(
            Assets.icons.backArrow.path,
            color: AppColors.black,
            height: 25,
          ),
        ),
        title: Text(
          'Добавить ребенка',
          style: AppTextStyles.title20BoldW600
              .copyWith(color: AppColors.tabActive),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  // Контент

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(16),
                      Text(
                        'Фамилия и имя',
                        style: AppTextStyles.fs13w500
                            .copyWith(color: AppColors.text63636366),
                      ),
                      const Gap(6),
                      CustomTextField(
                        fillColor: AppColors.inputTextFildEAECED,
                        height: 52,
                        width: double.infinity,
                        hintText: 'Введите фамилию и имя',
                        controller: nameController,
                        onChanged: (value) {
                          checkAllowTapButton();
                        },
                      ),
                      const Gap(12),
                      Text(
                        'Дата рождения',
                        style: AppTextStyles.fs13w500.copyWith(
                          color: AppColors.text63636366,
                        ),
                      ),
                      const Gap(6),
                      CustomValidatorTextfield(
                        fillColor: AppColors.inputTextFildEAECED,
                        controller: TextEditingController(
                          text: _selectedDate != null
                              ? DateFormat('dd.MM.yyyy').format(_selectedDate!)
                              : '',
                        ),
                        valueListenable: ValueNotifier(null),
                        hintText: 'Выберите дату рождения',
                        readOnly: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: SvgPicture.asset(
                            Assets.icons.vector.path,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _showDate = !_showDate;
                          });
                        },
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.deferToChild,
                        onTap: () {
                          if (_showDate && _selectedDate != null) {
                            final now = DateTime.now();
                            final date = _selectedDate!;

                            setState(() {
                              _showDate = false;
                            });
                          }
                        },
                        child: Column(
                          children: [
                            if (_showDate)
                              Column(
                                children: [
                                  const Gap(10),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: const Color(0xFFEAECED),
                                    ),
                                    child: SizedBox(
                                      height: 200,
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        initialDateTime:
                                            _selectedDate ?? DateTime(2003),
                                        minimumDate: DateTime(1900),
                                        maximumDate: DateTime.now(),
                                        dateOrder: DatePickerDateOrder.dmy,
                                        onDateTimeChanged: (date) {
                                          _selectedDate = date;
                                          checkAllowTapButton();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      const Gap(12),
                      Text(
                        'Пол ребенка',
                        style: AppTextStyles.fs13w500.copyWith(
                          color: AppColors.text63636366,
                        ),
                      ),
                      const Gap(6),
                      Row(
                        children: genders.map((gender) {
                          final isSelected = selectedGender == gender;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = gender;
                                  checkAllowTapButton();
                                });
                              },
                              child: Container(
                                height: 52,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                margin: const EdgeInsets.only(right: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.inputTextFildEAECED,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      gender,
                                      style: AppTextStyles.body16Regular400
                                          .copyWith(
                                        color: isSelected
                                            ? AppColors.black000100
                                            : AppColors.text8E8E93,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    SvgPicture.asset(
                                      isSelected
                                          ? Assets.icons.genderSelected.path
                                          : Assets
                                              .icons.genferNotSeleceted.path,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                     
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const Gap(12),
                  ValueListenableBuilder(
                    valueListenable: _allowTapButton,
                    builder: (context, isEnabled, _) {
                      return CustomButton(
                        allowTapButton: _allowTapButton,
                        onPressed: () {
                          context.router.push(const ConfirmEntryRoute());
                        },
                        style: CustomButtonStyles.mainButtonStyle(context)
                            .copyWith(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            isEnabled
                                ? AppColors.mainColor
                                : AppColors.backgroundButtonF5F5F5,
                          ),
                          foregroundColor: WidgetStatePropertyAll(
                            isEnabled
                                ? AppColors.white
                                : AppColors
                                    .foregroundTextButoonWhenIsnotAllowed,
                          ),
                        ),
                        text: 'Добавить',
                        child: null,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
