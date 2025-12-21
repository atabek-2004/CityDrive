import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/search/bloc/schedule_center_cubit.dart';

@RoutePage()
class HallSchedulePage extends StatefulWidget implements AutoRouteWrapper {
  final int centerId;
  final int dayOfWeek;
  const HallSchedulePage({
    super.key,
    required this.centerId,
    required this.dayOfWeek,
  });

  @override
  State<HallSchedulePage> createState() => _HallSchedulePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleCenterCubit(
        repository: context.repository.searchRepository,
      ),
      child: this,
    );
  }
}

class _HallSchedulePageState extends State<HallSchedulePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, Map<String, int?>> selectedTimesByDay = {};

  late final List<DateTime> _dates;
  late final List<String> tabs;

  // final List<String> tabs = [
  //   'Сегодня',
  //   'Завтра',
  //   'Сб,27',
  //   'Вс,28',
  //   'Пн,29',
  //   'Вт,30',
  // ];

  final Map<String, List<String>> schedule = {
    'Верховая езда': [
      '11:00–11:45',
      '12:00–12:45',
      '14:00–14:45',
      '13:00–13:45',
      '17:00–17:45',
      '19:00–19:45',
      '20:00–20:45',
      '21:00–21:45',
    ],
    'Шахматы': [
      '11:00–11:45',
      '12:00–12:45',
      '14:00–14:45',
      '17:00–17:45',
      '19:00–19:45',
      '22:00–22:45',
    ],
  };

  bool checkScheduleTime() {
    final now = DateTime.now();

    for (final dayEntry in selectedTimesByDay.entries) {
      final day = dayEntry.key;
      final selectedSubjects = dayEntry.value;

      for (final entry in selectedSubjects.entries) {
        final subject = entry.key;
        final selectedIndex = entry.value;
        if (selectedIndex == null) continue;

        final timeText = schedule[subject]![selectedIndex];
        final startTimeString = timeText.split('–').first;
        final parts = startTimeString.split(':');
        final hour = int.parse(parts[0]);
        final minute = int.parse(parts[1]);

        DateTime selectedDay = now;
        if (day == 'Завтра') {
          selectedDay = now.add(const Duration(days: 1));
        } else if (day.contains(',')) {
          final dayNum = int.tryParse(day.split(',').last.trim());
          if (dayNum != null) {
            selectedDay = DateTime(now.year, now.month, dayNum);
          }
        }

        final selectedDateTime = DateTime(
          selectedDay.year,
          selectedDay.month,
          selectedDay.day,
          hour,
          minute,
        );

        final diff = selectedDateTime.difference(now).inHours;

        if (diff > 24) {
          return true;
        }
      }
    }

    return false;
  }

  @override
  void initState() {
    super.initState();

    _dates = List.generate(7, (index) {
      return DateTime.now().add(Duration(days: index));
    });

    tabs = _dates.map(_formatTabTitle).toList();

    _tabController = TabController(length: tabs.length, vsync: this);

    _loadScheduleForTab(0);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      _loadScheduleForTab(_tabController.index);
    });

    for (var tab in tabs) {
      selectedTimesByDay[tab] = {};
    }
  }


  String _formatTabTitle(DateTime date) {
    final now = DateTime.now();

    if (_isSameDay(date, now)) {
      return 'Сегодня';
    }

    if (_isSameDay(date, now.add(const Duration(days: 1)))) {
      return 'Завтра';
    }

    const weekDays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

    final weekDay = weekDays[date.weekday - 1];
    return '$weekDay,${date.day}';
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  void _loadScheduleForTab(int tabIndex) {
    final date = _dates[tabIndex];

    context.read<ScheduleCenterCubit>().scheduleCenter(
          id: widget.centerId,
          dayOfWeek: date.weekday,
        );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Расписание',
          style: AppTextStyles.title20BoldW600.copyWith(
            color: AppColors.tabActive,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: TextButton.icon(
          onPressed: () => context.router.maybePop(),
          label: SvgPicture.asset(
            Assets.icons.backArrow.path,
            color: AppColors.black,
            height: 25,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              isScrollable: false,
              indicatorColor: AppColors.mainColor,
              indicatorWeight: 2,
              labelColor: AppColors.mainColor,
              unselectedLabelColor: AppColors.grey646464,
              labelStyle: AppTextStyles.body13w600,
              unselectedLabelStyle: AppTextStyles.body14w400,
              tabs: tabs.map((e) => Tab(text: e)).toList(),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((day) {
          return BlocBuilder<ScheduleCenterCubit, ScheduleCenterState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const CustomLoadingOverlayWidget(),
                loaded: (result) {
                 
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...schedule.entries.map((entry) {
                            final title = entry.key;
                            final times = entry.value;

                            final selectedIndexes = selectedTimesByDay[day]!;
                            final selectedIndex = selectedIndexes[title];

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: AppTextStyles.title18W700
                                      .copyWith(color: AppColors.tabActive),
                                ),
                                const Gap(14),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 8,
                                  children:
                                      List.generate(times.length, (index) {
                                    final isSelected = selectedIndex == index;
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedTimesByDay[day]![title] =
                                              index;
                                        });
                                      },
                                      child: Container(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    32 -
                                                    12) /
                                                2,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? const Color(0x1F63B1FF)
                                              : const Color(0xFFF5F5F5),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          border: Border.all(
                                            color: isSelected
                                                ? const Color(0xFF1890FF)
                                                : Colors.transparent,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            times[index],
                                            style: AppTextStyles.body14W500
                                                .copyWith(
                                              color: AppColors.text595959,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                const Gap(24),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        }).toList(),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 40, left: 16, right: 16, top: 10),
        child: CustomButton(
          onPressed: () {
            final isTooEarly = checkScheduleTime();
            if (isTooEarly) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Запись откроется за 24 часа до начала занятия',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.title17W600.copyWith(
                          color: AppColors.black000000,
                        ),
                      ),
                      Gap(5),
                      Text(
                        'Пожалуйста, попробуйте позже',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.sz13w400.copyWith(
                          color: AppColors.black000000,
                        ),
                      ),
                      Gap(20),
                    ],
                  ),
                  actionsPadding: EdgeInsets.zero,
                  actions: [
                    const Divider(
                        height: 1, thickness: 1, color: AppColors.greyText),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          'ОК',
                          style: TextStyle(
                            color: Color(0xFF1890FF),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              context.router.push(ClassRoute());
            }
          },
          style: null,
          child: const Text(
            'Продолжить',
            style: AppTextStyles.title18MediumW600,
          ),
        ),
      ),
    );
  }
}
