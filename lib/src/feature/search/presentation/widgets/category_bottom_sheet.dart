import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_material_button.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';
import 'package:ikidz/src/feature/search/bloc/activities_cubit.dart';
import 'package:ikidz/src/feature/search/model/schedule_dto.dart';

class CategoryBottomSheet extends StatefulWidget {
  final List<CategoryDTO>? categories;
  const CategoryBottomSheet({super.key, this.categories});

  static Future<void> show(
    BuildContext context, {
    List<CategoryDTO>? categories,
  }) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (context) => BlocProvider(
          create: (context) => ActivitiesCubit(
            repository: context.repository.searchRepository,
          ),
          child: CategoryBottomSheet(
            categories: categories,
          ),
        ),
      );

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  String? selectedSection;
  CategoryDTO? selectedCategory;
  ActivityDTO? activity;

  @override
  void initState() {
    BlocProvider.of<ActivitiesCubit>(context).activities(
      categoryId: widget.categories?.first.id ?? 0,
    );
    selectedCategory = widget.categories?.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<ActivitiesCubit, ActivitiesState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => CustomLoadingOverlayWidget(),
              loaded: (result) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(29),
                    Text(
                      'Выберите секцию',
                      style: AppTextStyles.title22BoldW700.copyWith(
                        color: AppColors.blac151619,
                      ),
                    ),
                    const Gap(20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: (widget.categories ?? []).map((category) {
                          final isSelected =
                              selectedCategory?.id == category.id;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = category;
                                selectedSection = null;
                              });

                              context.read<ActivitiesCubit>().activities(
                                    categoryId: category.id ?? 0,
                                  );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 14),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.k26007AFF
                                    : AppColors.backgroundButtonF5F5F5,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    category.title ?? '',
                                    style: AppTextStyles.body14W500.copyWith(
                                      color: isSelected
                                          ? AppColors.muteBlue1890FF
                                          : AppColors.text595959,
                                    ),
                                  ),
                                  const Gap(10),
                                  SvgPicture.asset(
                                    Assets.icons.dayGreen.path,
                                    width: 18,
                                    height: 18,
                                    color: isSelected
                                        ? AppColors.muteBlue1890FF
                                        : AppColors.text595959,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: result.length,
                        itemBuilder: (context, index) {
                          final section = result[index];
                          final isSelected = selectedSection == section.title;
                          activity = section;
                          return GestureDetector(
                            onTap: () {
                              setState(() => selectedSection = section.title);
                              selectedSection = section.title;
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.inputTextFildEAECED,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    section.title ?? '',
                                    style: AppTextStyles.title16W400.copyWith(
                                      color: AppColors.text434343,
                                    ),
                                  ),
                                  isSelected
                                      ? SvgPicture.asset(
                                          Assets.icons.genderSelected.path)
                                      : SvgPicture.asset(
                                          Assets.icons.genferNotSeleceted.path),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                        color: selectedSection != null
                            ? AppColors.mainColor
                            : AppColors.backgroundButtonF5F5F5,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: CustomMaterialButton(
                        onTap: selectedSection == null
                            ? null
                            : () {
                                context.router.push(ListingRoute(
                                  titleSection: selectedSection ?? '',
                                  titleCategory: selectedCategory?.title ?? '',
                                  activity: activity,
                                ));
                              },
                        child: Center(
                          child: Text(
                            'Готово',
                            style: AppTextStyles.body18w600.copyWith(
                              color: selectedSection != null
                                  ? AppColors.white
                                  : AppColors.grey898D8F,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(40),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
