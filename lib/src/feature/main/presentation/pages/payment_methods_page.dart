import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_material_button.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/main/presentation/widgets/payment_cotainer.dart';

@RoutePage()
class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
          'Способы оплаты',
          style: AppTextStyles.title20BoldW600
              .copyWith(color: AppColors.tabActive),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CustomMaterialButton(
              onTap: () {
                context.router.push(const ChangeCardRoute());
              },
              child: Text(
                'Изменить',
                style: AppTextStyles.body14w400
                    .copyWith(color: AppColors.muteBlue1890FF),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            PaymentCotainer(
              text: 'Visa',
              number: '****6767',
              pngPath: Assets.images.png.visa.path,
            ),
            const Gap(8),
            PaymentCotainer(
              text: 'Master card',
              number: '****6767',
              pngPath: Assets.images.png.master.path,
            ),
            const Gap(12),
            CustomMaterialButton(
              onTap: () {
                context.router.push(const PaymentWasSuccessfulRoute());
              },
              materialColor: AppColors.redF5222D,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.images.png.kaspi.path,
                    width: 43,
                    height: 51,
                  ),
                  const Gap(12),
                  Text(
                    'Kaspi.kz',
                    style: AppTextStyles.body18w700.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(22),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: CustomMaterialButton(
                onTap: () {
                  context.router.push(const AddCardRoute());
                },
                materialColor: AppColors.muteBlue12,
                child: Row(
                  children: [
                    const Gap(12),
                    Image.asset(
                      Assets.images.png.addCard.path,
                      width: 26,
                      height: 26,
                    ),
                    const Gap(12),
                    Text(
                      'Добавить карту',
                      style: AppTextStyles.body14w400.copyWith(
                        color: AppColors.tabActive,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
