import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:ikidz/src/feature/auth/bloc/register_cubit.dart';
import 'package:ikidz/src/feature/auth/models/request/user_payload.dart';
import 'package:ikidz/src/feature/auth/presentation/auth.dart';
import 'package:ikidz/src/feature/auth/presentation/widgets/registration_is_not_available_dialog.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/presentation/widgets/scroll/scroll_wrapper.dart';
import 'package:ikidz/src/core/presentation/widgets/textfields/custom_textfield.dart';
import 'package:ikidz/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/core/utils/input/validator_util.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
// import 'package:ikidz/src/feature/auth/bloc/registration1_cubit.dart';
import 'package:ikidz/src/feature/auth/models/common_dto.dart';
import 'package:ikidz/src/feature/profile/presentation/widgets/choose_city_bottom_sheet.dart';

@RoutePage()
class SignUpFirstPage extends StatefulWidget implements AutoRouteWrapper {
  
  const SignUpFirstPage({super.key});

  @override
  _SignUpFirstPageState createState() => _SignUpFirstPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterCubit(repository: context.repository.authRepository),
      child: this,
    );
  }
}

class _SignUpFirstPageState extends State<SignUpFirstPage> {
  File? image;
  CommonDTO? city;
  bool _showDate = false;
  DateTime? _selectedDate;
  var agee = 0;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthDayController = TextEditingController();
  final TextEditingController passwordRepeatController =
      TextEditingController();

