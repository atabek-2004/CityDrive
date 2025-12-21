import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';

@RoutePage()
class PaymentWasSuccessfulPage extends StatefulWidget {
  const PaymentWasSuccessfulPage({super.key});

  @override
  State<PaymentWasSuccessfulPage> createState() =>
      _PaymentWasSuccessfulPageState();
}

class _PaymentWasSuccessfulPageState extends State<PaymentWasSuccessfulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: TextButton.icon(
          onPressed: () {
            context.router.maybePop();
          },
          label: SvgPicture.asset(
            Assets.icons.backArrow.path,
            color: AppColors.white,
            height: 25,
          ),
        ),
      ),
      body: Stack(
        children: [
          
          Image.asset(
            Assets.images.png.subscriptionBackg.path,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.cover,
          ),

          
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.images.png.paymentSuccess.path,
                      width: 200,
                      height: 200,
                    ),
                    Text(
                      "Оплата прошла успешно",
                      style: AppTextStyles.title20BoldW600
                          .copyWith(color: AppColors.black000000),
                    ),
                    const Gap(13),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.colorFFF7E6,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            Assets.icons.info.path,
                            height: 24,
                            width: 24,
                          ),
                          const Gap(8),
                          Expanded(
                            child: Text(
                              'Абонемент является именным и может использоваться только одним ребёнком. Передача абонемента другому лицу или использование его несколькими детьми не допускается.',
                              style: AppTextStyles.body14w400.copyWith(
                                color: const Color(0xD9000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      onPressed: () {
                        context.router.push(AddChildRoute());
                      },
                      style: null,
                      child: const Text(
                        'Присвоить подписку',
                        style: AppTextStyles.title18MediumW600,
                      ),
                    ),
                    const Gap(40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
