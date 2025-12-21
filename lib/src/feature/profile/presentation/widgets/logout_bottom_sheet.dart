// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ikidz/src/core/gen/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/bottomsheet/custom_drag_handle.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/feature/app/bloc/app_bloc.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/profile/bloc/profile_bloc.dart';

class LogoutBottomSheet extends StatefulWidget {
  const LogoutBottomSheet(
      {super.key,
      this.isDeleteAccount,
      this.onYesTapped,
      this.onYesLogoutTapped});
  final bool? isDeleteAccount;
  final void Function()? onYesTapped;
  final void Function()? onYesLogoutTapped;

  @override
  State<LogoutBottomSheet> createState() => _LogoutBottomSheetState();

  static Future<void> show(BuildContext context,
          {bool? isDeleteAccount,
          void Function()? onYesTapped,
          void Function()? onYesLogoutTapped}) =>
      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.red,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => BlocProvider(
          create: (context) => ProfileBLoC(
              authRepository: context.repository.authRepository,
              profileRepository: context.repository.profileRepository),
          child: LogoutBottomSheet(
            isDeleteAccount: isDeleteAccount,
            onYesTapped: onYesTapped,
            onYesLogoutTapped: onYesLogoutTapped,
          ),
        ),
      );
}

class _LogoutBottomSheetState extends State<LogoutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBLoC, ProfileState>(
      listener: (context, state) {
       state.maybeWhen(
          orElse: () {},
          exited: (message) {
            Navigator.pop(context);
            BlocProvider.of<AppBloc>(context).add(const AppEvent.exiting());
            context.router.replaceAll([LauncherRoute()]);
            setState(() {});
          },
        );
      },
      builder: (context, state) {
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomDragHandle(isShopBottomSheet: false,),
                      Image.asset(
                        Assets.images.town.path,
                        height: 127,
                      ),
                      const Gap(8),
                      Text(
                        widget.isDeleteAccount == true
                            ? 'Удалить аккаунт?'
                            : 'Выйти из акккаунта?',
                        style: AppTextStyles.title22BoldW700.copyWith(),
                      ),
                      const Gap(30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: CustomButton(
                                height: 52,
                                isExpanded: false,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: CustomButtonStyles.mainButtonStyle(
                                    context,
                                    backgroundColor:
                                        AppColors.base400.withOpacity(0.14),
                                    radius: 24),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Text(
                                    'Нет',
                                    style: AppTextStyles.body17w600
                                        .copyWith(color: AppColors.mutePink),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomButton(
                                height: 52,
                                isExpanded: false,
                                onPressed: widget.isDeleteAccount == true
                                    ? widget.onYesTapped
                                    : () {
                                        // BlocProvider.of<ProfileBLoC>(context)
                                        //     .add(const ProfileEvent.logOut());
                                      },
                                style: CustomButtonStyles.mainButtonStyle(
                                    context,
                                    backgroundColor: AppColors.mutePink,
                                    radius: 24),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Text(
                                    widget.isDeleteAccount == true
                                        ? 'Да, удалить'
                                        : 'Да, выйти',
                                    style: AppTextStyles.title16W800
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
