import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/theme/resources.dart';

class AppNotification {
  final String author;
  final String message;
  final String time;

  AppNotification({
    required this.author,
    required this.message,
    required this.time,
  });
}

class NotificationGroup {
  final String title;
  final List<AppNotification> items;

  NotificationGroup({
    required this.title,
    required this.items,
  });
}

@RoutePage()
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<NotificationGroup> groups = [
    NotificationGroup(
      title: 'Сегодня',
      items: [
        AppNotification(
          author: 'Talgat',
          message: 'Осы жолдарды дұрыстау керек',
          time: '1 ч назад',
        ),
      ],
    ),
    NotificationGroup(
      title: 'Вчера',
      items: [
        AppNotification(
          author: 'Askar',
          message: 'Мынау жердің барлығы құртылған',
          time: '3 ч назад',
        ),
      ],
    ),
    NotificationGroup(
      title: '20 Авг 2025',
      items: [
        AppNotification(
          author: 'Азамат',
          message: 'Осы жолдарды дұрыстау керек',
          time: '1 ч назад',
        ),
        AppNotification(
          author: 'Адил',
          message: 'Пожалуйста разберитесь с этим',
          time: '3 ч назад',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
            'Уведомления',
            style: AppTextStyles.title20BoldW600
                .copyWith(color: AppColors.tabActive),
          ),
        ),
        body: groups.isNotEmpty
            ? ListView.builder(
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  final notification = groups[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          Text(
                            notification.title,
                            style: AppTextStyles.body14W500.copyWith(
                              color: AppColors.grey959595,
                            ),
                          ),
                          const Gap(12),
                          ...notification.items.map(
                            (notification) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Assets.images.png.notificationLittle.path,
                                    width: 42,
                                    height: 42,
                                  ),
                                  const Gap(12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              notification.author,
                                              style: AppTextStyles.body14W500
                                                  .copyWith(
                                                color: AppColors.black141414,
                                              ),
                                            ),
                                            Text(
                                              notification.time,
                                              style: AppTextStyles.body12w400
                                                  .copyWith(
                                                color: AppColors.grey646464,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Gap(4),
                                        Text(
                                          notification.message,
                                          style:
                                              AppTextStyles.body14w400.copyWith(
                                            color: AppColors.grey646464,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 53, right: 53, top: 84),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          Assets.images.png.notification.path,
                          width: 220,
                          height: 220,
                        ),
                        const Gap(8),
                        Text(
                          'У вас пока нет уведомлений',
                          style: AppTextStyles.title16W600.copyWith(
                            color: AppColors.black000100,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Gap(8),
                        Text(
                          'Здесь будут отображаться уведомления по занятиям, акциям и многое другое',
                          style: AppTextStyles.body14w400.copyWith(
                            color: AppColors.grey646464,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