  final ValueNotifier<String?> _phoneError = ValueNotifier(null);
  final ValueNotifier<String?> _cityError = ValueNotifier(null);
  final ValueNotifier<String?> _firstNameError = ValueNotifier(null);
  final ValueNotifier<String?> _passwordError = ValueNotifier(null);
  final ValueNotifier<String?> _passwordRepeatError = ValueNotifier(null);
  final MaskTextInputFormatter maskFormatter =
      MaskTextInputFormatter(mask: '+7(###) ###-##-##');
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);
  final ValueNotifier<bool> _obscureText2 = ValueNotifier(true);
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

  @override
  void dispose() {
    firstNameController.dispose();
    birthDayController.dispose();
    cityController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordRepeatController.dispose();
    _obscureText.dispose();
    _passwordError.dispose();
    _phoneError.dispose();
    _cityError.dispose();
    _firstNameError.dispose();

    _passwordRepeatError.dispose();
    _allowTapButton.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // nameController = PhoneNumberUtils(phoneController: phoneNumberController);
    phoneController.addListener(checkAllowTapButton);
    birthDayController.addListener(checkAllowTapButton);
    cityController.addListener(checkAllowTapButton);
    firstNameController.addListener(checkAllowTapButton);
    passwordController.addListener(checkAllowTapButton);
    passwordRepeatController.addListener(checkAllowTapButton);
  }

  void checkAllowTapButton() {
    final isPassValid =
        passwordController.text == passwordRepeatController.text;

    final bool isAdult =
        _selectedDate != null && _calculateAge(_selectedDate!) >= 18;

    _allowTapButton.value = phoneController.text.length == 17 &&
        firstNameController.text.isNotEmpty &&
        city != null &&
        passwordController.text.isNotEmpty &&
        passwordRepeatController.text.isNotEmpty &&
        isPassValid &&
        _selectedDate != null &&
        isAdult;
  }

  // bool isValidEmail(String value) {
  //   const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  //   final regExp = RegExp(pattern);
  //   return regExp.hasMatch(value);
  // }

  int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;

    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          // appBar: AppBar(
          //   leading: TextButton.icon(
          //     onPressed: () {
          //       context.router.maybePop();
          //     },
          //     label: SvgPicture.asset(Assets.icons.backArrow.path),
          //   ),
          // ),
          body: SafeArea(
            child: Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.onUnfocus,
              child: ScrollWrapper(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: BlocListener<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        error: (message) {
                          context.loaderOverlay.hide();
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(message)));
                        },
                        loading: () {
                          context.loaderOverlay.show();
                        },
                        loaded: (user) {
                          context.loaderOverlay.hide();
                          print(user.phone);
                          context.router.push(
                            EnterSmsCodeRoute(
                              phone: user.phone ?? '',
                              flowType: EnterSmsCodeType.signUp,
                              smsDelay: 1,
                              userPayload: UserPayload(
                                fullName: user.fullName,
                                password: user.password,
                                phone: user.phone,
                                passwordConfirmation: user.passwordConfirmation,
                                cityId: user.cityId,
                                birthDate: user.birthDate,
                              ),
                            ),
                          );
                        },
                        orElse: () {
                          context.loaderOverlay.hide();
                        },
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SignUpStepsWidget(activeIndex: 1),
                        const Gap(32),
                        Text(
                          context.localized.create_an_account,
                          style: AppTextStyles.title26Semibold,
                        ),
                        const Gap(29),

                        Text(
                          'Фамилия и имя',
                          style: AppTextStyles.texts13w500
                              .copyWith(color: AppColors.text63636366),
                        ),
                        const Gap(6),
                        CustomTextField(
                          controller: firstNameController,
                          hintText: 'Введите фамилию и имя',
                          onChanged: (value) {
                            checkAllowTapButton();
                          },
                        ),
                        const Gap(16),
                        Text(
                          context.localized.phone_number,
                          style: AppTextStyles.texts13w500
                              .copyWith(color: AppColors.text63636366),
                        ),
                        const Gap(6),
                        CustomValidatorTextfield(
                          controller: phoneController,
                          valueListenable: _phoneError,
                          inputFormatters: [maskFormatter],
                          hintText: context.localized.enter_your_phone_number,
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            checkAllowTapButton();
                          },
                          validator: (String? value) {
                            return _phoneError.value = ValidatorUtil.phone(
                              maskFormatter.getUnmaskedText(),
                            );
                          },
                        ),
                        const Gap(16),
                        Text(
                          context.localized.city,
                          style: AppTextStyles.texts13w500
                              .copyWith(color: AppColors.text63636366),
                        ),
                        const Gap(6),
                        CustomValidatorTextfield(
                          controller: cityController,
                          valueListenable: _phoneError,
                          hintText: context.localized.choose_a_city,
                          readOnly: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: SvgPicture.asset(
                              Assets.icons.vector.path,
                            ),
                          ),
                          onChanged: (value) {
                            checkAllowTapButton();
                          },
                          onTap: () async {
                            final result = await CityBottomSheet.show(
                              context,
                              chosenCity: city,
                            );

                            if (context.mounted && result != null) {
                              setState(() {
                                city = result;
                                cityController.text = result.name ?? '';
                              });
                              checkAllowTapButton();
                            }
                          },
                        ),
                        const Gap(16),
                        Text(
                          'Дата рождения',
                          style: AppTextStyles.texts13w500
                              .copyWith(color: AppColors.text63636366),
                        ),
                        const Gap(6),
                        CustomValidatorTextfield(
                          controller: birthDayController,
                          valueListenable: _phoneError,
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
                              if (_showDate && _selectedDate != null) {
                                final now = DateTime.now();
                                final date = _selectedDate!;
                                final age = now.year -
                                    date.year -
                                    ((now.month < date.month ||
                                            (now.month == date.month &&
                                                now.day < date.day))
                                        ? 1
                                        : 0);

                                if (age < 18) {
                                  RegisterIsNotAvailableDialog.show(context);

                                  return;
                                }

                                // setState(() {
                                //   _showDate = false;
                                // });
                              }

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
                              final age = now.year -
                                  date.year -
                                  ((now.month < date.month ||
                                          (now.month == date.month &&
                                              now.day < date.day))
                                      ? 1
                                      : 0);

                              if (age < 18) {
                                RegisterIsNotAvailableDialog.show(context);

                                return;
                              }

                              // setState(() {
                              //   _showDate = false;
                              // });
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
                                            setState(() {
                                              _selectedDate = date;
                                              birthDayController.text =
                                                  DateFormat('dd.MM.yyyy')
                                                      .format(date);
                                            });
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

                        const Gap(16),
                        // Text(
                        //   context.localized.email,
                        //   style: AppTextStyles.body14Regular,
                        // ),
                        // const Gap(6),
                        // CustomValidatorTextfield(
                        //   controller: emailController,
                        //   valueListenable: _emailError,
                        //   hintText: context.localized.enter_your_email_address,
                        //   onChanged: (value) {
                        //     checkAllowTapButton();
                        //   },
                        // ),

                        // const Gap(16),
                        Text(
                          context.localized.password,
                          style: AppTextStyles.texts13w500
                              .copyWith(color: AppColors.text63636366),
                        ),
                        const Gap(6),
                        ValueListenableBuilder(
                          valueListenable: _obscureText,
                          builder: (context, v, c) {
                            return CustomValidatorTextfield(
                              obscureText: _obscureText,
                              controller: passwordController,
                              valueListenable: _passwordError,
                              hintText: context.localized.enter_the_password,
                              onChanged: (value) {
                                checkAllowTapButton();
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return _passwordError.value =
                                      context.localized.required_to_fill_in;
                                }

                                if (value.length < 6) {
                                  return _passwordError.value = context
                                      .localized
                                      .the_minimum_password_length_is_6;
                                }

                                return _passwordError.value = null;
                              },
                            );
                          },
                        ),
                        const Gap(16),
                        Text(
                          context.localized.repeat_the_password,
                          style: AppTextStyles.texts13w500
                              .copyWith(color: AppColors.text63636366),
                        ),
                        const Gap(6),
                        ValueListenableBuilder(
                          valueListenable: _obscureText2,
                          builder: (context, v, c) {
                            return CustomValidatorTextfield(
                              obscureText: _obscureText2,
                              controller: passwordRepeatController,
                              valueListenable: _passwordRepeatError,
                              hintText: context.localized.repeat_the_password,
                              onChanged: (value) {
                                checkAllowTapButton();
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return _passwordRepeatError.value =
                                      context.localized.required_to_fill_in;
                                }

                                if (value.length < 6) {
                                  return _passwordRepeatError.value = context
                                      .localized
                                      .the_minimum_password_length_is_6;
                                }

                                if (value != passwordController.text) {
                                  return _passwordRepeatError.value =
                                      context.localized.passwords_dont_match;
                                }
                                return _passwordRepeatError.value = null;
                              },
                            );
                          },
                        ),
                        const Gap(16),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: 'Продолжая, вы соглашаетесь с ',
                                  style: AppTextStyles.body16Regular400),
                              TextSpan(
                                  text: 'Политикой конфиденциальности',
                                  style: AppTextStyles.body16Regular800
                                      .copyWith(
                                          color: const Color(0xFF1890FF))),
                            ],
                          ),
                        ),
                        const Gap(26),
                        const Spacer(),
                        const Gap(16),
                        ValueListenableBuilder(
                          valueListenable: _allowTapButton,
                          builder: (context, isEnabled, _) {
                            return CustomButton(
                              allowTapButton: _allowTapButton,
                              onPressed: () {
                                BlocProvider.of<RegisterCubit>(context)
                                    .register(
                                  payload: UserPayload(
                                    fullName: firstNameController.text.trim(),
                                    password: passwordController.text.trim(),
                                    cityId: city?.id,
                                    phone: phoneController.text
                                        .replaceAll(RegExp(r'[^\d]'), ''),
                                    passwordConfirmation:
                                        passwordRepeatController.text.trim(),

                                    birthDate: _selectedDate.toString(),
                                    // deviceType:
                                    //     Platform.isAndroid ? 'android' : 'ios',
                                    // deviceToken: '',
                                  ),
                                );
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
                              text: 'Далее',
                              child: null,
                            );
                          },
                        ),

                        // BlocListener<Register1Cubit, Register1State>(
                        //   listener: (context, state) {
                        //     state.maybeWhen(
                        //       loading: () => context.loaderOverlay.show(),
                        //       error: (message) {
                        //         context.loaderOverlay.hide();
                        //         ScaffoldMessenger.of(context).showSnackBar(
                        //           SnackBar(
                        //             content: Text(message),
                        //           ),
                        //         );
                        //       },
                        //       loaded: (user) {
                        //         context.loaderOverlay.hide();
                        //         // context.pushRoute(SignUpSecondRoute(email: emailController.text));
                        //       },
                        //       orElse: () => context.loaderOverlay.hide(),
                        //     );
                        //   },
                        //   child: ValueListenableBuilder(
                        //     valueListenable: _allowTapButton,
                        //     builder: (context, isEnabled, _) {
                        //       return CustomButton(
                        //         allowTapButton: _allowTapButton,
                        //         onPressed: () {
                        //           // BlocProvider.of<RegisterCheckCodeCubit>(
                        //           //         context)
                        //           //     .checkCode(
                        //           //   code: pinputController.text,
                        //           //   phone: widget.phone ?? "",
                        //           // );
                        //         },
                        //         style: CustomButtonStyles.mainButtonStyle(context)
                        //             .copyWith(
                        //           shape: WidgetStatePropertyAll(
                        //             RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(16),
                        //             ),
                        //           ),
                        //           backgroundColor: WidgetStatePropertyAll(
                        //             isEnabled
                        //                 ? AppColors.mainColor
                        //                 : AppColors.backgroundButtonF5F5F5,
                        //           ),
                        //           foregroundColor: WidgetStatePropertyAll(
                        //             isEnabled
                        //                 ? AppColors.white
                        //                 : AppColors
                        //                     .foregroundTextButoonWhenIsnotAllowed,
                        //           ),
                        //         ),
                        //         text: 'Далее',
                        //         child: null,
                        //       );
                        //     },
                        //   ),
                        // ),
                        const Gap(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'У вас есть аккаунт?',
                              style: AppTextStyles.body16Regular400.copyWith(
                                color: AppColors.text8E8E93,
                              ),
                            ),
                            const Gap(5),
                            GestureDetector(
                              onTap: () {
                                context.router.push(const LoginRoute());
                              },
                              child: const Text(
                                'Войти',
                                style: AppTextStyles.body16Regular400Blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
