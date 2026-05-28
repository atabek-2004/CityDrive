import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/constants.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_material_button.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/presentation/widgets/scroll/pull_to_refresh_widgets.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/core/utils/image_util.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/main/bloc/banners_cubit.dart';
import 'package:ikidz/src/feature/main/bloc/categories_cubit.dart';
import 'package:ikidz/src/feature/main/bloc/centers_cubit.dart';
import 'package:ikidz/src/feature/search/presentation/widgets/hall_contayner_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsDTO {
  final String title;
  final String description;
  final String imageUrl;
  final String createdAt;

  NewsDTO({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });
}

@RoutePage()
class MainPageFirst extends StatefulWidget implements AutoRouteWrapper {
  const MainPageFirst({super.key});

  @override
  State<MainPageFirst> createState() => _MainPageFirstState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => CategoriesCubit(
        //     repository: context.repository.mainRepository,
        //   ),
        // ),
        BlocProvider(
          create: (context) => CentersCubit(
            repository: context.repository.mainRepository,
          ),
        ),
        // BlocProvider(
        //   create: (context) => BannersCubit(
        //     repository: context.repository.mainRepository,
        //   ),
        // ),
      ],
      child: this,
    );
  }
}

class _MainPageFirstState extends State<MainPageFirst> {
  final RefreshController _refreshController = RefreshController();
  int currentIndex = 0;

  final colors = [
    const Color(0xFF90D72F),
    const Color(0xFFFAAD14),
    const Color(0xFF91D5FF),
  ];

  final news = [
    NewsDTO(
      title: 'Ремонт улицы Абая',
      description:
          'Ремонт улицы Абая с 15 по 30 ноября перекрыта правая поласа',
      imageUrl: Assets.images.png.news.path,
      createdAt: '2 дня назад',
    ),
    NewsDTO(
      title: 'Ремонт улицы Абая',
      description:
          'Ремонт улицы Абая с 15 по 30 ноября перекрыта правая поласа',
      imageUrl: Assets.images.png.news.path,
      createdAt: '2 дня назад',
    ),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // BlocProvider.of<CategoriesCubit>(context).categories();
      BlocProvider.of<CentersCubit>(context).centers(perPage: 3);
      // BlocProvider.of<BannersCubit>(context).banners();
    });

    super.initState();
  }

  final images = [
    Assets.images.png.onBoardThree.path,
    Assets.images.png.onboardTwo.path,
    Assets.images.png.onboardOne.path,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SmartRefresher(
        header: const RefreshClassicHeader(),
        controller: _refreshController,
        onRefresh: () {
          _refreshController.refreshCompleted();
        },
        child: CustomScrollView(
          slivers: [
            SliverList.list(
              children: [
                /// Header (images)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        Assets.images.png.logo.path,
                        width: 63,
                        height: 63,
                      ),
                      GestureDetector(
                        onTap: () =>
                            context.router.push(const NotificationRoute()),
                        child: Image.asset(
                          Assets.images.png.mainFeedRightAppBar.path,
                          width: 44,
                          height: 44,
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(8),

                /// Баннер
                Container(
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          height: double.infinity,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                        items: images
                            .map(
                              (item) => ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                  height: 430,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      // if (currentIndex == 0)
                      //   Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 16),
                      //     child: Column(
                      //       crossAxisAlignment:
                      //           CrossAxisAlignment.start,
                      //       mainAxisAlignment:
                      //           MainAxisAlignment.spaceAround,
                      //       children: [
                      //         Text(
                      //           'Абонемент\n1-6-9-12\nмесяцев(0–16 лет)',
                      //           style: AppTextStyles
                      //               .title20BoldW600
                      //               .copyWith(
                      //                   color:
                      //                       AppColors.white),
                      //         ),
                      //         Container(
                      //           width: 152,
                      //           height: 40,
                      //           decoration: BoxDecoration(
                      //             color: AppColors.white,
                      //             borderRadius:
                      //                 BorderRadius.circular(
                      //                     16),
                      //           ),
                      //           child: CustomMaterialButton(
                      //             onTap: () {
                      //               context.router.push(
                      //                   const SubscriptionRoute());
                      //             },
                      //             child: Center(
                      //               child: Text(
                      //                 'Купить абонемент',
                      //                 style: AppTextStyles
                      //                     .body14w500
                      //                     .copyWith(
                      //                         color: AppColors
                      //                             .black000000),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                    ],
                  ),
                ),

                const Gap(8),
                DotsIndicator(
                  dotsCount: images.length,
                  position: currentIndex.toDouble(),
                  decorator: const DotsDecorator(
                    spacing: EdgeInsets.symmetric(horizontal: 4),
                    activeColor: Color(0xFF000100),
                    color: AppColors.greyText,
                  ),
                ),

                // new centers

                const Gap(44),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Новости',
                        style: AppTextStyles.fs18w600.copyWith(
                          color: AppColors.text090909,
                        ),
                      ),
                      CustomMaterialButton(
                        onTap: () {
                          context.router.push(const NewCenetersRoute());
                        },
                        child: Text(
                          'См все',
                          style: AppTextStyles.body15w500.copyWith(
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    final item = news[index];
                    return Column(
                      children: [
                        const Gap(10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8),
                                ),
                                child: Image.asset(
                                  item.imageUrl,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: double.infinity,
                                      height: 200,
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.image, size: 50),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const Gap(8),
                                    Text(
                                      item.description,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                        height: 1.4,
                                      ),
                                    ),
                                    const Gap(12),
                                    Text(
                                      item.createdAt,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryContaeyner(
      {required String icon, required String text, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(icon, width: 46, height: 46),
          const Gap(15),
          Text(
            text,
            style: AppTextStyles.body12w400.copyWith(
              color: AppColors.text1D1D21,
            ),
          ),
        ],
      ),
    );
  }

  Color hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }
}
