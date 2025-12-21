import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/constants.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_material_button.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/core/utils/image_util.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/main/presentation/widgets/subscription_only_for_child_conteyner.dart';
import 'package:ikidz/src/feature/profile/bloc/my_children_cubit.dart';
import 'package:ikidz/src/feature/profile/models/child_dto.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class MyChildrenProfilePage extends StatefulWidget implements AutoRouteWrapper {
  const MyChildrenProfilePage({super.key});

  @override
  State<MyChildrenProfilePage> createState() => _MyChildrenProfilePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => MyChildrenCubit(
        repository: context.repository.profileRepository,
      ),
      child: this,
    );
  }
}

class _MyChildrenProfilePageState extends State<MyChildrenProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<MyChildrenCubit>(context).getMyChildren();
    });

    super.initState();
  }

  int? selectedIndex;
  List<ChildDTO> myChildren = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.only(right: 16),
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
          'Мои дети',
          style: AppTextStyles.title20BoldW600.copyWith(
            color: AppColors.tabActive,
          ),
        ),
        actions: [
          myChildren.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    context.router
                        .push(AddChildRoute(isProfileAddChildPage: true));
                  },
                  child: Text(
                    'Добавить',
                    style: AppTextStyles.body16w500
                        .copyWith(color: AppColors.mainColor),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
      body: BlocBuilder<MyChildrenCubit, MyChildrenState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const CustomLoadingOverlayWidget(),
            loaded: (response) {
              context.loaderOverlay.hide();
              myChildren = response;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  myChildren = response;
                });
              });
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: response.isNotEmpty
                    ? ListView(
                        children: [
                          Column(
                            children: [
                              ListView.builder(
                                itemCount: response.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final child = response[index];
                                  final isSelected = selectedIndex == index;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0,
                                            vertical: 16.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.conteinerFAFAFA,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(50),
                                                    child: CachedNetworkImage(
                                                        imageUrl: child
                                                                .photoPath ??
                                                            NO_IMAGE_AVAILABLE,
                                                        fit: BoxFit.cover,
                                                        width: 50,
                                                        height: 50,
                                                        progressIndicatorBuilder:
                                                            ImageUtil
                                                                .cachedLoadingBuilder),
                                                  ),
                                                  const Gap(10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        child.fullName ?? '',
                                                        style: AppTextStyles
                                                            .body16Regular500
                                                            .copyWith(
                                                          color: AppColors
                                                              .black141414,
                                                        ),
                                                      ),
                                                      const Gap(4),
                                                      Text(
                                                        '${calculateAge(child.birthDate)} лет',
                                                        style: AppTextStyles
                                                            .body14w400
                                                            .copyWith(
                                                          color: AppColors
                                                              .text595959,
                                                        ),
                                                      ),
                                                      const Gap(6),
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            Assets.icons
                                                                .redClose.path,
                                                            width: 16,
                                                            height: 16,
                                                          ),
                                                          const Gap(4),
                                                          Text(
                                                            'Нет подписки',
                                                            style: AppTextStyles
                                                                .body12W400Green
                                                                .copyWith(
                                                              color: AppColors
                                                                  .redCF1322,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SvgPicture.asset(
                                                isSelected
                                                    ? Assets.icons
                                                        .genderSelected.path
                                                    : Assets
                                                        .icons
                                                        .genferNotSeleceted
                                                        .path,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Gap(16),
                                    ],
                                  );
                                },
                              ),
                              const SubscriptionOnlyForChildConteyner(),
                            ],
                          ),
                        ],
                      )
                    : Center(
                        child: Column(
                          children: [
                            Gap(MediaQuery.of(context).size.height * 0.09),
                            Image.asset(
                              Assets.images.png.myChildrenEmpty.path,
                              width: 130,
                              height: 144,
                            ),
                            const Gap(16),
                            Text(
                              'Список детей пуст',
                              style: AppTextStyles.body16w600.copyWith(
                                color: AppColors.black000100,
                              ),
                            ),
                            const Gap(8),
                            Text(
                              'Добавьте ребёнка, чтобы начать пользоваться приложением',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.body14w400.copyWith(
                                color: AppColors.grey646464,
                              ),
                            ),
                            const Gap(16),
                            Container(
                              height: 42,
                              width: 181,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: AppColors.mainColor,
                              ),
                              child: CustomMaterialButton(
                                onTap: () {
                                  context.router.push(AddChildRoute(
                                      isProfileAddChildPage: true));
                                },
                                child: Center(
                                  child: Text(
                                    'Добавить ребенка',
                                    style: AppTextStyles.body14w400.copyWith(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: myChildren.isNotEmpty
          ? Padding(
              padding:
                  const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 40.0),
              child: CustomButton(
                onPressed: () {
                  context.router.push(const SubscriptionRoute());
                },
                style: CustomButtonStyles.mainButtonStyle(context).copyWith(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.mainColor),
                  foregroundColor:
                      const WidgetStatePropertyAll(AppColors.white),
                ),
                child: Text(
                  'Купить подписку',
                  style: AppTextStyles.title18W600.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            )
          : null,
    );
  }

  int calculateAge(String? birthDateStr) {
    if (birthDateStr == null || birthDateStr.isEmpty) return 0;

    final birthDate = DateTime.tryParse(birthDateStr);
    if (birthDate == null) return 0;

    final now = DateTime.now();

    int age = now.year - birthDate.year;

    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}
