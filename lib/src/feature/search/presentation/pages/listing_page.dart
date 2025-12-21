import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/feature/search/bloc/center_activity_cubit.dart';
import 'package:ikidz/src/feature/search/model/schedule_dto.dart';
import 'package:ikidz/src/feature/search/presentation/widgets/listing_container.dart';

@RoutePage()
class ListingPage extends StatefulWidget implements AutoRouteWrapper {
  final String titleSection;
  final String titleCategory;
  final ActivityDTO? activity;

  const ListingPage({
    super.key,
    required this.titleSection,
    required this.titleCategory,
    this.activity,
  });

  @override
  State<ListingPage> createState() => _ListingPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => CenterActivityCubit(
        repository: context.repository.searchRepository,
      ),
      child: this,
    );
  }
}

class _ListingPageState extends State<ListingPage> {
  List<ScheduleDTO> selectedSections = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CenterActivityCubit>(context).centerActivity(
        centerActivityId: widget.activity?.id ?? 0,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.titleCategory,
          style: AppTextStyles.title20BoldW600.copyWith(
            color: AppColors.tabActive,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CenterActivityCubit, CenterActivityState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => CustomLoadingOverlayWidget(),
            loaded: (result) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(12),
                      Container(
                        padding: const EdgeInsets.only(
                          right: 12,
                          left: 12,
                          top: 8,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x2B007AFF),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.titleSection,
                              style: AppTextStyles.body14w400.copyWith(
                                color: const Color(0xFF1890FF),
                              ),
                            ),
                            const Gap(10),
                            const Icon(
                              Icons.close,
                              color: Color(0xFF1890FF),
                            ),
                          ],
                        ),
                      ),
                      Gap(20),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Gap(16),
                        itemCount: result.length,
                        itemBuilder: (context, index) {
                          return ListingConteynerWidget(
                            center: result[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
