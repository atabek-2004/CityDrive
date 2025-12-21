import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:intl/intl.dart';

class HorizontalWeekCalendar extends StatefulWidget {
  final ValueChanged<DateTime> onDateSelected;
  const HorizontalWeekCalendar({
    super.key,
    required this.onDateSelected,
  });

  @override
  State<HorizontalWeekCalendar> createState() => _HorizontalWeekCalendarState();
}

class _HorizontalWeekCalendarState extends State<HorizontalWeekCalendar> {
  DateTime selectedDate = DateTime.now();

  List<DateTime> getCurrentWeekDays() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final weekDays = getCurrentWeekDays();
    final monthName = DateFormat.MMMM('ru_RU').format(selectedDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          monthName[0].toUpperCase() + monthName.substring(1),
          style: AppTextStyles.body14w400.copyWith(
            color: AppColors.text090909,
          ),
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: weekDays.map((day) {
            final isSelected =
                day.day == selectedDate.day && day.month == selectedDate.month;

            return GestureDetector(
              onTap: () {
                setState(() => selectedDate = day);
                widget.onDateSelected(day);
              },
              child: Container(
                width: 44,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.mainColor
                      : AppColors.backgroundButtonF5F5F5,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      DateFormat.E('ru_RU').format(day).substring(0, 2),
                      style: AppTextStyles.body12W400.copyWith(
                        color:
                            isSelected ? AppColors.white : AppColors.text090909,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      '${day.day}',
                      style: isSelected
                          ? AppTextStyles.title16W800.copyWith(
                              color: AppColors.white,
                            )
                          : AppTextStyles.title16W400.copyWith(
                              color: AppColors.text090909,
                            ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
