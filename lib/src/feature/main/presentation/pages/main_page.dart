import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/presentation/widgets/scroll/pull_to_refresh_widgets.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/main/bloc/news_provider.dart';
import 'package:city_drive/src/feature/main/model/news_dto.dart';
import 'package:city_drive/src/feature/search/presentation/utils/road_problem_labels.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class MainPageFirst extends StatefulWidget implements AutoRouteWrapper {
  const MainPageFirst({super.key});

  @override
  State<MainPageFirst> createState() => _MainPageFirstState();

  @override
  Widget wrappedRoute(BuildContext context) => this;
}

class _MainPageFirstState extends State<MainPageFirst> {
  final RefreshController _refreshController = RefreshController();
  int currentIndex = 0;

  final images = [
    Assets.images.png.onBoardThree.path,
    Assets.images.png.onboardTwo.path,
    Assets.images.png.onboardOne.path,
  ];

  Future<void> _onRefresh() async {
    await context.read<NewsProvider>().load();
    if (mounted) {
      _refreshController.refreshCompleted();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SmartRefresher(
        header: const RefreshClassicHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: CustomScrollView(
          slivers: [
            SliverList.list(
              children: [
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
                Container(
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: CarouselSlider(
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
                const Gap(44),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    context.localized.cityDriveNews,
                    style: AppTextStyles.fs18w600.copyWith(
                      color: AppColors.text090909,
                    ),
                  ),
                ),
                Consumer<NewsProvider>(
                  builder: (context, provider, _) {
                    if (provider.isLoading && provider.items.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(32),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    if (provider.loadError != null && provider.items.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          provider.loadError!,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      );
                    }
                    if (provider.items.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          context.localized.emptyHereForNow,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: provider.items.length,
                      itemBuilder: (context, index) {
                        final item = provider.items[index];
                        return _NewsCard(
                          item: item,
                          dateLabel: publishedLabel(
                            context.localized,
                            item.publishedAt,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({
    required this.item,
    required this.dateLabel,
  });

  final NewsDTO item;
  final String dateLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
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
                child: _NewsImage(imageUrl: item.imageUrl),
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
                      dateLabel,
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
  }
}

class _NewsImage extends StatelessWidget {
  const _NewsImage({this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    const size = Size(double.infinity, 200);
    final fallback = Image.asset(
      Assets.images.png.news.path,
      width: size.width,
      height: size.height,
      fit: BoxFit.cover,
    );

    if (imageUrl == null || imageUrl!.isEmpty) {
      return fallback;
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: size.width,
      height: size.height,
      fit: BoxFit.cover,
      placeholder: (_, __) => fallback,
      errorWidget: (_, __, ___) => fallback,
    );
  }
}
