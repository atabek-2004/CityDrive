import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/bottomsheet/custom_drag_handle.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart'
    show CustomButtonStyles, CustomButton;
import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/feature/auth/models/user_dto.dart';
import 'package:ikidz/src/feature/settings/bloc/app_settings_bloc.dart';
import 'package:ikidz/src/feature/settings/widget/settings_scope.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet(
      {super.key, this.selectedLanguage, this.languageId, this.userDTO});

  final Function(int id)? selectedLanguage;
  final int? languageId;
  final UserDTO? userDTO;

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();

  static Future<void> show(BuildContext context,
          {String? type,
          Function(int id)? selectedLanguage,
          int? languageId,
          UserDTO? userDTO}) =>
      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.backgroundButtonF5F5F5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => LanguageBottomSheet(
          selectedLanguage: selectedLanguage,
          languageId: languageId,
          userDTO: userDTO,
        ),
      );
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  int? selectedId;

  bool isLoading = false;

  // IAuthDao? _authDao;

  @override
  void initState() {
    selectedId = widget.languageId;
    log('$selectedId');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   const CustomDragHandle(isShopBottomSheet: false,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          context.localized.language,
                          style: AppTextStyles.fs18w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.router.maybePop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, right: 16, left: 16),
                          child: SvgPicture.asset(Assets.icons.addPlus.path),
                        ),
                      ),
                    ],
                  ),
                  const Gap(8),

                  ///
                  /// <--`Language`-->
                  ///
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              selectedId = index + 1;
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    languages[index],
                                    style: AppTextStyles.body16Regular500,
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(selectedId == index + 1
                                      ? Assets.icons.genderSelected.path
                                      : Assets.icons.genferNotSeleceted.path)
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                  const Gap(16),

                  ///
                  /// <--`Add card`-->
                  ///

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: CustomButton(
                        onPressed: () {
                          // BlocProvider.of<ProfileEditCubit>(context).editAccount(
                          //   password: '',
                          //   name: '',
                          //   avatar: null,
                          //   phone: '',
                          //   languageId: selectedId ?? 0,
                          // );
                        },
                        style: CustomButtonStyles.mainButtonStyle(context),
                        child: isLoading
                            ? const CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                              )
                            : Text(
                                context.localized.accept,
                                style: AppTextStyles.body12Regular
                                    .copyWith(color: Colors.white),
                              )),
                  ),

                  // const Gap(34),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  late List<String> languages = [
    'Русский',
    'Казахкий',
  ];
}
