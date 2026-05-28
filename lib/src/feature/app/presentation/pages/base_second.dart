import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/profile/bloc/profile_bloc.dart';
import 'package:ikidz/src/feature/profile/presentation/pages/profile_page.dart';
import 'package:ikidz/src/feature/search/presentation/pages/my_works_page.dart';

@RoutePage()
class BaseSecondPage extends StatefulWidget {
  const BaseSecondPage({super.key});

  @override
  _BaseSecondPageState createState() => _BaseSecondPageState();
}

class _BaseSecondPageState extends State<BaseSecondPage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Оборачиваем в BlocProvider для ProfilePage
    return BlocProvider(
      create: (context) => ProfileBLoC(
        profileRepository: context.repository.profileRepository,
        authRepository: context.repository.authRepository,
      )..add(const ProfileEvent.getProfile()),
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            MainPage(),
            MyWorksPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BaseBottomNavbar(
          tabController: _tabController,
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}

class BaseBottomNavbar extends StatelessWidget {
  const BaseBottomNavbar({
    super.key,
    required this.tabController,
    required this.currentIndex,
  });

  final TabController tabController;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8,
        bottom: MediaQuery.of(context).padding.bottom + 8,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 20,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Главная',
            isActive: currentIndex == 0,
            onTap: () => tabController.animateTo(0),
          ),
          _NavBarItem(
            icon: Icons.assignment_outlined,
            activeIcon: Icons.assignment,
            label: 'Мое работы',
            isActive: currentIndex == 1,
            onTap: () => tabController.animateTo(1),
          ),
          _NavBarItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: 'Профиль',
            isActive: currentIndex == 2,
            onTap: () => tabController.animateTo(2),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive ? AppColors.mainColor : Colors.grey,
              size: 24,
            ),
            const Gap(4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? AppColors.mainColor : Colors.grey,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============== ГЛАВНАЯ СТРАНИЦА ==============
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Хедер с поиском
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          Gap(8),
                          Text(
                            'Ключевые слова',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                    ),
                  ),
                  const Gap(12),
                  GestureDetector(
                    onTap: () {
                      context.router.push(NotificationsRoute());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Контент
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Заголовок
                  const Text(
                    'Объявлении',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(16),
                  
                  // Статистика карточки
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          count: '12',
                          label: 'Новые',
                          color: Colors.red,
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: _StatCard(
                          count: '3',
                          label: 'Заявки',
                          color: Colors.purple,
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: _StatCard(
                          count: '1',
                          label: 'В работе',
                          color: Colors.orange,
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: _StatCard(
                          count: '5',
                          label: 'Готово',
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),
                  
                  // Карточки проблем
                  _ProblemCard(
                    title: 'Ямочный ремонт',
                    address: 'ул. Абая, 150',
                    cost: '850000тг',
                    days: '30 дней',
                    status: 'Критический',
                    publishedTime: 'Опубликовано вчера',
                  ),
                  const Gap(16),
                  _ProblemCard(
                    title: 'Ямочный ремонт',
                    address: 'ул. Абая, 150',
                    cost: '5000000тг',
                    days: '30 дней',
                    status: 'Критический',
                    publishedTime: 'Опубликовано вчера',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.count,
    required this.label,
    required this.color,
  });

  final String count;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const Gap(4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProblemCard extends StatelessWidget {
  const _ProblemCard({
    required this.title,
    required this.address,
    required this.cost,
    required this.days,
    required this.status,
    required this.publishedTime,
  });

  final String title;
  final String address;
  final String cost;
  final String days;
  final String status;
  final String publishedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE5E5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Color(0xFFFF6B6B),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const Gap(12),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
              const Gap(4),
              Text(
                address,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const Gap(8),
          Row(
            children: [
              const Icon(Icons.attach_money, size: 18, color: Colors.grey),
              const Gap(4),
              Text(
                cost,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const Gap(8),
          Row(
            children: [
              const Icon(Icons.access_time, size: 18, color: Colors.grey),
              const Gap(4),
              Text(
                days,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const Gap(8),
          Text(
            publishedTime,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const Gap(16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.router.push(ProblemDetailRoute());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Подробнее',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}