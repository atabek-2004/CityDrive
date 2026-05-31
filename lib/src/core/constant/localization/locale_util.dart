import 'dart:ui';

/// Утилиты для переключения языка приложения (ru / kk / en).
abstract final class LocaleUtil {
  static const labelKk = 'Қазақ тілі';
  static const labelRu = 'Русский';
  static const labelEn = 'English';

  static const labels = [labelKk, labelRu, labelEn];

  static Locale localeFromLabel(String label) {
    switch (label) {
      case labelKk:
        return const Locale('kk');
      case labelEn:
        return const Locale('en');
      case labelRu:
      default:
        return const Locale('ru');
    }
  }

  static String labelFromLocale(Locale locale) {
    switch (locale.languageCode) {
      case 'kk':
        return labelKk;
      case 'en':
        return labelEn;
      case 'ru':
      default:
        return labelRu;
    }
  }

  static String shortLabelFromLocale(Locale locale) {
    switch (locale.languageCode) {
      case 'kk':
        return 'Қаз';
      case 'en':
        return 'Eng';
      case 'ru':
      default:
        return 'Рус';
    }
  }
}
