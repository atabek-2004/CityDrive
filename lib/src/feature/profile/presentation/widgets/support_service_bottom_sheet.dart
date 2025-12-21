import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/theme/resources.dart';

class SupportServiceBottomSheet extends StatelessWidget {
  const SupportServiceBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const SupportServiceBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      
      expand: false,
      initialChildSize: 0.50,
      minChildSize: 0.45,
      maxChildSize: 0.75,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 29),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Служба поддержки',
                    style: AppTextStyles.title22BoldW700.copyWith(
                      color: AppColors.blac151619,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.router.maybePop(),
                    child: SvgPicture.asset(
                      Assets.icons.closeMap.path,
                    ),
                  ),
                ],
              ),
              const Gap(36),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.images.png.whatsappIcon.path,
                        width: 80,
                        height: 80,
                      ),
                      const Gap(18),
                      Text(
                        'Нужна помощь? Нажмите сюда, чтобы связаться с нами через Whatsapp',
                        style: AppTextStyles.body17w400.copyWith(
                          color: AppColors.text595959,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
             
              CustomButton(
                onPressed: () {},
                style: CustomButtonStyles.mainButtonStyle(context).copyWith(
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.mainColor),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                text: 'Перейти',
                child: null,
              ),

              const Gap(10),
            ],
          ),
        );
      },
    );
  }
}
