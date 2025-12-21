import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart' show Assets;
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/main/presentation/widgets/card_success_deleted_dialog.dart';
import 'package:ikidz/src/feature/main/presentation/widgets/payment_cotainer.dart';

@RoutePage()
class ChangeCardPage extends StatefulWidget {
  const ChangeCardPage({super.key});

  @override
  State<ChangeCardPage> createState() => _ChangeCardPageState();
}

class _ChangeCardPageState extends State<ChangeCardPage> {
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
          'Изменить',
          style: AppTextStyles.title20BoldW600.copyWith(
            color: AppColors.tabActive,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PaymentCotainer(
                onTap: () {
                  CardSuccessDeletedDialog.show(context);
                },
                showDeleteButton: true,
                text: 'Visa',
                number: '****6767',
                pngPath: Assets.images.png.visa.path,
              ),
              const Gap(8),
              PaymentCotainer(
                onTap: () {
                  CardSuccessDeletedDialog.show(context);
                },
                showDeleteButton: true,
                text: 'Master card',
                number: '****6767',
                pngPath: Assets.images.png.master.path,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
