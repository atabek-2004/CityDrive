import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/constants.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/core/utils/image_util.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/profile/bloc/profile_bloc.dart';
import 'package:ikidz/src/feature/profile/presentation/widgets/choose_language_bottom_sheet.dart';
import 'package:ikidz/src/feature/profile/presentation/widgets/log_out_bottom_sheet.dart';
import 'package:ikidz/src/feature/profile/presentation/widgets/profile_page_item.dart';
import 'package:ikidz/src/feature/profile/presentation/widgets/support_service_bottom_sheet.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class ProfilePage extends StatefulWidget implements AutoRouteWrapper {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBLoC(
            profileRepository: context.repository.profileRepository,
            authRepository: context.repository.authRepository,
          ),
        ),
        // BlocProvider(
        //   create: (context) =>
        //       CityListCubit(repository: context.repository.mainRepository),
        // ),
        // BlocProvider(
        //   create: (context) =>
        //       DocumentCubit(repository: context.repository.profileRepository),
        // ),
        // BlocProvider(
        //   create: (context) => ProfileEditCubit(
        //       repository: context.repository.profileRepository),
        // ),
      ],
      child: this,
    );
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBLoC>().add(const ProfileEvent.getProfile());
    });
    // BlocProvider.of<CityListCubit>(context).getCityList();
    // BlocProvider.of<DocumentCubit>(context).support();

    super.initState();
  }

  MaskTextInputFormatter maskPhoneFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp('[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  final RefreshController _refreshController = RefreshController();
  // CityDTO? chosenCity;
  // List<CityDTO> city = [
  //   const CityDTO(id: 1, name: 'Almaty'),
  //   const CityDTO(id: 2, name: 'Astana')
  // ];

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _completeRefreshControllers() {
    if (_refreshController.isLoading) {
      _refreshController.loadComplete();
    }

    if (_refreshController.isRefresh) {
      _refreshController.refreshCompleted();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBLoC, ProfileState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) {
            context.loaderOverlay.hide();
            Toaster.showErrorTopShortToast(context, message);
            //
          },
          loaded: (user) {
            context.loaderOverlay.hide();
            maskPhoneFormatter = MaskTextInputFormatter(
              mask: '+7 (###) ###-##-##',
              filter: {"#": RegExp('[0-9]')},
              initialText: user.phone,
            );
            // chosenCity = CityDTO(id: user.city?.id, name: user.city?.name);
          },
          loading: () {
            context.loaderOverlay.show();
            _refreshController.resetNoData();
          },
          orElse: () {
            context.loaderOverlay.hide();
            _completeRefreshControllers();
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loaded: (user) {
            context.loaderOverlay.hide();
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Профиль',
                          style: AppTextStyles.title20BoldW600.copyWith(
                            color: AppColors.tabActive,
                          ),
                        ),
                      ),
                      const Gap(20),

                      // Avatar + Name + ID
                      Center(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(50),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 5.6,
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              user.avatarUrl ?? NOT_FOUND_IMAGE,
                                          progressIndicatorBuilder:
                                              ImageUtil.cachedLoadingBuilder,
                                          fit: BoxFit.cover,
                                        )),
                                  ),

                                  // Text(
                                  //   maskPhoneFormatter.getMaskedText(),
                                  //   style: AppTextStyles.fs12w500.copyWith(
                                  //       height: 1.6, color: AppColors.black09),
                                  // ),
                                ],
                              ),
                            ),
                            const Gap(14),
                            Text(
                              user.fullName ?? '',
                              style: AppTextStyles.title20BoldW700.copyWith(
                                color: AppColors.blac0F1721,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'ID:${user.id ?? 0}',
                              style: AppTextStyles.body12W400.copyWith(
                                color: AppColors.grey6F747A,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Gap(10),

                      // Profile menu items
                      ProfileMenuItem(
                        icon: Assets.icons.edit.path,
                        color: Colors.transparent,
                        title: 'Редактировать профиль',
                        onTap: () async {
                          final result = await context.router.push(
                            EditProfileRoute(userDTO: user),
                          );

                          if (result == true) {
                            context
                                .read<ProfileBLoC>()
                                .add(const ProfileEvent.getProfile());
                          }
                        },
                      ),
                      // ProfileMenuItem(
                      //   icon: Assets.icons.myChildren.path,
                      //   color: Colors.green,
                      //   title: 'Мои дети',
                      //   onTap: () {
                      //     context.router.push(const MyChildrenProfileRoute());
                      //   },
                      // ),
                      // ProfileMenuItem(
                      //   icon: Assets.icons.subscription.path,
                      //   color: Colors.transparent,
                      //   title: 'IKIDZ абонементы',
                      //   onTap: () {
                      //     context.router.push(const IkidzSubscriptionsRoute());
                      //   },
                      // ),
                      const Gap(16),
                      ProfileMenuItem(
                        icon: Assets.icons.docx.path,
                        color: Colors.transparent,
                        title: 'Документы',
                        onTap: () {
                          context.router.push(const DocumentsRoute());
                        },
                      ),
                      ProfileMenuItem(
                        icon: Assets.icons.ikidsLanguage.path,
                        color: Colors.transparent,
                        title: 'Язык',
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0x1A165DFF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            user.lang == 'ru' ? 'Рус' : 'Каз',
                            style: AppTextStyles.body12w700.copyWith(
                              color: AppColors.blue3,
                            ),
                          ),
                        ),
                        onTap: () {
                          ChooseLanguageBottomSheet.show(context);
                        },
                      ),
                      ProfileMenuItem(
                        showDivider: false,
                        icon: Assets.icons.support.path,
                        color: Colors.transparent,
                        title: 'Служба поддержки',
                        onTap: () {
                          SupportServiceBottomSheet.show(context);
                        },
                      ),
                      const Gap(16),
                      ProfileMenuItem(
                        showDivider: false,
                        icon: Assets.icons.goout.path,
                        color: Colors.transparent,
                        title: 'Выход',
                        onTap: () {
                          LogoutBottomSheet.show(
                            context,
                            isDeleteAccount: false,
                            onYesTapped: () {
                              // BlocProvider.of<ProfileBLoC>(context)
                              //     .add(const ProfileEvent.deleteAccount());
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
