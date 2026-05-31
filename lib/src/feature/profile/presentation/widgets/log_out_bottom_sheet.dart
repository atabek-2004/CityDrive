import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:city_drive/src/core/presentation/widgets/bottomsheet/custom_drag_handle.dart';
import 'package:city_drive/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:city_drive/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/bloc/app_bloc.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/profile/bloc/profile_bloc.dart';

class LogoutBottomSheet extends StatefulWidget {
  const LogoutBottomSheet({super.key, this.isDeleteAccount, this.onYesTapped});
  final bool? isDeleteAccount;
  final void Function()? onYesTapped;

  @override
  State<LogoutBottomSheet> createState() => _LogoutBottomSheetState();

  static Future<void> show(BuildContext context,
          {bool? isDeleteAccount, void Function()? onYesTapped}) =>
      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => BlocProvider(
          create: (context) => ProfileBLoC(
            authRepository: context.repository.authRepository,
            profileRepository: context.repository.profileRepository,
          ),
          child: LogoutBottomSheet(
            isDeleteAccount: isDeleteAccount,
            onYesTapped: onYesTapped,
          ),
        ),
      );
}

class _LogoutBottomSheetState extends State<LogoutBottomSheet> {
  int isSelectedLanguage = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBLoC, ProfileState>(
      listener: (context, state) {
        state.maybeWhen(
          exited: (message) {
            // context.read<CargoFormCubit>().clearForm();
            BlocProvider.of<AppBloc>(context).add(const AppEvent.exiting());
            context.router.maybePop();
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  message,
                ),
              ),
            );
            context.router.maybePop();
          },
          // loaded: (user) {
          //   BlocProvider.of<AppBloc>(context).add(const AppEvent.exiting());

          //   context.router.maybePop();
          // },
          orElse: () {},
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                          child: CustomDragHandle(
                        isShopBottomSheet: false,
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 5),
                            child: Text(
                              widget.isDeleteAccount == true
                                  ? '${context.localized.deleteAccount}?'
                                  : 'Выйти из аккаунт?',
                              style: AppTextStyles.fs18w600,
                            ),
                          ),
                        ],
                      ),
                      const Gap(34),

                      ///
                      /// <--`Button`-->
                      ///
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 16),
                        child: Row(
                          spacing: 12,
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: () {
                                  context.router.maybePop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.backgroundButtonF5F5F5,
                                  shadowColor: AppColors.backgroundButtonF5F5F5,
                                  elevation: 0,
                                  foregroundColor: AppColors.text,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                ),
                                child: Text(
                                  context.localized.cancel,
                                  style: AppTextStyles.body14W500
                                      .copyWith(color: AppColors.text595959),
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomButton(
                                onPressed: () {
                                  widget.isDeleteAccount == true
                                      ? BlocProvider.of<ProfileBLoC>(context)
                                          .add(
                                          const ProfileEvent.deleteAccount(),
                                        )
                                      : BlocProvider.of<ProfileBLoC>(context)
                                          .add(const ProfileEvent.logOut());

                                  context.router.replaceAll([LoginRoute()]);
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: AppColors.muteBlue,
                                  shadowColor: AppColors.muteBlue,
                                  foregroundColor: AppColors.muteBlue,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                ),
                                child: Text(
                                  context.localized.yes,
                                  style: AppTextStyles.body14W500
                                      .copyWith(color: AppColors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )

                      // const Gap(34),
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
