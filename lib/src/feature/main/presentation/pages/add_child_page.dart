import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/constants.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:ikidz/src/core/presentation/widgets/textfields/custom_textfield.dart';
import 'package:ikidz/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/auth/models/request/child_payload.dart';
import 'package:ikidz/src/feature/auth/presentation/widgets/choose_image_bs.dart';
import 'package:ikidz/src/feature/main/presentation/widgets/less_three_years_container.dart';
import 'package:ikidz/src/feature/main/presentation/widgets/less_three_years_dialog.dart';
import 'package:ikidz/src/feature/profile/bloc/add_child_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class AddChildPage extends StatefulWidget implements AutoRouteWrapper {
  final bool isProfileAddChildPage;
  const AddChildPage({super.key, this.isProfileAddChildPage = false});

  @override
  State<AddChildPage> createState() => _AddChildPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => AddChildCubit(
        repository: context.repository.profileRepository,
      ),
      child: this,
    );
  }
}

class _AddChildPageState extends State<AddChildPage> {
  final ValueNotifier<bool> _allowTapButton = ValueNotifier(false);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  int page = 0;
  DateTime? _selectedDate;
  bool _showDate = false;
  String? selectedGender;

  bool get isChildUnder3 {
    if (_selectedDate == null) return false;
    final today = DateTime.now();
    final dob = _selectedDate!;
    final age = today.year -
        dob.year -
        ((today.month < dob.month ||
                (today.month == dob.month && today.day < dob.day))
            ? 1
            : 0);
    return age >= 3;
  }

  void checkAllowTapButton() {
    isChildUnder3
        ? _allowTapButton.value = nameController.text.isNotEmpty &&
            selectedGender != null &&
            _selectedDate != null &&
            image != null
        : _allowTapButton.value = nameController.text.isNotEmpty &&
            selectedGender != null &&
            _selectedDate != null;
  }

  @override
  void dispose() {
    _allowTapButton.dispose();
    super.dispose();
  }

  String imageNetwork = '';
  XFile? image;

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
          widget.isProfileAddChildPage
              ? 'Добавить ребенка'
              : 'Присвоить подписку',
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
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  // Аватар
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFFD9D9D9),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: image != null
                                  ? Image.file(
                                      File(image!.path),
                                      width: 114,
                                      height: 114,
                                      fit: BoxFit.cover,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return CupertinoActionSheet(
                                    actions: [
                                      CupertinoActionSheetAction(
                                        onPressed: () => pickImageFromGallery(
                                          ImageSource.camera,
                                        ).whenComplete(() {
                                          if (context.mounted) {
                                            context.router.maybePop();
                                          }
                                          setState(() {});
                                        }),
                                        child: Text(
                                          'Камера',
                                          style: AppTextStyles.body16w400
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                      CupertinoActionSheetAction(
                                        onPressed: () => pickImageFromGallery(
                                          ImageSource.gallery,
                                        ).whenComplete(() {
                                          if (context.mounted) {
                                            context.router.maybePop();
                                          }
                                          setState(() {});
                                        }),
                                        child: Text(
                                          'Галерея',
                                          style: AppTextStyles.body16w400
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                    cancelButton: CupertinoActionSheetAction(
                                      onPressed: () {
                                        context.router.maybePop();
                                      },
                                      child: Text(
                                        context.localized.cancel,
                                        style: AppTextStyles.body16w400
                                            .copyWith(color: Colors.red),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                    child: image != null
                                        ? Image.file(
                                            File(image?.path ?? ''),
                                            fit: BoxFit.cover,
                                          )
                                        : imageNetwork.isNotEmpty
                                            ? CachedNetworkImage(
                                                imageUrl: imageNetwork,
                                                fit: BoxFit.cover,
                                              )
                                            : Stack(
                                                children: [
                                                  Container(
                                                    // color: Colors.white,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      NOT_FOUND_IMAGE,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Container(
                                                    // margin: const EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black
                                                          .withOpacity(0.3),
                                                    ),
                                                  ),
                                                  // Positioned(child: SvgPicture.asset(Assets.icons.camera.path)),
                                                ],
                                              ),
                                  ),
                                ),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColors.white,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                        Assets.icons.camera.path),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  if (isChildUnder3 && image == null) ...[
                    Center(
                      child: Text(
                        'Добавьте фото ребенка',
                        style: AppTextStyles.body14W500.copyWith(
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ] else ...[
                    const SizedBox.shrink(),
                  ],

                  // Контент

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
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
                        controller: birthDateController,
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
                            setState(() {
                              _showDate = false;
                              checkAllowTapButton();
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
                                          birthDateController.text =
                                              DateFormat('dd.MM.yyyy')
                                                  .format(date);
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
                      // тут хочу чтобы на люой экране был внизу эти части
                    ],
                  )
                ],
              ),
            ),
            BlocListener<AddChildCubit, AddChildState>(
              listener: (context, state) {
                state.maybeWhen(
                  error: (message) {
                    context.loaderOverlay.hide();
                    Toaster.showErrorTopShortToast(context, message);
                  },
                  loading: () {
                    context.loaderOverlay.show();
                    // _refreshController.resetNoData();
                  },
                  loaded: (child) {
                    context.loaderOverlay.hide();
                    widget.isProfileAddChildPage
                        ? LessThreeYearsDialog.show(context)
                        : context.router.push(const MyChildrenRoute());
                  },
                  orElse: () {
                    context.loaderOverlay.hide();
                  },
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LessThreeYearsContainer(),
                    const Gap(12),
                    ValueListenableBuilder(
                      valueListenable: _allowTapButton,
                      builder: (context, isEnabled, _) {
                        return CustomButton(
                          allowTapButton: _allowTapButton,
                          onPressed: () {
                            widget.isProfileAddChildPage
                                ? BlocProvider.of<AddChildCubit>(context)
                                    .addChild(
                                    payload: ChildPayload(
                                      fullName: nameController.text,
                                      birthDate: DateFormat('yyyy-MM-dd')
                                          .format(_selectedDate!),
                                      gender: selectedGender == 'Мужской'
                                          ? 'male'
                                          : 'female',
                                    ),
                                    photoPath: image,
                                  )
                                : () {};
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
                          text: widget.isProfileAddChildPage
                              ? 'Добавить'
                              : 'Присвоить',
                          child: null,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickImageFromGallery(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      XFile? compressed = await compressImage(image);

      setState(() {
        this.image = compressed;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  Future<XFile?> compressImage(XFile file) async {
    final result = await FlutterImageCompress.compressWithFile(
      file.path,
      quality: 80,
      minWidth: 800,
      minHeight: 800,
    );

    if (result == null) return null;

    final tempDir = Directory.systemTemp;
    final target = File(
        '${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg');
    await target.writeAsBytes(result);

    return XFile(target.path);
  }
}
