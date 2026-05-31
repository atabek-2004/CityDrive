import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/profile/bloc/document_list_cubit.dart';
import 'package:url_launcher/url_launcher.dart' as UrlUtil;

@RoutePage()
class DocumentsPage extends StatefulWidget implements AutoRouteWrapper {
  // final List<DocumentsDTO> documents;
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DocumentListCubit(repository: context.repository.profileRepository),
      child: this,
    );
  }
}

class _DocumentsPageState extends State<DocumentsPage> {
  @override
  void initState() {
    BlocProvider.of<DocumentListCubit>(context).getDocumentsList();
    super.initState();
  }

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
          'Документы',
          style: AppTextStyles.title20BoldW600
              .copyWith(color: AppColors.tabActive),
        ),
      ),
      body: BlocBuilder<DocumentListCubit, DocumentListState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const CustomLoadingOverlayWidget(),
            loaded: (documentDTO) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: documentDTO.isEmpty
                    ? Center(
                        child: Text(context.localized.emptyHereForNow),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) => const Gap(12),
                        itemCount: documentDTO.length,
                        itemBuilder: (context, index) {
                          return _Container(
                            text: documentDTO[index].title ?? "",
                            index: documentDTO[index].id ?? 1,
                          );
                        },
                      ),
              );
            },
          );
        },
      ),
    );
  }
}

class _Container extends StatelessWidget {
  final int index;
  final String text;

  const _Container({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // UrlUtil.launch(context, url: url);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFF5F5F5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: AppTextStyles.fs14w400),
            SvgPicture.asset(
              Assets.icons.arrowIos.path,
              width: 16,
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
