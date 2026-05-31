import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/profile/bloc/profile_bloc.dart';
import 'package:city_drive/src/feature/profile/presentation/pages/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:city_drive/src/feature/search/bloc/road_problems_provider.dart';
import 'package:city_drive/src/feature/search/presentation/pages/my_works_page.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';
import 'package:city_drive/src/feature/search/presentation/utils/road_problem_labels.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:city_drive/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';

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
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (!mounted) return;
    if (!_tabController.indexIsChanging && _tabController.index == 0) {
      context.read<RoadProblemsProvider>().load();
    }
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Оборачиваем в BlocProvider для ProfilePage
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: BlocProvider(
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
    final l10n = context.localized;
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
            label: l10n.main,
            isActive: currentIndex == 0,
            onTap: () => tabController.animateTo(0),
          ),
          _NavBarItem(
            icon: Icons.assignment_outlined,
            activeIcon: Icons.assignment,
            label: l10n.cityDriveMyWorks,
            isActive: currentIndex == 1,
            onTap: () => tabController.animateTo(1),
          ),
          _NavBarItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: l10n.profile,
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

// ============== ГЛАВНАЯ СТРАНИЦА КОНТРОЛЛЕРА ==============
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RoadProblemsProvider>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RoadProblemsProvider>(
      builder: (context, provider, _) {
        final pending = provider.pendingForController();
        final inWork = provider.problems
            .where((p) => p.status == 'in_progress' || p.status == 'confirmed')
            .length;
        final done =
            provider.problems.where((p) => p.status == 'fixed').length;

        return RefreshIndicator(
          onRefresh: () async {
            provider.load();
          },
          child: _MainPageBody(
            pendingCount: pending.length,
            applicationsCount: pending.length,
            inWorkCount: inWork,
            doneCount: done,
            pendingProblems: pending,
          ),
        );
      },
    );
  }
}

class _MainPageBody extends StatelessWidget {
  const _MainPageBody({
    required this.pendingCount,
    required this.applicationsCount,
    required this.inWorkCount,
    required this.doneCount,
    required this.pendingProblems,
  });

  final int pendingCount;
  final int applicationsCount;
  final int inWorkCount;
  final int doneCount;
  final List<RoadProblemDTO> pendingProblems;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;
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
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.grey),
                          const Gap(8),
                          Text(
                            l10n.cityDriveKeywords,
                            style: const TextStyle(
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
            
            Expanded(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    l10n.cityDriveAnnouncements,
                    style: const TextStyle(
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
                          count: '$pendingCount',
                          label: l10n.cityDriveNew,
                          color: Colors.red,
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: _StatCard(
                          count: '$applicationsCount',
                          label: l10n.cityDriveApplications,
                          color: Colors.purple,
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: _StatCard(
                          count: '$inWorkCount',
                          label: l10n.cityDriveInProgress,
                          color: Colors.orange,
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: _StatCard(
                          count: '$doneCount',
                          label: l10n.cityDriveDone,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),
                  
                  if (pendingProblems.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        l10n.cityDriveNoNewMarksEmpty,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey, height: 1.4),
                      ),
                    )
                  else
                    ...pendingProblems.map(
                      (p) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: GestureDetector(
                          onTap: () => context.router.push(
                            RoadProblemDetailRoute(problem: p),
                          ),
                          child: _ProblemCard(
                            problem: p,
                            title: p.title ?? l10n.cityDrivePotholeRepair,
                            address: p.address ?? l10n.cityDriveAddressNotSpecified,
                            severityLabel: severityLabel(l10n, p.severity),
                            statusLine: l10n.cityDriveUnderReview,
                            publishedTime: publishedLabel(l10n, p.reportedDate),
                            authorLine: p.author != null
                                ? l10n.cityDriveFromAuthor(p.author!)
                                : null,
                          ),
                        ),
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
    required this.problem,
    required this.title,
    required this.address,
    required this.severityLabel,
    required this.statusLine,
    required this.publishedTime,
    this.authorLine,
  });

  final RoadProblemDTO problem;
  final String title;
  final String address;
  final String severityLabel;
  final String statusLine;
  final String publishedTime;
  final String? authorLine;

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
                  severityLabel,
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
              Expanded(
                child: Text(
                  address,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          const Gap(8),
          Row(
            children: [
              const Icon(Icons.info_outline, size: 18, color: Colors.grey),
              const Gap(4),
              Text(
                statusLine,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          if (authorLine != null) ...[
            const Gap(8),
            Text(
              authorLine!,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
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
                context.router.push(RoadProblemDetailRoute(problem: problem));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                context.localized.cityDriveMoreDetails,
                style: const TextStyle(
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