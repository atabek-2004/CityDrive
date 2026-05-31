import 'dart:developer';
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
import 'package:city_drive/src/core/constant/constants.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:city_drive/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:city_drive/src/core/presentation/widgets/textfields/custom_textfield.dart';
import 'package:city_drive/src/core/presentation/widgets/textfields/custom_validator_textfield.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/core/utils/input/validator_util.dart';
import 'package:city_drive/src/feature/app/bloc/app_bloc.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/auth/models/request/user_payload.dart';
import 'package:city_drive/src/feature/auth/models/user_dto.dart';
import 'package:city_drive/src/feature/profile/bloc/profile_bloc.dart';
import 'package:city_drive/src/feature/profile/bloc/profile_cubit.dart';
import 'package:city_drive/src/feature/profile/presentation/widgets/log_out_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget implements AutoRouteWrapper {
  final UserDTO userDTO;
  const EditProfilePage({
    super.key,
    required this.userDTO,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(
            repository: context.repository.profileRepository,
          ),
        ),
        BlocProvider(
          create: (context) => ProfileBLoC(
            profileRepository: context.repository.profileRepository,
            authRepository: context.repository.authRepository,
          ),
        ),
      ],
      child: this,
    );
  }
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final ValueNotifier<String?> _phoneError = ValueNotifier(null);
  final ValueNotifier<String?> _passwordError = ValueNotifier(null);
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);

  MaskTextInputFormatter maskPhoneFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp('[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  String imageNetwork = '';
  XFile? image;

  @override
  void initState() {
    log('name -> ${widget.userDTO.fullName}');

    log('password -> ${widget.userDTO.password}');
    log('number -> ${widget.userDTO.phone}');

    log('avatar -> ${widget.userDTO.avatarUrl}');

    nameController.text = widget.userDTO.fullName ?? '';
    passwordController.text = widget.userDTO.password ?? '';

    phoneController.text = widget.userDTO.phone ?? '';
    imageNetwork = widget.userDTO.avatarUrl ?? '';

    super.initState();
  }

  @override
  void dispose() {
    _phoneError.dispose();
    passwordController.dispose();
    _obscureText.dispose();
    _passwordError.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          'Редактировать профиль',
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
                        onChanged: (value) {},
                      ),
                      const Gap(12),
                      Text(
                        'Номер телефона',
                        style: AppTextStyles.texts13w500
                            .copyWith(color: AppColors.text63636366),
                      ),
                      const Gap(12),
                      CustomValidatorTextfield(
                        fillColor: AppColors.inputTextFildEAECED,
                        controller: phoneController,
                        valueListenable: _phoneError,
                        inputFormatters: [maskPhoneFormatter],
                        hintText: context.localized.enter_your_phone_number,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {},
                        validator: (String? value) {
                          return _phoneError.value = ValidatorUtil.phone(
                            maskPhoneFormatter.getUnmaskedText(),
                          );
                        },
                      ),
                      const Gap(12),
                      Text(
                        'Пароль',
                        style: AppTextStyles.texts13w500
                            .copyWith(color: AppColors.text63636366),
                      ),
                      const Gap(6),
                      ValueListenableBuilder(
                        valueListenable: _obscureText,
                        builder: (context, v, c) {
                          return CustomValidatorTextfield(
                            fillColor: AppColors.inputTextFildEAECED,
                            obscureText: _obscureText,
                            controller: passwordController,
                            valueListenable: _passwordError,
                            hintText: 'Введите пароль',
                            onChanged: (value) {
                              // checkAllowTapButton();
                            },
                            validator: (String? value) {
                              return null;
                            },
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            BlocConsumer<ProfileCubit, ProfileCubitState>(
              listener: (context, state) {
                state.maybeWhen(
                  error: (message) {
                    context.loaderOverlay.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                    //
                  },
                  loading: () {
                    context.loaderOverlay.show();
                  },
                  loaded: (user) {
                    context.loaderOverlay.hide();
                    // context.router.replaceAll(
                    //   [
                    //     const LauncherRoute(children: [ProfileRoute()]),
                    //   ],
                    // context.router.popUntil(
                    //     (route) => route.settings.name == LauncherRoute.name);
                    context.router.maybePop(true);
                    // context.read<ProfileBLoC>().add(const ProfileEvent.getProfile());
                    // BlocProvider.of<ProfileBLoC>(context)
                    //     .add(const ProfileEvent.getProfile());
                    // context.router.maybePop();
                    // log('loaded');
                  },
                  orElse: () {
                    context.loaderOverlay.hide();
                  },
                );
              },
              builder: (context, state) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(12),

                      /// save changes button

                      CustomButton(
                        onPressed: () {
                          BlocProvider.of<ProfileCubit>(context).updateProfile(
                            avatar: image,
                            userPayload: UserPayload(
                              fullName: nameController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
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
                          backgroundColor:
                              WidgetStatePropertyAll(AppColors.mainColor),
                          foregroundColor:
                              WidgetStatePropertyAll(AppColors.white),
                        ),
                        text: context.localized.save,
                        child: null,
                      ),
                      const Gap(16),

                      // delete button
                      BlocConsumer<ProfileBLoC, ProfileState>(
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
                            exited: (user) {
                              context.loaderOverlay.hide();
                              // Toaster.showTopShortToast(context, message: 'Успешно');
                              BlocProvider.of<AppBloc>(context)
                                  .add(const AppEvent.exiting());
                              context.router.popUntil((route) =>
                                  route.settings.name == LauncherRoute.name);
                            },
                            loaded: (userDTO) {
                              // selectedLanguageId = userDTO.language?.id;
                              // log(selectedLanguageId.toString());
                              // log('-----${userDTO.language?.id}');
                              // setState(() {});
                            },
                            orElse: () {
                              context.loaderOverlay.hide();
                            },
                          );
                        },
                        builder: (context, state) {
                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                LogoutBottomSheet.show(
                                  context,
                                  isDeleteAccount: true,
                                  onYesTapped: () {
                                    BlocProvider.of<ProfileBLoC>(context).add(
                                        const ProfileEvent.deleteAccount());
                                    Navigator.pop(context);
                                  },
                                );
                              },
                              child: Text(
                                context.localized.deleteAccount,
                                style: AppTextStyles.body16w400.copyWith(
                                  color: AppColors.grey646464,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
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
