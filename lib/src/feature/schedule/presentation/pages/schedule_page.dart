import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/schedule/presentation/widgets/hall_schedule_conteyner.dart';
import 'package:ikidz/src/feature/schedule/presentation/widgets/horizontal_week_calendar_widget.dart';

@RoutePage()
class SchedulePage extends StatefulWidget  {
  const SchedulePage({super.key});

  @override
  _MyOrdersState createState() => _MyOrdersState();


}

class _MyOrdersState extends State<SchedulePage>
    with SingleTickerProviderStateMixin {
  DateTime _selectedDate = DateTime.now();

  int count = 4;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const Gap(6),
              Text(
                'Расписание',
                style: AppTextStyles.title24w600.copyWith(
                  color: AppColors.text090909,
                ),
              ),
              const Gap(8),
              count > 0
                  ? HorizontalWeekCalendar(
                      onDateSelected: (date) {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                    )
                  : const SizedBox.shrink(),
              const Gap(14),
              count > 0
                  ? ListView.separated(
                      separatorBuilder: (context, index) => const Gap(16),
                      itemCount: count,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          const HallScheduleConteyner(),
                    )
                  : Center(
                    child: Column(
                      children: [
                        Gap(MediaQuery.of(context).size.height * 0.08),
                        Image.asset(
                          Assets.images.png.scheduleEmpty.path,
                          width: 220,
                          height: 220,
                        ),
                        const Gap(8),
                        Text(
                          'Ваше расписание пустое',
                          style: AppTextStyles.title16W600.copyWith(
                            color: AppColors.black000100,
                          ),
                        ),
                        const Gap(8),
                        Text(
                          'Начните с первого шага запишитесь на\nтренировку.',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body14w400.copyWith(
                            color: AppColors.grey646464,
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ),
        ),
      );
}
