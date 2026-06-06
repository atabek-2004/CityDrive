import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'translations/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('kk'),
    Locale('ru')
  ];

  /// No description provided for @aNewGenerationFreightTransportation.
  ///
  /// In ru, this message translates to:
  /// **'Биржа грузоперевозок нового поколения — надёжно, быстро, удобно.'**
  String get aNewGenerationFreightTransportation;

  /// No description provided for @accept.
  ///
  /// In ru, this message translates to:
  /// **'Принять'**
  String get accept;

  /// No description provided for @accountNumber.
  ///
  /// In ru, this message translates to:
  /// **'Номер счета'**
  String get accountNumber;

  /// No description provided for @accumulatedBonuses.
  ///
  /// In ru, this message translates to:
  /// **'Накопленные бонусы  '**
  String get accumulatedBonuses;

  /// No description provided for @active.
  ///
  /// In ru, this message translates to:
  /// **'Активные'**
  String get active;

  /// No description provided for @add.
  ///
  /// In ru, this message translates to:
  /// **'Добавить'**
  String get add;

  /// No description provided for @addAddress.
  ///
  /// In ru, this message translates to:
  /// **'Добавить адрес'**
  String get addAddress;

  /// No description provided for @addCargo.
  ///
  /// In ru, this message translates to:
  /// **'Добавить груз'**
  String get addCargo;

  /// No description provided for @addMore.
  ///
  /// In ru, this message translates to:
  /// **'Добавить еще'**
  String get addMore;

  /// No description provided for @addNewProduct.
  ///
  /// In ru, this message translates to:
  /// **'Добавить новый товар'**
  String get addNewProduct;

  /// No description provided for @addPhotos.
  ///
  /// In ru, this message translates to:
  /// **'Добавить фотографии'**
  String get addPhotos;

  /// No description provided for @addProduct.
  ///
  /// In ru, this message translates to:
  /// **'Добавить товар'**
  String get addProduct;

  /// No description provided for @additional.
  ///
  /// In ru, this message translates to:
  /// **'Дополнительное'**
  String get additional;

  /// No description provided for @additionalFeatures.
  ///
  /// In ru, this message translates to:
  /// **'Дополнительные характеристики'**
  String get additionalFeatures;

  /// No description provided for @addresses.
  ///
  /// In ru, this message translates to:
  /// **'Адреса'**
  String get addresses;

  /// No description provided for @advertiseProduct.
  ///
  /// In ru, this message translates to:
  /// **'Рекламировать товар'**
  String get advertiseProduct;

  /// No description provided for @advertiseYourProductWithUs.
  ///
  /// In ru, this message translates to:
  /// **'Рекламируйте свой товар с нами!'**
  String get advertiseYourProductWithUs;

  /// No description provided for @agreeText.
  ///
  /// In ru, this message translates to:
  /// **'Нажимая на кнопку “Создать аккаунт” вы соглашаетесь  с'**
  String get agreeText;

  /// No description provided for @and.
  ///
  /// In ru, this message translates to:
  /// **'и'**
  String get and;

  /// No description provided for @annualSubscription.
  ///
  /// In ru, this message translates to:
  /// **'Ежегодная подписка'**
  String get annualSubscription;

  /// The title of the application
  ///
  /// In ru, this message translates to:
  /// **'sirius Business'**
  String get appTitle;

  /// No description provided for @applicationCompletedWaitForResponses.
  ///
  /// In ru, this message translates to:
  /// **'Заявка оформлена! \nЖдите откликов'**
  String get applicationCompletedWaitForResponses;

  /// No description provided for @apply.
  ///
  /// In ru, this message translates to:
  /// **'Применить'**
  String get apply;

  /// No description provided for @areYouSureYouWantLogOutYourAccount.
  ///
  /// In ru, this message translates to:
  /// **'Вы точно хотите выйти из аккаунта ?'**
  String get areYouSureYouWantLogOutYourAccount;

  /// No description provided for @areYouSureYouWantToDeleteTheOrder.
  ///
  /// In ru, this message translates to:
  /// **'Вы действительно хотите\nудалить заказ?'**
  String get areYouSureYouWantToDeleteTheOrder;

  /// No description provided for @areYouSureYouWantToDeleteYourAccount.
  ///
  /// In ru, this message translates to:
  /// **'Вы действительно хотите удалить аккаунт?'**
  String get areYouSureYouWantToDeleteYourAccount;

  /// No description provided for @attention.
  ///
  /// In ru, this message translates to:
  /// **'Внимание'**
  String get attention;

  /// No description provided for @attentionThePlatformIsOnly.
  ///
  /// In ru, this message translates to:
  /// **'Внимание! Платформа является лишь информационной площадкой и не несет ответственности за сделки между пользователями. Перед заключением соглашений проверяйте документы и благонадежность контрагента самостоятельно.'**
  String get attentionThePlatformIsOnly;

  /// No description provided for @autoRenewal.
  ///
  /// In ru, this message translates to:
  /// **'Автопродление'**
  String get autoRenewal;

  /// No description provided for @bIK.
  ///
  /// In ru, this message translates to:
  /// **'БИК'**
  String get bIK;

  /// No description provided for @bINIIN.
  ///
  /// In ru, this message translates to:
  /// **'БИН / ИИН'**
  String get bINIIN;

  /// No description provided for @bank.
  ///
  /// In ru, this message translates to:
  /// **'Банк'**
  String get bank;

  /// No description provided for @begin.
  ///
  /// In ru, this message translates to:
  /// **'Начать'**
  String get begin;

  /// No description provided for @bin.
  ///
  /// In ru, this message translates to:
  /// **'БИН'**
  String get bin;

  /// No description provided for @bonuses.
  ///
  /// In ru, this message translates to:
  /// **'Бонусы'**
  String get bonuses;

  /// No description provided for @boxLength.
  ///
  /// In ru, this message translates to:
  /// **'Длина коробки'**
  String get boxLength;

  /// No description provided for @branchesIn.
  ///
  /// In ru, this message translates to:
  /// **'Филиалы в '**
  String get branchesIn;

  /// No description provided for @budget.
  ///
  /// In ru, this message translates to:
  /// **'Бюджет'**
  String get budget;

  /// No description provided for @businessData.
  ///
  /// In ru, this message translates to:
  /// **'Деловые данные'**
  String get businessData;

  /// No description provided for @buyPremiumSubscription.
  ///
  /// In ru, this message translates to:
  /// **'Приобретите премиум подписку, и получите доступ ко всем контактам'**
  String get buyPremiumSubscription;

  /// No description provided for @buyoutOfGoods.
  ///
  /// In ru, this message translates to:
  /// **'Выкуп товара'**
  String get buyoutOfGoods;

  /// No description provided for @call.
  ///
  /// In ru, this message translates to:
  /// **'Позвонить '**
  String get call;

  /// No description provided for @callTheNumber.
  ///
  /// In ru, this message translates to:
  /// **'Позвонить по номеру'**
  String get callTheNumber;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отменить'**
  String get cancel;

  /// No description provided for @cancel2.
  ///
  /// In ru, this message translates to:
  /// **'Отменить'**
  String get cancel2;

  /// No description provided for @cardNumber.
  ///
  /// In ru, this message translates to:
  /// **'Номер карты'**
  String get cardNumber;

  /// No description provided for @cargoReadinessDate.
  ///
  /// In ru, this message translates to:
  /// **'Дата готовности груза'**
  String get cargoReadinessDate;

  /// No description provided for @carrierProfile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль перевозчика'**
  String get carrierProfile;

  /// No description provided for @carriersWhoResponded.
  ///
  /// In ru, this message translates to:
  /// **'Откликнувшиеся перевозчики'**
  String get carriersWhoResponded;

  /// No description provided for @category.
  ///
  /// In ru, this message translates to:
  /// **'Категория'**
  String get category;

  /// No description provided for @certificateAccountAvailability.
  ///
  /// In ru, this message translates to:
  /// **'Справка о наличии счета'**
  String get certificateAccountAvailability;

  /// No description provided for @certificateRegistrationSoleProprietor.
  ///
  /// In ru, this message translates to:
  /// **'Свидетельство о регистрации ИП/ТОО'**
  String get certificateRegistrationSoleProprietor;

  /// No description provided for @certification.
  ///
  /// In ru, this message translates to:
  /// **'Сертификация'**
  String get certification;

  /// No description provided for @changeAddress.
  ///
  /// In ru, this message translates to:
  /// **'Изменить адрес'**
  String get changeAddress;

  /// No description provided for @changePhoneNumber.
  ///
  /// In ru, this message translates to:
  /// **'Изменить номер'**
  String get changePhoneNumber;

  /// No description provided for @chat.
  ///
  /// In ru, this message translates to:
  /// **'Чат'**
  String get chat;

  /// No description provided for @choose.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать'**
  String get choose;

  /// No description provided for @chooseCity.
  ///
  /// In ru, this message translates to:
  /// **'Выберите город'**
  String get chooseCity;

  /// No description provided for @chooseColor.
  ///
  /// In ru, this message translates to:
  /// **'Выберите цвет'**
  String get chooseColor;

  /// No description provided for @choose_a_city.
  ///
  /// In ru, this message translates to:
  /// **'Выберите город'**
  String get choose_a_city;

  /// No description provided for @choose_from_the_gallery.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать из галереи'**
  String get choose_from_the_gallery;

  /// No description provided for @city.
  ///
  /// In ru, this message translates to:
  /// **'Город'**
  String get city;

  /// No description provided for @clickLogin.
  ///
  /// In ru, this message translates to:
  /// **'нажмите Вход'**
  String get clickLogin;

  /// No description provided for @clickToDownload.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите чтобы загрузить '**
  String get clickToDownload;

  /// No description provided for @color.
  ///
  /// In ru, this message translates to:
  /// **'Цвет'**
  String get color;

  /// No description provided for @come_up_with_a_new_password.
  ///
  /// In ru, this message translates to:
  /// **'Придумайте новый пароль'**
  String get come_up_with_a_new_password;

  /// No description provided for @completed.
  ///
  /// In ru, this message translates to:
  /// **'Завершенные'**
  String get completed;

  /// No description provided for @completed2.
  ///
  /// In ru, this message translates to:
  /// **'Завершен'**
  String get completed2;

  /// No description provided for @confirmation1.
  ///
  /// In ru, this message translates to:
  /// **'Подтверждение соглашения с условиями использования и  '**
  String get confirmation1;

  /// No description provided for @confirmation2.
  ///
  /// In ru, this message translates to:
  /// **'Политикой Конфиденциальности. '**
  String get confirmation2;

  /// No description provided for @confirmation3.
  ///
  /// In ru, this message translates to:
  /// **'Соответственные ссылки на   '**
  String get confirmation3;

  /// No description provided for @confirmation4.
  ///
  /// In ru, this message translates to:
  /// **'ознакомление с условиями использования '**
  String get confirmation4;

  /// No description provided for @confirmation5.
  ///
  /// In ru, this message translates to:
  /// **'и политикой конфиденциальности. '**
  String get confirmation5;

  /// No description provided for @contact.
  ///
  /// In ru, this message translates to:
  /// **'Связаться'**
  String get contact;

  /// No description provided for @country.
  ///
  /// In ru, this message translates to:
  /// **'Страна'**
  String get country;

  /// No description provided for @countryOrcity.
  ///
  /// In ru, this message translates to:
  /// **'Страна или город'**
  String get countryOrcity;

  /// No description provided for @create_an_account.
  ///
  /// In ru, this message translates to:
  /// **'Создать аккаунт'**
  String get create_an_account;

  /// No description provided for @currency.
  ///
  /// In ru, this message translates to:
  /// **'Валюта'**
  String get currency;

  /// No description provided for @currencySelection.
  ///
  /// In ru, this message translates to:
  /// **'Выбор валюты'**
  String get currencySelection;

  /// No description provided for @currentAccount.
  ///
  /// In ru, this message translates to:
  /// **'Текущий счет'**
  String get currentAccount;

  /// Custom colors for the application
  ///
  /// In ru, this message translates to:
  /// **'Custom Colors'**
  String get custom_colors;

  /// No description provided for @customsClearance.
  ///
  /// In ru, this message translates to:
  /// **'Таможенное оформление'**
  String get customsClearance;

  /// No description provided for @dateReady.
  ///
  /// In ru, this message translates to:
  /// **'Дата готовности'**
  String get dateReady;

  /// No description provided for @dateReadyHint.
  ///
  /// In ru, this message translates to:
  /// **'ДД-ММ-ГГГГ'**
  String get dateReadyHint;

  /// Default themes for the application
  ///
  /// In ru, this message translates to:
  /// **'Default Themes'**
  String get default_themes;

  /// No description provided for @delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// No description provided for @deleteAccount.
  ///
  /// In ru, this message translates to:
  /// **'Удалить аккаунт'**
  String get deleteAccount;

  /// No description provided for @deleteAddress.
  ///
  /// In ru, this message translates to:
  /// **'Удалить адрес'**
  String get deleteAddress;

  /// No description provided for @deleteApplication.
  ///
  /// In ru, this message translates to:
  /// **'Удалить заявку'**
  String get deleteApplication;

  /// No description provided for @deleteOrder.
  ///
  /// In ru, this message translates to:
  /// **'Вы действительно хотите\nудалить заказ?'**
  String get deleteOrder;

  /// No description provided for @deleteProduct.
  ///
  /// In ru, this message translates to:
  /// **'Удалить товар'**
  String get deleteProduct;

  /// No description provided for @deletedProfile.
  ///
  /// In ru, this message translates to:
  /// **'Удаленный профиль'**
  String get deletedProfile;

  /// No description provided for @deliverCargo.
  ///
  /// In ru, this message translates to:
  /// **'Привезу груз'**
  String get deliverCargo;

  /// No description provided for @deliveryIsNotYetComplete.
  ///
  /// In ru, this message translates to:
  /// **'Доставка еще не завершена'**
  String get deliveryIsNotYetComplete;

  /// No description provided for @description.
  ///
  /// In ru, this message translates to:
  /// **'Описание'**
  String get description;

  /// No description provided for @didEverythingGoWell.
  ///
  /// In ru, this message translates to:
  /// **'Удобно ли всё прошло?'**
  String get didEverythingGoWell;

  /// No description provided for @didnt_get_the_code.
  ///
  /// In ru, this message translates to:
  /// **'Не получили код? '**
  String get didnt_get_the_code;

  /// No description provided for @discountedPrice.
  ///
  /// In ru, this message translates to:
  /// **'Цена со скидкой'**
  String get discountedPrice;

  /// No description provided for @doYouWantToCall.
  ///
  /// In ru, this message translates to:
  /// **'Вы действительно хотите совершить звонок?'**
  String get doYouWantToCall;

  /// No description provided for @document.
  ///
  /// In ru, this message translates to:
  /// **'Документ'**
  String get document;

  /// No description provided for @documentScan.
  ///
  /// In ru, this message translates to:
  /// **'Скан документов'**
  String get documentScan;

  /// No description provided for @documents.
  ///
  /// In ru, this message translates to:
  /// **'Документы'**
  String get documents;

  /// No description provided for @documentsAreBeingCheckedPleaseWaitForConfirmation.
  ///
  /// In ru, this message translates to:
  /// **'Документы на проверке, ожидайте подтверждения.'**
  String get documentsAreBeingCheckedPleaseWaitForConfirmation;

  /// No description provided for @dont_you_have_an_account.
  ///
  /// In ru, this message translates to:
  /// **'У вас нет аккаунта? '**
  String get dont_you_have_an_account;

  /// No description provided for @download.
  ///
  /// In ru, this message translates to:
  /// **'Загрузить'**
  String get download;

  /// No description provided for @downloadDocs.
  ///
  /// In ru, this message translates to:
  /// **'Если вы загрузите документы компании, то вы получите галочку как проверенная компания'**
  String get downloadDocs;

  /// No description provided for @downloadPdf.
  ///
  /// In ru, this message translates to:
  /// **'Скачать pdf'**
  String get downloadPdf;

  /// No description provided for @edit.
  ///
  /// In ru, this message translates to:
  /// **'Редактировать'**
  String get edit;

  /// No description provided for @editData.
  ///
  /// In ru, this message translates to:
  /// **'Редактировать данные'**
  String get editData;

  /// No description provided for @editTheProduct.
  ///
  /// In ru, this message translates to:
  /// **'Редактировать товар'**
  String get editTheProduct;

  /// No description provided for @email.
  ///
  /// In ru, this message translates to:
  /// **'Почта'**
  String get email;

  /// No description provided for @emptyHereForNow.
  ///
  /// In ru, this message translates to:
  /// **'Пока здесь пусто'**
  String get emptyHereForNow;

  /// No description provided for @enter.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get enter;

  /// No description provided for @enterAddress.
  ///
  /// In ru, this message translates to:
  /// **'Введите адрес'**
  String get enterAddress;

  /// No description provided for @enterBIKIIN.
  ///
  /// In ru, this message translates to:
  /// **'Введите БИН / ИИН'**
  String get enterBIKIIN;

  /// No description provided for @enterBin.
  ///
  /// In ru, this message translates to:
  /// **'Введите БИН'**
  String get enterBin;

  /// No description provided for @enterBudget.
  ///
  /// In ru, this message translates to:
  /// **'Введите бюджет'**
  String get enterBudget;

  /// No description provided for @enterCardNumber.
  ///
  /// In ru, this message translates to:
  /// **'Введите номер карты'**
  String get enterCardNumber;

  /// No description provided for @enterCargoReadinessDate.
  ///
  /// In ru, this message translates to:
  /// **'Введите дату готовности груза'**
  String get enterCargoReadinessDate;

  /// No description provided for @enterCity.
  ///
  /// In ru, this message translates to:
  /// **'Введите город'**
  String get enterCity;

  /// No description provided for @enterCountry.
  ///
  /// In ru, this message translates to:
  /// **'Введите страну'**
  String get enterCountry;

  /// No description provided for @enterCvv.
  ///
  /// In ru, this message translates to:
  /// **'Введите CVV'**
  String get enterCvv;

  /// No description provided for @enterData.
  ///
  /// In ru, this message translates to:
  /// **'Введите данные'**
  String get enterData;

  /// No description provided for @enterDescription.
  ///
  /// In ru, this message translates to:
  /// **'Введите описание'**
  String get enterDescription;

  /// No description provided for @enterFullName.
  ///
  /// In ru, this message translates to:
  /// **'Введите ФИО'**
  String get enterFullName;

  /// No description provided for @enterFullNameOwnerSole.
  ///
  /// In ru, this message translates to:
  /// **'Введите фио владельца ИП/ТОО'**
  String get enterFullNameOwnerSole;

  /// No description provided for @enterName.
  ///
  /// In ru, this message translates to:
  /// **'Введите наименование'**
  String get enterName;

  /// No description provided for @enterNameOrganization.
  ///
  /// In ru, this message translates to:
  /// **'Введите название организации'**
  String get enterNameOrganization;

  /// No description provided for @enterNikName.
  ///
  /// In ru, this message translates to:
  /// **'Введите название'**
  String get enterNikName;

  /// No description provided for @enterRegion.
  ///
  /// In ru, this message translates to:
  /// **'Введите регион'**
  String get enterRegion;

  /// No description provided for @enterRegistrationNumber.
  ///
  /// In ru, this message translates to:
  /// **'Введите регистрационный номер'**
  String get enterRegistrationNumber;

  /// No description provided for @enterRequirements.
  ///
  /// In ru, this message translates to:
  /// **'Введите особенности'**
  String get enterRequirements;

  /// No description provided for @enterTheAccountNumber.
  ///
  /// In ru, this message translates to:
  /// **'Введите номер счета'**
  String get enterTheAccountNumber;

  /// No description provided for @enterTheBIK.
  ///
  /// In ru, this message translates to:
  /// **'Введите БИК'**
  String get enterTheBIK;

  /// No description provided for @enterTheBank.
  ///
  /// In ru, this message translates to:
  /// **'Введите название банка'**
  String get enterTheBank;

  /// No description provided for @enterTheBonusPrice.
  ///
  /// In ru, this message translates to:
  /// **'Введите цену бонуса'**
  String get enterTheBonusPrice;

  /// No description provided for @enterTheName.
  ///
  /// In ru, this message translates to:
  /// **'Введите название'**
  String get enterTheName;

  /// No description provided for @enterThePrice.
  ///
  /// In ru, this message translates to:
  /// **'Введите цену'**
  String get enterThePrice;

  /// No description provided for @enterTheQuantity.
  ///
  /// In ru, this message translates to:
  /// **'Введите количество'**
  String get enterTheQuantity;

  /// No description provided for @enterTime.
  ///
  /// In ru, this message translates to:
  /// **'Введите время'**
  String get enterTime;

  /// No description provided for @enterTypeActivity.
  ///
  /// In ru, this message translates to:
  /// **'Введите вид деятельности'**
  String get enterTypeActivity;

  /// No description provided for @enterVolume.
  ///
  /// In ru, this message translates to:
  /// **'Введите объем (м³)'**
  String get enterVolume;

  /// No description provided for @enterWeight.
  ///
  /// In ru, this message translates to:
  /// **'Введите вес (кг)'**
  String get enterWeight;

  /// No description provided for @enterYourPhoneNumber.
  ///
  /// In ru, this message translates to:
  /// **'Введите номер телефона'**
  String get enterYourPhoneNumber;

  /// No description provided for @enter_a_new_password.
  ///
  /// In ru, this message translates to:
  /// **'Новый пароль'**
  String get enter_a_new_password;

  /// No description provided for @enter_the_code_from_the_mail.
  ///
  /// In ru, this message translates to:
  /// **'Введите 4-х значный код'**
  String get enter_the_code_from_the_mail;

  /// No description provided for @enter_the_password.
  ///
  /// In ru, this message translates to:
  /// **'Введите пароль'**
  String get enter_the_password;

  /// No description provided for @enter_your_email_address.
  ///
  /// In ru, this message translates to:
  /// **'Введите почту'**
  String get enter_your_email_address;

  /// No description provided for @enter_your_name.
  ///
  /// In ru, this message translates to:
  /// **'Введите имя'**
  String get enter_your_name;

  /// No description provided for @enter_your_phone_number.
  ///
  /// In ru, this message translates to:
  /// **'Введите номер телефона'**
  String get enter_your_phone_number;

  /// No description provided for @enter_your_surname.
  ///
  /// In ru, this message translates to:
  /// **'Введите фамилию'**
  String get enter_your_surname;

  /// No description provided for @equipment.
  ///
  /// In ru, this message translates to:
  /// **'Оборудование'**
  String get equipment;

  /// No description provided for @error.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка'**
  String get error;

  /// No description provided for @exit.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get exit;

  /// No description provided for @explore_the_app.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать в sirius — будущее мира подарков!'**
  String get explore_the_app;

  /// No description provided for @filesAreAdded.
  ///
  /// In ru, this message translates to:
  /// **'Файлы добавлены'**
  String get filesAreAdded;

  /// No description provided for @filter.
  ///
  /// In ru, this message translates to:
  /// **'Фильтр'**
  String get filter;

  /// No description provided for @find.
  ///
  /// In ru, this message translates to:
  /// **'Найти '**
  String get find;

  /// No description provided for @findCargo.
  ///
  /// In ru, this message translates to:
  /// **'Найти груз'**
  String get findCargo;

  /// No description provided for @findOutWhyYouNeedtoAdvertiseProducts.
  ///
  /// In ru, this message translates to:
  /// **'Узнайте почему нужно рекламировать товары?'**
  String get findOutWhyYouNeedtoAdvertiseProducts;

  /// No description provided for @first_add_the_stores_address.
  ///
  /// In ru, this message translates to:
  /// **'Сначала добавьте адрес магазина!'**
  String get first_add_the_stores_address;

  /// No description provided for @forgot_your_password.
  ///
  /// In ru, this message translates to:
  /// **'Забыли пароль ?'**
  String get forgot_your_password;

  /// No description provided for @foundDeliveryOutsideThePlatform.
  ///
  /// In ru, this message translates to:
  /// **'Нашел доставку вне платформы (не через эту систему).'**
  String get foundDeliveryOutsideThePlatform;

  /// No description provided for @freightExchange.
  ///
  /// In ru, this message translates to:
  /// **'Биржа грузоперевозок'**
  String get freightExchange;

  /// No description provided for @fromWhere.
  ///
  /// In ru, this message translates to:
  /// **'Откуда'**
  String get fromWhere;

  /// No description provided for @fullName.
  ///
  /// In ru, this message translates to:
  /// **'ФИО'**
  String get fullName;

  /// No description provided for @fullNameOwnerSole.
  ///
  /// In ru, this message translates to:
  /// **'ФИО владельца ИП/ТОО'**
  String get fullNameOwnerSole;

  /// No description provided for @general.
  ///
  /// In ru, this message translates to:
  /// **'Общее'**
  String get general;

  /// No description provided for @getCodeElse.
  ///
  /// In ru, this message translates to:
  /// **'Получить новый код через'**
  String get getCodeElse;

  /// No description provided for @get_it_again.
  ///
  /// In ru, this message translates to:
  /// **'Получить еще раз'**
  String get get_it_again;

  /// No description provided for @gifts_in_a_couple_of_clicks_fast_stylish_with_a_soul.
  ///
  /// In ru, this message translates to:
  /// **'Здесь вас ждут новые клиенты, удобные продажи и возможности для роста. Начните прямо сейчас!'**
  String get gifts_in_a_couple_of_clicks_fast_stylish_with_a_soul;

  /// No description provided for @giveRateTheCarrier.
  ///
  /// In ru, this message translates to:
  /// **'Поставьте оценку перевозчику'**
  String get giveRateTheCarrier;

  /// No description provided for @goThroughVerificationAndBecome.
  ///
  /// In ru, this message translates to:
  /// **'Пройдите верификацию и станьте \nпроверенным перевозчиком'**
  String get goThroughVerificationAndBecome;

  /// No description provided for @goThroughVerificationText.
  ///
  /// In ru, this message translates to:
  /// **'Пройти верификацию'**
  String get goThroughVerificationText;

  /// No description provided for @goToWhatsapp.
  ///
  /// In ru, this message translates to:
  /// **'Перейти на Whatsapp'**
  String get goToWhatsapp;

  /// No description provided for @height.
  ///
  /// In ru, this message translates to:
  /// **'Высота (м)'**
  String get height;

  /// No description provided for @howManyBonusesDoYouWantSpend.
  ///
  /// In ru, this message translates to:
  /// **'Сколько хотите потратить бонусов?'**
  String get howManyBonusesDoYouWantSpend;

  /// No description provided for @ifYouAlreadyHaveAnAccount.
  ///
  /// In ru, this message translates to:
  /// **'Если у вас есть уже аккаунт, '**
  String get ifYouAlreadyHaveAnAccount;

  /// No description provided for @inProcessing.
  ///
  /// In ru, this message translates to:
  /// **'В обработке'**
  String get inProcessing;

  /// No description provided for @income.
  ///
  /// In ru, this message translates to:
  /// **'Доход'**
  String get income;

  /// No description provided for @invalidNumberFormat.
  ///
  /// In ru, this message translates to:
  /// **'Неверный числовой формат'**
  String get invalidNumberFormat;

  /// No description provided for @invoiceForPayment.
  ///
  /// In ru, this message translates to:
  /// **'Счет на оплату'**
  String get invoiceForPayment;

  /// No description provided for @isThereAnInstallmentPlan.
  ///
  /// In ru, this message translates to:
  /// **'Есть рассрочка?'**
  String get isThereAnInstallmentPlan;

  /// No description provided for @itIsImpossible.
  ///
  /// In ru, this message translates to:
  /// **'Невозможно отправить сообщение'**
  String get itIsImpossible;

  /// No description provided for @kg.
  ///
  /// In ru, this message translates to:
  /// **'кг'**
  String get kg;

  /// No description provided for @language.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get language;

  /// No description provided for @length.
  ///
  /// In ru, this message translates to:
  /// **'Длина (м)'**
  String get length;

  /// No description provided for @link.
  ///
  /// In ru, this message translates to:
  /// **'Ссылка'**
  String get link;

  /// No description provided for @loadingPoint.
  ///
  /// In ru, this message translates to:
  /// **'Пункт погрузки'**
  String get loadingPoint;

  /// Locales for the application
  ///
  /// In ru, this message translates to:
  /// **'Locales'**
  String get locales;

  /// No description provided for @logOutYourAccount.
  ///
  /// In ru, this message translates to:
  /// **'Выйти из аккаунта'**
  String get logOutYourAccount;

  /// No description provided for @log_in_to_the_app.
  ///
  /// In ru, this message translates to:
  /// **'Вход в аккаунт'**
  String get log_in_to_the_app;

  /// No description provided for @lookingForCarrier.
  ///
  /// In ru, this message translates to:
  /// **'Ищу перевозчика'**
  String get lookingForCarrier;

  /// No description provided for @lookingForWayToStandOutInTheMarket.
  ///
  /// In ru, this message translates to:
  /// **'Ищете способ выделиться на рынке?'**
  String get lookingForWayToStandOutInTheMarket;

  /// No description provided for @mail.
  ///
  /// In ru, this message translates to:
  /// **'Почта'**
  String get mail;

  /// No description provided for @main.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get main;

  /// No description provided for @mainTypeActivity.
  ///
  /// In ru, this message translates to:
  /// **'Основной вид деятельности'**
  String get mainTypeActivity;

  /// No description provided for @moreThan100SuccessfulTransactionsDaily.
  ///
  /// In ru, this message translates to:
  /// **'Более 100 успешных сделок\nежедневно!'**
  String get moreThan100SuccessfulTransactionsDaily;

  /// No description provided for @moreThanSuccessfulTransactionsDaily.
  ///
  /// In ru, this message translates to:
  /// **'Более 100 успешных сделок \nежедневно!'**
  String get moreThanSuccessfulTransactionsDaily;

  /// No description provided for @myDocuments.
  ///
  /// In ru, this message translates to:
  /// **'Мои документы'**
  String get myDocuments;

  /// No description provided for @myOrders.
  ///
  /// In ru, this message translates to:
  /// **'Мои заказы'**
  String get myOrders;

  /// No description provided for @myProducts.
  ///
  /// In ru, this message translates to:
  /// **'Мои товары'**
  String get myProducts;

  /// No description provided for @myProfile.
  ///
  /// In ru, this message translates to:
  /// **'Мой профиль'**
  String get myProfile;

  /// No description provided for @my_orders.
  ///
  /// In ru, this message translates to:
  /// **'Мои заказы'**
  String get my_orders;

  /// No description provided for @name.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get name;

  /// No description provided for @nameImenovanie.
  ///
  /// In ru, this message translates to:
  /// **'Наименование'**
  String get nameImenovanie;

  /// No description provided for @nameOrganization.
  ///
  /// In ru, this message translates to:
  /// **'Название организации'**
  String get nameOrganization;

  /// No description provided for @neww.
  ///
  /// In ru, this message translates to:
  /// **'Новые'**
  String get neww;

  /// No description provided for @next.
  ///
  /// In ru, this message translates to:
  /// **'Далее'**
  String get next;

  /// No description provided for @no.
  ///
  /// In ru, this message translates to:
  /// **'Нет'**
  String get no;

  /// No description provided for @notRequired.
  ///
  /// In ru, this message translates to:
  /// **'Не требуется'**
  String get notRequired;

  /// No description provided for @nothingWasFound.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не найден'**
  String get nothingWasFound;

  /// No description provided for @notifications.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления'**
  String get notifications;

  /// No description provided for @numberOfProducts.
  ///
  /// In ru, this message translates to:
  /// **'Количество товаров'**
  String get numberOfProducts;

  /// No description provided for @ok.
  ///
  /// In ru, this message translates to:
  /// **'ОК'**
  String get ok;

  /// No description provided for @onlinePayment.
  ///
  /// In ru, this message translates to:
  /// **'Онлайн оплата'**
  String get onlinePayment;

  /// No description provided for @optional.
  ///
  /// In ru, this message translates to:
  /// **'Необязательный'**
  String get optional;

  /// No description provided for @order.
  ///
  /// In ru, this message translates to:
  /// **'Заказ'**
  String get order;

  /// No description provided for @orderNumber.
  ///
  /// In ru, this message translates to:
  /// **'Номер заказа'**
  String get orderNumber;

  /// No description provided for @orders.
  ///
  /// In ru, this message translates to:
  /// **'Заказы'**
  String get orders;

  /// No description provided for @pass.
  ///
  /// In ru, this message translates to:
  /// **'Пройти'**
  String get pass;

  /// No description provided for @password.
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get password;

  /// No description provided for @passwords_dont_match.
  ///
  /// In ru, this message translates to:
  /// **'Пароли не совпадают'**
  String get passwords_dont_match;

  /// No description provided for @pay.
  ///
  /// In ru, this message translates to:
  /// **'Оплатить'**
  String get pay;

  /// No description provided for @payByCard.
  ///
  /// In ru, this message translates to:
  /// **'Оплатить картой'**
  String get payByCard;

  /// No description provided for @pdfOrPhoto1.
  ///
  /// In ru, this message translates to:
  /// **'В формате PDF или фото'**
  String get pdfOrPhoto1;

  /// No description provided for @pdfOrPhoto2.
  ///
  /// In ru, this message translates to:
  /// **'не более 10МБ'**
  String get pdfOrPhoto2;

  /// No description provided for @period.
  ///
  /// In ru, this message translates to:
  /// **'Период'**
  String get period;

  /// No description provided for @personalInformation.
  ///
  /// In ru, this message translates to:
  /// **'Личные данные'**
  String get personalInformation;

  /// No description provided for @phoneNumber.
  ///
  /// In ru, this message translates to:
  /// **'Номер телефон'**
  String get phoneNumber;

  /// No description provided for @phone_number.
  ///
  /// In ru, this message translates to:
  /// **'Номер телефона'**
  String get phone_number;

  /// No description provided for @photo_selection.
  ///
  /// In ru, this message translates to:
  /// **'Выбор фото'**
  String get photo_selection;

  /// No description provided for @physicRegister.
  ///
  /// In ru, this message translates to:
  /// **'Физический'**
  String get physicRegister;

  /// No description provided for @price.
  ///
  /// In ru, this message translates to:
  /// **'Цена'**
  String get price;

  /// No description provided for @privacyPolicy.
  ///
  /// In ru, this message translates to:
  /// **'Политикой Конфиденциальности'**
  String get privacyPolicy;

  /// No description provided for @productName.
  ///
  /// In ru, this message translates to:
  /// **'Название товара'**
  String get productName;

  /// No description provided for @profile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile;

  /// No description provided for @provideCargoDetails.
  ///
  /// In ru, this message translates to:
  /// **'Укажите характеристики, чтобы получить отклики от перевозчиков'**
  String get provideCargoDetails;

  /// No description provided for @pullDownToRefresh.
  ///
  /// In ru, this message translates to:
  /// **'Потяните вниз, чтобы обновить'**
  String get pullDownToRefresh;

  /// No description provided for @pullUpToLoadTheData.
  ///
  /// In ru, this message translates to:
  /// **'Потяните вверх, чтобы загрузить данные'**
  String get pullUpToLoadTheData;

  /// No description provided for @rate.
  ///
  /// In ru, this message translates to:
  /// **'Оценить'**
  String get rate;

  /// No description provided for @rateTheCarrier.
  ///
  /// In ru, this message translates to:
  /// **'Оцените перевозчика'**
  String get rateTheCarrier;

  /// No description provided for @region.
  ///
  /// In ru, this message translates to:
  /// **'Регион'**
  String get region;

  /// No description provided for @register.
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрируйтесь'**
  String get register;

  /// No description provided for @register_two.
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get register_two;

  /// No description provided for @registration.
  ///
  /// In ru, this message translates to:
  /// **'Регистрация '**
  String get registration;

  /// No description provided for @repeat_the_password.
  ///
  /// In ru, this message translates to:
  /// **'Повторите пароль'**
  String get repeat_the_password;

  /// No description provided for @required.
  ///
  /// In ru, this message translates to:
  /// **'Требуется'**
  String get required;

  /// No description provided for @requiredFillIn.
  ///
  /// In ru, this message translates to:
  /// **'Обязательно к заполнению'**
  String get requiredFillIn;

  /// No description provided for @required_to_fill_in.
  ///
  /// In ru, this message translates to:
  /// **'Обязательно к заполнению'**
  String get required_to_fill_in;

  /// No description provided for @respond.
  ///
  /// In ru, this message translates to:
  /// **'Откликнуться'**
  String get respond;

  /// No description provided for @reviewed.
  ///
  /// In ru, this message translates to:
  /// **'Ознакомился '**
  String get reviewed;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @search.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get search;

  /// No description provided for @sec.
  ///
  /// In ru, this message translates to:
  /// **'сек'**
  String get sec;

  /// No description provided for @seeAll.
  ///
  /// In ru, this message translates to:
  /// **'См все'**
  String get seeAll;

  /// No description provided for @selectCarrierFromTheListOfRespondentsAndRate.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать перевозчика из списка откликнувшихся и оценить его.'**
  String get selectCarrierFromTheListOfRespondentsAndRate;

  /// No description provided for @selectCategory.
  ///
  /// In ru, this message translates to:
  /// **'Выберите категорию'**
  String get selectCategory;

  /// No description provided for @selectCity.
  ///
  /// In ru, this message translates to:
  /// **'Выберите город'**
  String get selectCity;

  /// No description provided for @selectCurrency.
  ///
  /// In ru, this message translates to:
  /// **'Выберите валюту'**
  String get selectCurrency;

  /// No description provided for @selectLanguage.
  ///
  /// In ru, this message translates to:
  /// **'Выберите язык'**
  String get selectLanguage;

  /// No description provided for @selectRole.
  ///
  /// In ru, this message translates to:
  /// **'Выберите роль'**
  String get selectRole;

  /// No description provided for @selectSubcategory.
  ///
  /// In ru, this message translates to:
  /// **'Выберите подкатегорию'**
  String get selectSubcategory;

  /// No description provided for @selectType.
  ///
  /// In ru, this message translates to:
  /// **'Выберите тип'**
  String get selectType;

  /// No description provided for @selectView.
  ///
  /// In ru, this message translates to:
  /// **'Выберите вид'**
  String get selectView;

  /// No description provided for @send.
  ///
  /// In ru, this message translates to:
  /// **'Отправить'**
  String get send;

  /// No description provided for @sent.
  ///
  /// In ru, this message translates to:
  /// **'Отправлен'**
  String get sent;

  /// No description provided for @sentDate.
  ///
  /// In ru, this message translates to:
  /// **'Дата отправки'**
  String get sentDate;

  /// No description provided for @shareYourExperience.
  ///
  /// In ru, this message translates to:
  /// **'Поделитесь опытом'**
  String get shareYourExperience;

  /// No description provided for @siriusDescription.
  ///
  /// In ru, this message translates to:
  /// **'Биржа грузоперевозок нового поколения — надёжно, быстро, удобно.'**
  String get siriusDescription;

  /// No description provided for @specifyTheRoute.
  ///
  /// In ru, this message translates to:
  /// **'Укажите маршрут'**
  String get specifyTheRoute;

  /// No description provided for @specifyTheRouteCharacter.
  ///
  /// In ru, this message translates to:
  /// **'Укажите маршрут, характеристики получите откликов от перевозчиков'**
  String get specifyTheRouteCharacter;

  /// No description provided for @specifyTheRouteCharacteristics.
  ///
  /// In ru, this message translates to:
  /// **'Укажите маршрут, характеристики получите откликов от перевозчиков'**
  String get specifyTheRouteCharacteristics;

  /// No description provided for @statistics.
  ///
  /// In ru, this message translates to:
  /// **'Статистика'**
  String get statistics;

  /// No description provided for @status.
  ///
  /// In ru, this message translates to:
  /// **'Статус'**
  String get status;

  /// No description provided for @subcategory.
  ///
  /// In ru, this message translates to:
  /// **'Подкатегория'**
  String get subcategory;

  /// No description provided for @successfullyUpdated.
  ///
  /// In ru, this message translates to:
  /// **'Успешно обновлено!'**
  String get successfullyUpdated;

  /// No description provided for @supportService.
  ///
  /// In ru, this message translates to:
  /// **'Cлужба поддержки'**
  String get supportService;

  /// No description provided for @surname.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия'**
  String get surname;

  /// No description provided for @termOfUse.
  ///
  /// In ru, this message translates to:
  /// **'Условиями Использования'**
  String get termOfUse;

  /// No description provided for @theMainStateRegistrationNumber.
  ///
  /// In ru, this message translates to:
  /// **'Основной государственный регистрационный номер'**
  String get theMainStateRegistrationNumber;

  /// No description provided for @theOrderHasBeenUpdatedWaitForResponses.
  ///
  /// In ru, this message translates to:
  /// **'Заказ обновлен!\nЖдите ответов'**
  String get theOrderHasBeenUpdatedWaitForResponses;

  /// No description provided for @theServiceIsTemporarilyUnavailable.
  ///
  /// In ru, this message translates to:
  /// **'Сервис временно недоступен'**
  String get theServiceIsTemporarilyUnavailable;

  /// No description provided for @the_list_is_empty.
  ///
  /// In ru, this message translates to:
  /// **'Список пуст'**
  String get the_list_is_empty;

  /// No description provided for @the_minimum_password_length_is_6.
  ///
  /// In ru, this message translates to:
  /// **'Минимальная длина пароля - 6'**
  String get the_minimum_password_length_is_6;

  /// No description provided for @thisSectionIsUnderDevelopment.
  ///
  /// In ru, this message translates to:
  /// **'Раздел в разработке'**
  String get thisSectionIsUnderDevelopment;

  /// No description provided for @time.
  ///
  /// In ru, this message translates to:
  /// **'Время'**
  String get time;

  /// No description provided for @toAddProductSpecifyTheStoresAddressInYourProfile.
  ///
  /// In ru, this message translates to:
  /// **'Чтобы добавить товар, укажите адрес магазина в профиле.'**
  String get toAddProductSpecifyTheStoresAddressInYourProfile;

  /// No description provided for @toPay.
  ///
  /// In ru, this message translates to:
  /// **'Оплатить'**
  String get toPay;

  /// No description provided for @to_change.
  ///
  /// In ru, this message translates to:
  /// **'Изменить'**
  String get to_change;

  /// No description provided for @today.
  ///
  /// In ru, this message translates to:
  /// **'Cегодня'**
  String get today;

  /// No description provided for @transportRequirements.
  ///
  /// In ru, this message translates to:
  /// **'Особенности к перевозке'**
  String get transportRequirements;

  /// No description provided for @typeOfPackaging.
  ///
  /// In ru, this message translates to:
  /// **'Вид упаковки'**
  String get typeOfPackaging;

  /// No description provided for @typeOfTransport.
  ///
  /// In ru, this message translates to:
  /// **'Тип транспорта'**
  String get typeOfTransport;

  /// No description provided for @unknownError.
  ///
  /// In ru, this message translates to:
  /// **'Неизвестная ошибка'**
  String get unknownError;

  /// No description provided for @unloadingPoint.
  ///
  /// In ru, this message translates to:
  /// **'Пункт выгрузки'**
  String get unloadingPoint;

  /// No description provided for @update.
  ///
  /// In ru, this message translates to:
  /// **'Обновить!'**
  String get update;

  /// No description provided for @updateDotDotDot.
  ///
  /// In ru, this message translates to:
  /// **'Обновление...'**
  String get updateDotDotDot;

  /// No description provided for @uploadingDotDotDot.
  ///
  /// In ru, this message translates to:
  /// **'Загружаем...'**
  String get uploadingDotDotDot;

  /// В ближайшее время раздел
  ///
  /// In ru, this message translates to:
  /// **'В ближайшее время раздел '**
  String verySoonWillAppearInTheApplicationAndYouWillAbleCheck(String value);

  /// No description provided for @volume.
  ///
  /// In ru, this message translates to:
  /// **'Объем'**
  String get volume;

  /// No description provided for @volumes.
  ///
  /// In ru, this message translates to:
  /// **'Объемы'**
  String get volumes;

  /// No description provided for @wasAddDaysAgo.
  ///
  /// In ru, this message translates to:
  /// **'был добавлен 20 дней\nназад. Пожалуйста, оцените перевозчика'**
  String get wasAddDaysAgo;

  /// No description provided for @we_have_sent_a_confirmation.
  ///
  /// In ru, this message translates to:
  /// **'Мы отправили код на ваш номер '**
  String get we_have_sent_a_confirmation;

  /// No description provided for @website.
  ///
  /// In ru, this message translates to:
  /// **'Сайт'**
  String get website;

  /// No description provided for @weight.
  ///
  /// In ru, this message translates to:
  /// **'Вес'**
  String get weight;

  /// No description provided for @welcomeToSirius.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать в Sirius'**
  String get welcomeToSirius;

  /// No description provided for @where.
  ///
  /// In ru, this message translates to:
  /// **'Куда'**
  String get where;

  /// No description provided for @width.
  ///
  /// In ru, this message translates to:
  /// **'Ширина (м)'**
  String get width;

  /// No description provided for @withConditions.
  ///
  /// In ru, this message translates to:
  /// **'с условиями'**
  String get withConditions;

  /// No description provided for @workSchedule.
  ///
  /// In ru, this message translates to:
  /// **'График работы'**
  String get workSchedule;

  /// No description provided for @write.
  ///
  /// In ru, this message translates to:
  /// **'Написать'**
  String get write;

  /// No description provided for @writeComment.
  ///
  /// In ru, this message translates to:
  /// **'Написать комментарий ..'**
  String get writeComment;

  /// No description provided for @writeMessage.
  ///
  /// In ru, this message translates to:
  /// **'Напишите сообщение'**
  String get writeMessage;

  /// No description provided for @writeToUsOnWhatsAppweAreAlwaysTouchAndReadytoHelp.
  ///
  /// In ru, this message translates to:
  /// **'Напишите нам в WhatsApp — мы всегда на \n связи и готовы помочь!'**
  String get writeToUsOnWhatsAppweAreAlwaysTouchAndReadytoHelp;

  /// No description provided for @yes.
  ///
  /// In ru, this message translates to:
  /// **'Да'**
  String get yes;

  /// No description provided for @yesIGetOut.
  ///
  /// In ru, this message translates to:
  /// **'Да, выйду'**
  String get yesIGetOut;

  /// No description provided for @yesterday.
  ///
  /// In ru, this message translates to:
  /// **'Вчера'**
  String get yesterday;

  /// No description provided for @youSearched.
  ///
  /// In ru, this message translates to:
  /// **'Вы уже искали'**
  String get youSearched;

  /// No description provided for @yourOpinionImportantUs.
  ///
  /// In ru, this message translates to:
  /// **'Нам важно ваше мнение!'**
  String get yourOpinionImportantUs;

  /// No description provided for @yuridicRegister.
  ///
  /// In ru, this message translates to:
  /// **'Юридический'**
  String get yuridicRegister;

  /// No description provided for @cityDriveMap.
  ///
  /// In ru, this message translates to:
  /// **'Карта'**
  String get cityDriveMap;

  /// No description provided for @cityDriveMyMarks.
  ///
  /// In ru, this message translates to:
  /// **'Мои отметки'**
  String get cityDriveMyMarks;

  /// No description provided for @cityDriveMyWorks.
  ///
  /// In ru, this message translates to:
  /// **'Мои работы'**
  String get cityDriveMyWorks;

  /// No description provided for @cityDriveEditProfile.
  ///
  /// In ru, this message translates to:
  /// **'Редактировать профиль'**
  String get cityDriveEditProfile;

  /// No description provided for @cityDriveAnnouncements.
  ///
  /// In ru, this message translates to:
  /// **'Объявлении'**
  String get cityDriveAnnouncements;

  /// No description provided for @cityDriveKeywords.
  ///
  /// In ru, this message translates to:
  /// **'Ключевые слова'**
  String get cityDriveKeywords;

  /// No description provided for @cityDriveNew.
  ///
  /// In ru, this message translates to:
  /// **'Новые'**
  String get cityDriveNew;

  /// No description provided for @cityDriveApplications.
  ///
  /// In ru, this message translates to:
  /// **'Заявки'**
  String get cityDriveApplications;

  /// No description provided for @cityDriveInProgress.
  ///
  /// In ru, this message translates to:
  /// **'В работе'**
  String get cityDriveInProgress;

  /// No description provided for @cityDriveDone.
  ///
  /// In ru, this message translates to:
  /// **'Готово'**
  String get cityDriveDone;

  /// No description provided for @cityDriveNoNewMarksEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Новых отметок нет.\nЖитель публикует их с карты — они появятся здесь.'**
  String get cityDriveNoNewMarksEmpty;

  /// No description provided for @cityDrivePotholeRepair.
  ///
  /// In ru, this message translates to:
  /// **'Ямочный ремонт'**
  String get cityDrivePotholeRepair;

  /// No description provided for @cityDriveAddressNotSpecified.
  ///
  /// In ru, this message translates to:
  /// **'Адрес не указан'**
  String get cityDriveAddressNotSpecified;

  /// No description provided for @cityDriveUnderReview.
  ///
  /// In ru, this message translates to:
  /// **'На рассмотрении'**
  String get cityDriveUnderReview;

  /// No description provided for @cityDriveOnVerification.
  ///
  /// In ru, this message translates to:
  /// **'На проверке'**
  String get cityDriveOnVerification;

  /// No description provided for @cityDriveFromAuthor.
  ///
  /// In ru, this message translates to:
  /// **'От: {author}'**
  String cityDriveFromAuthor(String author);

  /// No description provided for @cityDriveMoreDetails.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее'**
  String get cityDriveMoreDetails;

  /// No description provided for @cityDriveMarkAcceptedSnack.
  ///
  /// In ru, this message translates to:
  /// **'Отметка принята в работу'**
  String get cityDriveMarkAcceptedSnack;

  /// No description provided for @cityDriveMarkRejectedSnack.
  ///
  /// In ru, this message translates to:
  /// **'Отметка отклонена'**
  String get cityDriveMarkRejectedSnack;

  /// No description provided for @cityDriveDetailsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Подробности'**
  String get cityDriveDetailsTitle;

  /// No description provided for @cityDriveNotSpecified.
  ///
  /// In ru, this message translates to:
  /// **'Не указано'**
  String get cityDriveNotSpecified;

  /// No description provided for @cityDriveResident.
  ///
  /// In ru, this message translates to:
  /// **'Житель'**
  String get cityDriveResident;

  /// No description provided for @cityDriveComments.
  ///
  /// In ru, this message translates to:
  /// **'Комментарии'**
  String get cityDriveComments;

  /// No description provided for @cityDriveShowAll.
  ///
  /// In ru, this message translates to:
  /// **'Показать все'**
  String get cityDriveShowAll;

  /// No description provided for @cityDriveLeaveFirstComment.
  ///
  /// In ru, this message translates to:
  /// **'Оставьте первый комментарий'**
  String get cityDriveLeaveFirstComment;

  /// No description provided for @cityDriveReject.
  ///
  /// In ru, this message translates to:
  /// **'Отклонить'**
  String get cityDriveReject;

  /// No description provided for @cityDriveAcceptApplicationBtn.
  ///
  /// In ru, this message translates to:
  /// **'Принять заявку'**
  String get cityDriveAcceptApplicationBtn;

  /// No description provided for @cityDriveSubmitReport.
  ///
  /// In ru, this message translates to:
  /// **'Отправить отчёт'**
  String get cityDriveSubmitReport;

  /// No description provided for @cityDrivePhotoUnavailable.
  ///
  /// In ru, this message translates to:
  /// **'Фото недоступно'**
  String get cityDrivePhotoUnavailable;

  /// No description provided for @cityDriveInformation.
  ///
  /// In ru, this message translates to:
  /// **'Информация'**
  String get cityDriveInformation;

  /// No description provided for @cityDriveType.
  ///
  /// In ru, this message translates to:
  /// **'Тип'**
  String get cityDriveType;

  /// No description provided for @cityDriveAuthor.
  ///
  /// In ru, this message translates to:
  /// **'Автор'**
  String get cityDriveAuthor;

  /// No description provided for @cityDriveDateLabel.
  ///
  /// In ru, this message translates to:
  /// **'Дата'**
  String get cityDriveDateLabel;

  /// No description provided for @cityDriveUrgency.
  ///
  /// In ru, this message translates to:
  /// **'Срочность'**
  String get cityDriveUrgency;

  /// No description provided for @cityDriveLevel.
  ///
  /// In ru, this message translates to:
  /// **'Уровень'**
  String get cityDriveLevel;

  /// No description provided for @cityDriveAddress.
  ///
  /// In ru, this message translates to:
  /// **'Адрес'**
  String get cityDriveAddress;

  /// No description provided for @cityDriveSeverityCritical.
  ///
  /// In ru, this message translates to:
  /// **'Критический'**
  String get cityDriveSeverityCritical;

  /// No description provided for @cityDriveSeverityHigh.
  ///
  /// In ru, this message translates to:
  /// **'Высокий'**
  String get cityDriveSeverityHigh;

  /// No description provided for @cityDriveSeverityMedium.
  ///
  /// In ru, this message translates to:
  /// **'Средний'**
  String get cityDriveSeverityMedium;

  /// No description provided for @cityDriveSeverityLow.
  ///
  /// In ru, this message translates to:
  /// **'Низкий'**
  String get cityDriveSeverityLow;

  /// No description provided for @cityDriveStatusOpen.
  ///
  /// In ru, this message translates to:
  /// **'Открыто'**
  String get cityDriveStatusOpen;

  /// No description provided for @cityDriveStatusAccepted.
  ///
  /// In ru, this message translates to:
  /// **'Принято'**
  String get cityDriveStatusAccepted;

  /// No description provided for @cityDriveStatusInWork.
  ///
  /// In ru, this message translates to:
  /// **'В работе'**
  String get cityDriveStatusInWork;

  /// No description provided for @cityDriveStatusRejected.
  ///
  /// In ru, this message translates to:
  /// **'Отклонено'**
  String get cityDriveStatusRejected;

  /// No description provided for @cityDriveStatusDone.
  ///
  /// In ru, this message translates to:
  /// **'Готово'**
  String get cityDriveStatusDone;

  /// No description provided for @cityDriveStatusConfirmed.
  ///
  /// In ru, this message translates to:
  /// **'Подтверждена'**
  String get cityDriveStatusConfirmed;

  /// No description provided for @cityDriveStatusFixed.
  ///
  /// In ru, this message translates to:
  /// **'Исправлено'**
  String get cityDriveStatusFixed;

  /// No description provided for @cityDrivePublishedRecently.
  ///
  /// In ru, this message translates to:
  /// **'Опубликовано недавно'**
  String get cityDrivePublishedRecently;

  /// No description provided for @cityDrivePublishedToday.
  ///
  /// In ru, this message translates to:
  /// **'Опубликовано сегодня'**
  String get cityDrivePublishedToday;

  /// No description provided for @cityDrivePublishedYesterday.
  ///
  /// In ru, this message translates to:
  /// **'Опубликовано вчера'**
  String get cityDrivePublishedYesterday;

  /// No description provided for @cityDrivePublishedOn.
  ///
  /// In ru, this message translates to:
  /// **'Опубликовано {date}'**
  String cityDrivePublishedOn(String date);

  /// No description provided for @cityDriveWorkReportTitle.
  ///
  /// In ru, this message translates to:
  /// **'Отчёт о выполнении работ'**
  String get cityDriveWorkReportTitle;

  /// No description provided for @cityDriveWorkPhoto.
  ///
  /// In ru, this message translates to:
  /// **'Фото выполненной работы'**
  String get cityDriveWorkPhoto;

  /// No description provided for @cityDriveWorkDescription.
  ///
  /// In ru, this message translates to:
  /// **'Описание работ'**
  String get cityDriveWorkDescription;

  /// No description provided for @cityDriveWorkDescriptionHint.
  ///
  /// In ru, this message translates to:
  /// **'Напишите, как прошла работа'**
  String get cityDriveWorkDescriptionHint;

  /// No description provided for @cityDriveReportSentTitle.
  ///
  /// In ru, this message translates to:
  /// **'Отчет отправлен'**
  String get cityDriveReportSentTitle;

  /// No description provided for @cityDriveWaitAdminReview.
  ///
  /// In ru, this message translates to:
  /// **'Ожидайте проверки администратора'**
  String get cityDriveWaitAdminReview;

  /// No description provided for @cityDriveNow.
  ///
  /// In ru, this message translates to:
  /// **'Сейчас'**
  String get cityDriveNow;

  /// No description provided for @cityDriveAdminReview.
  ///
  /// In ru, this message translates to:
  /// **'Проверка админом'**
  String get cityDriveAdminReview;

  /// No description provided for @cityDriveAdminReviewSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Обычно 1-2 дня'**
  String get cityDriveAdminReviewSubtitle;

  /// No description provided for @cityDriveApplicationAcceptedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Заявка принята!'**
  String get cityDriveApplicationAcceptedTitle;

  /// No description provided for @cityDriveApplicationAcceptedBody.
  ///
  /// In ru, this message translates to:
  /// **'Отметка добавлена в «Мои работы». Можете приступить к работе.'**
  String get cityDriveApplicationAcceptedBody;

  /// No description provided for @cityDriveApplicationSentTitle.
  ///
  /// In ru, this message translates to:
  /// **'Заявка отправлена!'**
  String get cityDriveApplicationSentTitle;

  /// No description provided for @cityDriveApplicationSentBody.
  ///
  /// In ru, this message translates to:
  /// **'Ваша заявка на участие отправлена на проверку'**
  String get cityDriveApplicationSentBody;

  /// No description provided for @cityDriveApplicationAcceptedStep.
  ///
  /// In ru, this message translates to:
  /// **'Заявка принята'**
  String get cityDriveApplicationAcceptedStep;

  /// No description provided for @cityDriveApplicationSentStep.
  ///
  /// In ru, this message translates to:
  /// **'Заявка отправлена'**
  String get cityDriveApplicationSentStep;

  /// No description provided for @cityDriveViewInMyWorks.
  ///
  /// In ru, this message translates to:
  /// **'Посмотреть в Мои работы'**
  String get cityDriveViewInMyWorks;

  /// No description provided for @cityDriveAssignedTo.
  ///
  /// In ru, this message translates to:
  /// **'Исполнитель: {name}'**
  String cityDriveAssignedTo(String name);

  /// No description provided for @cityDriveAnnouncement.
  ///
  /// In ru, this message translates to:
  /// **'Объявление'**
  String get cityDriveAnnouncement;

  /// No description provided for @cityDriveCommentOptional.
  ///
  /// In ru, this message translates to:
  /// **'Комментарий (необязательно)'**
  String get cityDriveCommentOptional;

  /// No description provided for @cityDriveCommentHint.
  ///
  /// In ru, this message translates to:
  /// **'Например: примем в работу на следующей неделе'**
  String get cityDriveCommentHint;

  /// No description provided for @cityDriveRoadDamage.
  ///
  /// In ru, this message translates to:
  /// **'Повреждение дороги'**
  String get cityDriveRoadDamage;

  /// No description provided for @cityDriveDefaultMarkTitle.
  ///
  /// In ru, this message translates to:
  /// **'Отметка'**
  String get cityDriveDefaultMarkTitle;

  /// No description provided for @cityDriveLoginForMarks.
  ///
  /// In ru, this message translates to:
  /// **'Войдите, чтобы видеть свои отметки'**
  String get cityDriveLoginForMarks;

  /// No description provided for @cityDriveNoMarksYet.
  ///
  /// In ru, this message translates to:
  /// **'У вас пока нет отметок.\nСфотографируйте проблему на карте.'**
  String get cityDriveNoMarksYet;

  /// No description provided for @cityDriveViewOnMap.
  ///
  /// In ru, this message translates to:
  /// **'Посмотреть на карте'**
  String get cityDriveViewOnMap;

  /// No description provided for @cityDriveNews.
  ///
  /// In ru, this message translates to:
  /// **'Новости'**
  String get cityDriveNews;

  /// No description provided for @cityDriveCanceled.
  ///
  /// In ru, this message translates to:
  /// **'Отмененные'**
  String get cityDriveCanceled;

  /// No description provided for @cityDriveInProcess.
  ///
  /// In ru, this message translates to:
  /// **'В процессе'**
  String get cityDriveInProcess;

  /// No description provided for @cityDriveCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Завершенные'**
  String get cityDriveCompleted;

  /// No description provided for @cityDriveEmptyApplications.
  ///
  /// In ru, this message translates to:
  /// **'Новых заявок от жителей нет.\nОни появятся после публикации отметки на карте.'**
  String get cityDriveEmptyApplications;

  /// No description provided for @cityDriveEmptyCanceled.
  ///
  /// In ru, this message translates to:
  /// **'Отклонённых заявок нет.'**
  String get cityDriveEmptyCanceled;

  /// No description provided for @cityDriveEmptyInWork.
  ///
  /// In ru, this message translates to:
  /// **'Примите заявку на главной вкладке — она появится здесь.'**
  String get cityDriveEmptyInWork;

  /// No description provided for @cityDriveEmptyCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Завершённых работ пока нет.'**
  String get cityDriveEmptyCompleted;

  /// No description provided for @cityDriveEmptyList.
  ///
  /// In ru, this message translates to:
  /// **'Список пуст'**
  String get cityDriveEmptyList;

  /// No description provided for @cityDriveLoginToPublish.
  ///
  /// In ru, this message translates to:
  /// **'Войдите в аккаунт, чтобы опубликовать отметку'**
  String get cityDriveLoginToPublish;

  /// No description provided for @cityDriveReportPublished.
  ///
  /// In ru, this message translates to:
  /// **'Отчет успешно опубликован!'**
  String get cityDriveReportPublished;

  /// No description provided for @cityDriveReportSubmittedPending.
  ///
  /// In ru, this message translates to:
  /// **'Заявка отправлена и ожидает проверки'**
  String get cityDriveReportSubmittedPending;

  /// No description provided for @cityDriveReportSubmitAlertTitle.
  String get cityDriveReportSubmitAlertTitle;

  /// No description provided for @cityDriveReportSubmitAlertMessage.
  String get cityDriveReportSubmitAlertMessage;

  /// No description provided for @cityDriveConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get cityDriveConfirm;

  /// No description provided for @cityDriveAddCommentHint.
  ///
  /// In ru, this message translates to:
  /// **'Добавить комментарий (необязательно)...'**
  String get cityDriveAddCommentHint;

  /// No description provided for @cityDriveRetake.
  ///
  /// In ru, this message translates to:
  /// **'Переснять'**
  String get cityDriveRetake;

  /// No description provided for @cityDrivePublish.
  ///
  /// In ru, this message translates to:
  /// **'Опубликовать'**
  String get cityDrivePublish;

  /// No description provided for @cityDriveResidentReported.
  ///
  /// In ru, this message translates to:
  /// **'Житель сообщил о повреждении дороги.'**
  String get cityDriveResidentReported;

  /// No description provided for @cityDriveProblemOnRoad.
  ///
  /// In ru, this message translates to:
  /// **'Проблема на дороге'**
  String get cityDriveProblemOnRoad;

  /// No description provided for @cityDriveReportedOn.
  ///
  /// In ru, this message translates to:
  /// **'Сообщено: {date}'**
  String cityDriveReportedOn(String date);

  /// No description provided for @cityDriveNewStatus.
  ///
  /// In ru, this message translates to:
  /// **'Новая'**
  String get cityDriveNewStatus;

  /// No description provided for @cityDriveFixedStatus.
  ///
  /// In ru, this message translates to:
  /// **'Исправлено'**
  String get cityDriveFixedStatus;

  /// No description provided for @cityDriveUndefinedStatus.
  ///
  /// In ru, this message translates to:
  /// **'Не определен'**
  String get cityDriveUndefinedStatus;

  /// No description provided for @cityDriveJustNow.
  ///
  /// In ru, this message translates to:
  /// **'только что'**
  String get cityDriveJustNow;

  /// No description provided for @cityDriveHour.
  ///
  /// In ru, this message translates to:
  /// **'час'**
  String get cityDriveHour;

  /// No description provided for @cityDriveHours2to4.
  ///
  /// In ru, this message translates to:
  /// **'часа'**
  String get cityDriveHours2to4;

  /// No description provided for @cityDriveHoursMany.
  ///
  /// In ru, this message translates to:
  /// **'часов'**
  String get cityDriveHoursMany;

  /// No description provided for @cityDriveDay.
  ///
  /// In ru, this message translates to:
  /// **'день'**
  String get cityDriveDay;

  /// No description provided for @cityDriveDays2to4.
  ///
  /// In ru, this message translates to:
  /// **'дня'**
  String get cityDriveDays2to4;

  /// No description provided for @cityDriveDaysMany.
  ///
  /// In ru, this message translates to:
  /// **'дней'**
  String get cityDriveDaysMany;

  /// No description provided for @cityDriveProblemTypePothole.
  ///
  /// In ru, this message translates to:
  /// **'Яма на дороге'**
  String get cityDriveProblemTypePothole;

  /// No description provided for @cityDriveProblemTypeDamage.
  ///
  /// In ru, this message translates to:
  /// **'Повреждение покрытия'**
  String get cityDriveProblemTypeDamage;

  /// No description provided for @cityDriveProblemTypeCracks.
  ///
  /// In ru, this message translates to:
  /// **'Трещины'**
  String get cityDriveProblemTypeCracks;

  /// No description provided for @cityDriveProblemTypeSubsidence.
  ///
  /// In ru, this message translates to:
  /// **'Проседание асфальта'**
  String get cityDriveProblemTypeSubsidence;

  /// No description provided for @cityDriveTypePothole.
  ///
  /// In ru, this message translates to:
  /// **'Ямка'**
  String get cityDriveTypePothole;

  /// No description provided for @cityDriveTypeDamage.
  ///
  /// In ru, this message translates to:
  /// **'Повреждение'**
  String get cityDriveTypeDamage;

  /// No description provided for @cityDriveTypeCrack.
  ///
  /// In ru, this message translates to:
  /// **'Трещина'**
  String get cityDriveTypeCrack;

  /// No description provided for @cityDriveTypeRoad.
  ///
  /// In ru, this message translates to:
  /// **'Дорога'**
  String get cityDriveTypeRoad;

  /// No description provided for @cityDriveAvailable.
  ///
  /// In ru, this message translates to:
  /// **'Доступно'**
  String get cityDriveAvailable;

  /// No description provided for @cityDriveSubmitApplication.
  ///
  /// In ru, this message translates to:
  /// **'Подать заявку'**
  String get cityDriveSubmitApplication;

  /// No description provided for @cityDriveSendReportBtn.
  ///
  /// In ru, this message translates to:
  /// **'Отправить отчет'**
  String get cityDriveSendReportBtn;

  /// No description provided for @cityDriveCameraFailed.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось открыть камеру'**
  String get cityDriveCameraFailed;

  /// No description provided for @cityDriveRoadProblem.
  ///
  /// In ru, this message translates to:
  /// **'Дорожная проблема'**
  String get cityDriveRoadProblem;

  /// No description provided for @cityDriveDeterminingAddress.
  ///
  /// In ru, this message translates to:
  /// **'Определение адреса...'**
  String get cityDriveDeterminingAddress;

  /// No description provided for @cityDriveCoordsUnavailable.
  ///
  /// In ru, this message translates to:
  /// **'Координаты недоступны'**
  String get cityDriveCoordsUnavailable;

  /// No description provided for @cityDriveDamageNeedsAttention.
  ///
  /// In ru, this message translates to:
  /// **'Повреждение дороги требует внимания'**
  String get cityDriveDamageNeedsAttention;

  /// No description provided for @cityDriveMarks.
  ///
  /// In ru, this message translates to:
  /// **'Отметки'**
  String get cityDriveMarks;

  /// No description provided for @cityDriveFilterAll.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get cityDriveFilterAll;

  /// No description provided for @cityDriveFilterConfirmed.
  ///
  /// In ru, this message translates to:
  /// **'Подтверждена'**
  String get cityDriveFilterConfirmed;

  /// No description provided for @cityDriveFilterRejected.
  ///
  /// In ru, this message translates to:
  /// **'Отклонена'**
  String get cityDriveFilterRejected;

  /// No description provided for @cityDriveMarkDetails.
  ///
  /// In ru, this message translates to:
  /// **'Детали отметки'**
  String get cityDriveMarkDetails;

  /// No description provided for @cityDriveNotifications.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления'**
  String get cityDriveNotifications;

  /// No description provided for @cityDriveNoNotifications.
  ///
  /// In ru, this message translates to:
  /// **'У вас пока нет уведомлений'**
  String get cityDriveNoNotifications;

  /// No description provided for @cityDriveNotificationsHint.
  ///
  /// In ru, this message translates to:
  /// **'Здесь будут отображаться уведомления по занятиям, акциям и многое другое'**
  String get cityDriveNotificationsHint;

  /// No description provided for @cityDriveOpen.
  ///
  /// In ru, this message translates to:
  /// **'Открыть'**
  String get cityDriveOpen;

  /// No description provided for @cityDriveToday.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня'**
  String get cityDriveToday;

  /// No description provided for @cityDriveYesterday.
  ///
  /// In ru, this message translates to:
  /// **'Вчера'**
  String get cityDriveYesterday;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'kk', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'kk': return AppLocalizationsKk();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
