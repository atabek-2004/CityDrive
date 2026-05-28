import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/app/presentation/widgets/base_tabs.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayColor: AppColors.barrierColor,
      overlayWidgetBuilder: (progress) => const CustomLoadingOverlayWidget(),
      child: AutoTabsScaffold(
        routes: const [
          MainRouteFirst(),
          MapRoute(),

          MyResponsesRoute(),
          // MyResponsesRoute(),
          // ScheduleRoute(),
          ProfileRoute(),
        ],
        // appBarBuilder: (context, tabsRouter) => switch (tabsRouter.activeIndex) {
        //   0 => AppBar(
        //       centerTitle: true,
        //       title: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           const Gap(36),
        //           const Text(
        //             'Мои заказы',
        //             style: AppTextStyles.bodyTitleSemibold16W700,
        //             textAlign: TextAlign.center,
        //           ),
        //           GestureDetector(
        //             onTap: () {},
        //             child: SvgPicture.asset(
        //               Assets.icons.icChat.path,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   1 => AppBar(
        //       title: const Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text(
        //             'Мои товары',
        //             style: AppTextStyles.bodyTitleSemibold16W700,
        //             textAlign: TextAlign.center,
        //           ),
        //         ],
        //       ),
        //     ),
        //   2 => AppBar(
        //       title: const Text(
        //         'Профиль',
        //         style: AppTextStyles.bodyTitleSemibold16W700,
        //       ),
        //     ),
        //   // TODO: Handle this case.
        //   int() => throw UnimplementedError(),
        // },

        transitionBuilder: (context, child, animation) {
          return PageTransitionSwitcher(
            duration: const Duration(seconds: 2),
            reverse: true,
            transitionBuilder: (
              Widget child,
              Animation<double> animation1,
              Animation<double> secondaryAnimation,
            ) {
              return FadeThroughTransition(
                fillColor: Colors.transparent,
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: child,
          );
        },
        bottomNavigationBuilder: (context, tabsRouter) => BaseBottomNavbar(
          tabController: _tabController,
          tabsRouter: tabsRouter,
        ),
      ),
    );
  }
}

class BaseBottomNavbar extends StatefulWidget {
  const BaseBottomNavbar({
    super.key,
    required this.tabsRouter,
    required this.tabController,
  });
  final TabsRouter tabsRouter;
  final TabController tabController;

  @override
  State<BaseBottomNavbar> createState() => _BaseBottomNavbarState();
}

class _BaseBottomNavbarState extends State<BaseBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 4,
        bottom: MediaQuery.viewPaddingOf(context).bottom,
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
            blurRadius: 80,
          ),
        ],
      ),
      child: TabBar(
        labelColor: AppColors.mainColor,
        tabAlignment: TabAlignment.fill,
        // textScaler: const TextScaler.linear(0.7),
        controller: widget.tabController,
        // automaticIndicatorColorAdjustment: false,
        enableFeedback: true,
        dividerHeight: 0,
        indicatorColor: Colors.white,
        // indicatorSize: TabBarIndicatorSize.tab,
        // indicator: TabDotIndicator(),
        onTap: (value) {
          // HapticFeedback.lightImpact();

          if (widget.tabsRouter.activeIndex == value) {
            widget.tabsRouter.maybePopTop();
          } else {
            widget.tabsRouter.setActiveIndex(value);
          }
        },
        tabs: [
          CustomTabWidget(
            icon: Assets.icons.homeNotActive.path,
            activeIcon: Assets.icons.home.path,
            title: 'Главная',
            currentIndex: widget.tabController.index,
            tabIndex: 0,
          ),
          CustomTabWidget(
            icon: Assets.icons.map.path,
            activeIcon: Assets.icons.map.path,
            title: 'Карта',
            currentIndex: widget.tabController.index,
            tabIndex: 1,
          ),
          CustomTabWidget(
            icon: Assets.icons.addPlus.path,
            activeIcon: Assets.icons.closeIcon1.path,
            title: 'Мои отметки',
            currentIndex: widget.tabController.index,
            tabIndex: 2,
          ),
          CustomTabWidget(
            icon: Assets.icons.profileActive.path,
            activeIcon: Assets.icons.profileInActive.path,
            title: context.localized.profile,
            currentIndex: widget.tabController.index,
            tabIndex: 3,
          ),

          // CustomTabWidget(
          //   icon: Assets.icons.scheduleActive.path,
          //   activeIcon: Assets.icons.scheduleInActive.path,
          //   title: 'Расписание',
          //   currentIndex: widget.tabController.index,
          //   tabIndex: 3,
          // ),
          // CustomTabWidget(
          //   icon: Assets.icons.profileActive.path,
          //   activeIcon: Assets.icons.profileInActive.path,
          //   title: context.localized.profile,
          //   currentIndex: widget.tabController.index,
          //   tabIndex: 4,
          // ),
        ],
      ),
    );
  }
}
