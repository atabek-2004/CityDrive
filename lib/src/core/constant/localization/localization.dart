import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:city_drive/src/core/constant/localization/translations/app_localizations.dart';

/// {@template localization}
/// Localization class which is used to localize app.
/// This class provides handy methods and tools.
/// {@endtemplate}
final class Localization {
  /// {@macro localization}
  const Localization._({required this.locale});

  /// Default app language (not tied to system locale).
  static const Locale defaultLocale = Locale('ru', 'RU');

  /// List of supported locales.
  static List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  static const _delegate = AppLocalizations.delegate;

  /// List of localization delegates.
  static List<LocalizationsDelegate<void>> get localizationDelegates => [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _delegate,
      ];

  /// {@macro localization}
  static Localization? get current => _current;

  /// {@macro localization}
  static Localization? _current;

  /// Locale which is currently used.
  final Locale locale;

  /// Default locale for the app (Russian, independent of the OS language).
  static Locale computeDefaultLocale() => defaultLocale;

  /// Obtain [AppLocalizations] instance from [BuildContext].
  static AppLocalizations of(BuildContext context) =>
      AppLocalizations.of(context) ?? (throw FlutterError('No Localization found in context'));

  static late AppLocalizations _localizations;

  /// Initialize the L10n class with the correct localization
  static void load(Locale locale) {
    _localizations = lookupAppLocalizations(locale);
  }

  /// Access localized strings directly
  static AppLocalizations get currentLocalizations => _localizations;
}
