import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/feature/search/bloc/upcoming_events_cubit.dart';
import 'package:ikidz/src/feature/search/presentation/widgets/class_conteyner_widget.dart';

@RoutePage()
class UpcomingClassesPage extends StatefulWidget implements AutoRouteWrapper {
  const UpcomingClassesPage({super.key});

  @override
  State<UpcomingClassesPage> createState() => _UpcomingClassesPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => UpcomingEventsCubit(
        repository: context.repository.searchRepository,
      ),
      child: this,
    );
  }
}

class _UpcomingClassesPageState extends State<UpcomingClassesPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<UpcomingEventsCubit>(context).upcomingEvents(perPage: 0);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          'Ближайшие занятия',
          style: AppTextStyles.title20BoldW600
              .copyWith(color: AppColors.tabActive),
        ),
      ),
      body: BlocBuilder<UpcomingEventsCubit, UpcomingEventsState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const CustomLoadingOverlayWidget(),
            loaded: (result) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Gap(16),
                  itemCount: result?.items?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ClassConteynerWidget(
                      index: index,
                      scheduleItemsDTO: result,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
