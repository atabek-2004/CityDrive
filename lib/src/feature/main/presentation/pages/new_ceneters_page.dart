import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/main/bloc/centers_cubit.dart';
import 'package:ikidz/src/feature/main/model/main_dto.dart';
import 'package:ikidz/src/feature/main/presentation/main_feed.dart';
import 'package:ikidz/src/feature/search/presentation/widgets/hall_contayner_widget.dart';

@RoutePage()
class NewCenetersPage extends StatefulWidget implements AutoRouteWrapper {
  const NewCenetersPage({super.key});

  @override
  State<NewCenetersPage> createState() => _NewCenetersPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => CentersCubit(
        repository: context.repository.mainRepository,
      ),
      child: this,
    );
  }
}

class _NewCenetersPageState extends State<NewCenetersPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CentersCubit>(context).centers(perPage: 0);
    });

    super.initState();
  }

  final news = [
    NewsDTO(
      title: 'Ремент улицы Абая',
      description:
          'Ремент улицы Абая с 15 по 30 ноября перекрыта правая поласа',
      imageUrl: Assets.images.png.news.path,
      createdAt: '2 дня назад',
    ),
    NewsDTO(
      title: 'Ремент улицы Кабанбай батыра',
      description:
          'Ремент улицы Абая с 15 по 30 ноября перекрыта правая поласа',
      imageUrl: Assets.images.png.newsSecond.path,
      createdAt: '2 дня назад',
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
          'Новости',
          style: AppTextStyles.title20BoldW600
              .copyWith(color: AppColors.tabActive),
        ),
      ),
      body: ListView.builder(
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
          }),
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
