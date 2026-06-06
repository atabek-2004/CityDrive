import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:city_drive/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/core/utils/layout/url_util.dart';
import 'package:city_drive/src/feature/profile/bloc/document_list_cubit.dart';
import 'package:city_drive/src/feature/profile/models/document_dto.dart';
import 'package:city_drive/src/feature/profile/presentation/pages/document_html_page.dart';

@RoutePage()
class DocumentsPage extends StatefulWidget implements AutoRouteWrapper {
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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadDocuments());
  }

  void _loadDocuments() {
    if (!mounted) return;
    context.read<DocumentListCubit>().getDocumentsList(
          languageCode: context.currentLocale.languageCode,
        );
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
          context.localized.documents,
          style: AppTextStyles.title20BoldW600
              .copyWith(color: AppColors.tabActive),
        ),
      ),
      body: BlocBuilder<DocumentListCubit, DocumentListState>(
        builder: (context, state) {
          return state.when(
            initial: () => const CustomLoadingOverlayWidget(),
            loading: () => const CustomLoadingOverlayWidget(),
            loaded: (documentDTO) {
              if (documentDTO.isEmpty) {
                return Center(
                  child: Text(context.localized.emptyHereForNow),
                );
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Gap(12),
                  itemCount: documentDTO.length,
                  itemBuilder: (context, index) {
                    return _DocumentRow(document: documentDTO[index]);
                  },
                ),
              );
            },
            error: (message) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body16w400.copyWith(
                        color: AppColors.text595959,
                      ),
                    ),
                    const Gap(16),
                    CustomButton(
                      onPressed: _loadDocuments,
                      style: CustomButtonStyles.mainButtonStyle(context)
                          .copyWith(
                        backgroundColor:
                            const WidgetStatePropertyAll(AppColors.mainColor),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      text: 'Повторить',
                      child: null,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _DocumentRow extends StatelessWidget {
  const _DocumentRow({required this.document});

  final DocumentDTO document;

  Future<void> _openDocument(BuildContext context) async {
    if (document.type == 'url') {
      final link = document.url ?? document.content;
      if (link != null &&
          (link.startsWith('http://') || link.startsWith('https://'))) {
        await UrlUtil.launch(context, url: link);
      }
      return;
    }

    if (document.type == 'html') {
      final html = document.content;
      if (html == null || html.isEmpty) return;

      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => DocumentHtmlPage(
            title: document.title ?? '',
            htmlContent: html,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openDocument(context),
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
            Expanded(
              child: Text(
                document.title ?? '',
                style: AppTextStyles.fs14w400,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
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
