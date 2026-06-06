import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/theme/resources.dart';

class DocumentHtmlPage extends StatelessWidget {
  const DocumentHtmlPage({
    super.key,
    required this.title,
    required this.htmlContent,
  });

  final String title;
  final String htmlContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).maybePop(),
          label: SvgPicture.asset(
            Assets.icons.backArrow.path,
            color: AppColors.black,
            height: 25,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.title20BoldW600
              .copyWith(color: AppColors.tabActive),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: HtmlWidget(htmlContent),
      ),
    );
  }
}
