import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/presentation/widgets/textfields/custom_textfield.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/search/bloc/search_section_cubit.dart';
import 'package:ikidz/src/feature/search/presentation/widgets/hall_contayner_widget.dart';

@RoutePage()
class SearchActivePage extends StatefulWidget implements AutoRouteWrapper {
  const SearchActivePage({super.key});

  @override
  State<SearchActivePage> createState() => _SearchActivePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchSectionCubit(repository: context.repository.searchRepository)
            ..searchSection(q: ''),
      child: this,
    );
  }
}

class _SearchActivePageState extends State<SearchActivePage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  final colors = [
    const Color(0xFF90D72F),
    const Color(0xFFFAAD14),
    const Color(0xFF91D5FF),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              Text(
                'Поиск',
                style: AppTextStyles.title24w600.copyWith(
                  color: AppColors.text090909,
                ),
              ),
              const Gap(16),
              CustomTextField(
                height: 48,
                autofocus: true,
                controller: _searchController,
                prefixIcon: Assets.icons.searchActive.path,
                hintText: 'Найти секцию...',
                hintStyle: AppTextStyles.body16w400.copyWith(
                  color: AppColors.grey898D8F,
                ),
                focusNode: _focusNode,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFECECEC),
                    width: 1,
                  ),
                ),
                onChanged: (text) {
                  BlocProvider.of<SearchSectionCubit>(context)
                      .searchSection(q: text);
                  setState(() {});
                },
              ),
              const Gap(16),
              Expanded(
                child: BlocBuilder<SearchSectionCubit, SearchSectionState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const Center(
                        child: CustomLoadingOverlayWidget(),
                      ),
                      loading: () => const Center(
                        child: CustomLoadingOverlayWidget(),
                      ),
                      loaded: (result) {
                        if (result.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 64,
                                  color: AppColors.grey898D8F.withOpacity(0.5),
                                ),
                                const Gap(16),
                                Text(
                                  _searchController.text.isEmpty
                                      ? 'Введите запрос для поиска'
                                      : 'Ничего не найдено',
                                  style: AppTextStyles.body16w400.copyWith(
                                    color: AppColors.grey898D8F,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.separated(
                          separatorBuilder: (context, index) => const Gap(10),
                          itemCount: result.length,
                          itemBuilder: (context, index) {
                            final center = result[index];
                            final color = colors[index % colors.length];
                            return HallContaynerWidget(
                              center: center,
                              color: color,
                              onTap: () => context.router.push(
                                HallDetailsRoute(ceterId: center.id ?? 0),
                              ),
                            );
                          },
                        );
                      },
                      error: (message) => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}