import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/constant/localization/locale_util.dart';
import 'package:city_drive/src/core/constant/localization/localization.dart';
import 'package:city_drive/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:city_drive/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/auth/models/request/user_payload.dart';
import 'package:city_drive/src/feature/settings/bloc/app_settings_bloc.dart';
import 'package:city_drive/src/feature/settings/widget/settings_scope.dart';

class ChooseLanguageBottomSheet extends StatefulWidget {
  const ChooseLanguageBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet<void>(
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
  late String selectedLanguage;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final locale =
        SettingsScope.settingsOf(context, listen: false).locale ??
            Localization.defaultLocale;
    selectedLanguage = LocaleUtil.labelFromLocale(locale);
  }

  Future<void> _applyLanguage() async {
    if (_saving) return;

    final locale = LocaleUtil.localeFromLabel(selectedLanguage);
    setState(() => _saving = true);

    try {
      final updatedUser = await context.repository.profileRepository.editProfile(
        payload: UserPayload(lang: locale.languageCode),
      );
      await context.repository.authRepository.updateStoredUser(updatedUser);

      final settings = SettingsScope.settingsOf(context, listen: false);
      SettingsScope.of(context).add(
        AppSettingsEvent.updateAppSettings(
          appSettings: settings.copyWith(locale: locale),
        ),
      );
      Localization.load(locale);

      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        Toaster.showErrorTopShortToast(context, e.toString());
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;

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
                l10n.language,
                style: AppTextStyles.title22BoldW700
                    .copyWith(color: AppColors.blac151619),
              ),
              const Gap(15),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: LocaleUtil.labels.length,
                  itemBuilder: (context, index) {
                    final language = LocaleUtil.labels[index];
                    final isSelected = selectedLanguage == language;
                    return GestureDetector(
                      onTap: _saving
                          ? null
                          : () => setState(() => selectedLanguage = language),
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
                              style: AppTextStyles.title16W400
                                  .copyWith(color: AppColors.text434343),
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
                onPressed: _saving ? null : _applyLanguage,
                style: CustomButtonStyles.mainButtonStyle(context).copyWith(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.mainColor),
                  foregroundColor:
                      const WidgetStatePropertyAll(AppColors.white),
                ),
                text: _saving ? '...' : l10n.save,
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
