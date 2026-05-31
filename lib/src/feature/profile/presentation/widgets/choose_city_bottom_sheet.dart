import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/presentation/widgets/bottomsheet/custom_drag_handle.dart';
import 'package:city_drive/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:city_drive/src/core/presentation/widgets/buttons/custom_material_button.dart';
import 'package:city_drive/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/auth/models/common_dto.dart';
import 'package:city_drive/src/feature/profile/bloc/city_cubit.dart';


class CityBottomSheet extends StatefulWidget {
  const CityBottomSheet({
    super.key,
    this.chosenCity,
  });

  final CommonDTO? chosenCity;

  @override
  State<CityBottomSheet> createState() => _CityBottomSheetState();

  static Future<CommonDTO?> show(
    BuildContext context, {
    CommonDTO? chosenCity,
  }) =>
      showModalBottomSheet<CommonDTO>(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    CityCubit(repository: context.repository.profileRepository),
              ),
            ],
            child: CityBottomSheet(
              chosenCity: chosenCity,
            ),
          );
        },
      );
}

class _CityBottomSheetState extends State<CityBottomSheet> {
  CommonDTO? selectedCity;

  @override
  void initState() {
    super.initState();
    context.read<CityCubit>().getCityList();
    selectedCity = widget.chosenCity;
  }

  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.85,
        minChildSize: 0.5,
        initialChildSize: 0.65,
        builder: (context, scrollController) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomDragHandle(isShopBottomSheet: false,),
              const Gap(6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.localized.selectCity,
                      style: AppTextStyles.title24w600),
                  CustomMaterialButton(
                    onTap: () => context.router.maybePop(),
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(Assets.icons.closeMap.path),
                  ),
                ],
              ),
              const Gap(12),
              BlocConsumer<CityCubit, CityState>(
                listener: (context, state) {
                  state.whenOrNull(
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)),
                      );
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: CustomLoadingOverlayWidget()),
                    loaded: (cities) => Flexible(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: cities.length,
                        itemBuilder: (context, index) {
                          final city = cities[index];
                          final isSelected = selectedCity?.id == city.id;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCity = city;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              height: 44,
                              margin: const EdgeInsets.only(bottom: 12),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: const Color(0x3DE9E5E5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    city.name ?? '',
                                    style: AppTextStyles.body16w400,
                                  ),
                                  SvgPicture.asset(
                                    isSelected
                                        ? Assets.icons.genderSelected.path
                                        : Assets.icons.genferNotSeleceted.path,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
              const Gap(16),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: CustomButton(
                  child: null,
                  style: CustomButtonStyles.mainButtonStyle(context),
                  onPressed: selectedCity == null
                      ? null
                      : () {
                          context.router.maybePop(selectedCity);
                        },
                  text: context.localized.selectCity,
                ),
              ),
              const Gap(30),
            ],
          ),
        ),
      );
}
