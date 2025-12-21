import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart' show Assets;
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/theme/resources.dart';

class ChooseLanguageBottomSheet extends StatefulWidget {
  const ChooseLanguageBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const ChooseLanguageBottomSheet(),
    );
  }

  @override
  State<ChooseLanguageBottomSheet> createState() =>
      _ChooseLanguageBottomSheetState();
}

class _ChooseLanguageBottomSheetState extends State<ChooseLanguageBottomSheet> {
  String? selectedLanguage;

  final List<String> languages = ['Қазақ тілі', 'Русский', 'English'];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.85,
      minChildSize: 0.5,
      initialChildSize: 0.50,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 29),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(
                'Язык',
                style: AppTextStyles.title22BoldW700.copyWith(color: AppColors.blac151619),
              ),
              const Gap(15),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    final isSelected = selectedLanguage == language;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLanguage = language;
                        });
                      },
                      child: Container(
                        height: 52,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColors.inputTextFildEAECED,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              language,
                              style: AppTextStyles.title16W400.copyWith(color: AppColors.text434343),
                            ),
                            SvgPicture.asset(
                              isSelected
                                  ? Assets.icons.genderSelected.path
                                  : Assets.icons.genferNotSeleceted.path,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              CustomButton(
                // allowTapButton: _allowTapButton,
                onPressed: () {
                  // context.router.push(const MyChildrenRoute());
                },
                style: CustomButtonStyles.mainButtonStyle(context).copyWith(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    selectedLanguage != null
                        ? AppColors.mainColor
                        : AppColors.backgroundButtonF5F5F5,
                  ),
                  foregroundColor: WidgetStatePropertyAll(
                    selectedLanguage != null
                        ? AppColors.white
                        : AppColors.foregroundTextButoonWhenIsnotAllowed,
                  ),
                ),
                text: 'Готово',
                child: null,
              ),
              const Gap(15),
            ],
          ),
        );
      },
    );
  }
}
