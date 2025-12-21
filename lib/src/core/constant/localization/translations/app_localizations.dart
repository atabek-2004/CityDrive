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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
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
  /// In en, this message translates to:
  /// **'A new generation freight transportation exchange - reliable, fast, convenient.'**
  String get aNewGenerationFreightTransportation;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @accountNumber.
  ///
  /// In en, this message translates to:
  /// **'Account number'**
  String get accountNumber;

  /// No description provided for @accumulatedBonuses.
  ///
  /// In en, this message translates to:
  /// **'Accumulated bonuses'**
  String get accumulatedBonuses;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addAddress.
  ///
  /// In en, this message translates to:
  /// **'Add an address'**
  String get addAddress;

  /// No description provided for @addCargo.
  ///
  /// In en, this message translates to:
  /// **'Add cargo'**
  String get addCargo;

  /// No description provided for @addMore.
  ///
  /// In en, this message translates to:
  /// **'Add more'**
  String get addMore;

  /// No description provided for @addNewProduct.
  ///
  /// In en, this message translates to:
  /// **'Add a new product'**
  String get addNewProduct;

  /// No description provided for @addPhotos.
  ///
  /// In en, this message translates to:
  /// **'Add photos'**
  String get addPhotos;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'Add a product'**
  String get addProduct;

  /// No description provided for @additional.
  ///
  /// In en, this message translates to:
  /// **'Additional'**
  String get additional;

  /// No description provided for @additionalFeatures.
  ///
  /// In en, this message translates to:
  /// **'Additional features'**
  String get additionalFeatures;

  /// No description provided for @addresses.
  ///
  /// In en, this message translates to:
  /// **'Addresses'**
  String get addresses;

  /// No description provided for @advertiseProduct.
  ///
  /// In en, this message translates to:
  /// **'Advertise a product'**
  String get advertiseProduct;

  /// No description provided for @advertiseYourProductWithUs.
  ///
  /// In en, this message translates to:
  /// **'Advertise your product with us!'**
  String get advertiseYourProductWithUs;

  /// No description provided for @agreeText.
  ///
  /// In en, this message translates to:
  /// **'By clicking on the “Create Account” button You agree with'**
  String get agreeText;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **' and'**
  String get and;

  /// No description provided for @annualSubscription.
  ///
  /// In en, this message translates to:
  /// **'Annual subscription'**
  String get annualSubscription;

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'sirius Business'**
  String get appTitle;

  /// No description provided for @applicationCompletedWaitForResponses.
  ///
  /// In en, this message translates to:
  /// **'Application completed!\n Wait for responses'**
  String get applicationCompletedWaitForResponses;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @areYouSureYouWantLogOutYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out of your account?'**
  String get areYouSureYouWantLogOutYourAccount;

  /// No description provided for @areYouSureYouWantToDeleteTheOrder.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want\nto delete the order?'**
  String get areYouSureYouWantToDeleteTheOrder;

  /// No description provided for @areYouSureYouWantToDeleteYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get areYouSureYouWantToDeleteYourAccount;

  /// No description provided for @attention.
  ///
  /// In en, this message translates to:
  /// **'Attention'**
  String get attention;

  /// No description provided for @attentionThePlatformIsOnly.
  ///
  /// In en, this message translates to:
  /// **'Attention! The platform is only an information platform and is not responsible for transactions between users. Before concluding agreements, check the documents and reliability of the counterparty yourself.'**
  String get attentionThePlatformIsOnly;

  /// No description provided for @autoRenewal.
  ///
  /// In en, this message translates to:
  /// **'Auto-renewal'**
  String get autoRenewal;

  /// No description provided for @bIK.
  ///
  /// In en, this message translates to:
  /// **'BIK'**
  String get bIK;

  /// No description provided for @bINIIN.
  ///
  /// In en, this message translates to:
  /// **'BIN / IIN'**
  String get bINIIN;

  /// No description provided for @bank.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get bank;

  /// No description provided for @begin.
  ///
  /// In en, this message translates to:
  /// **'Begin'**
  String get begin;

  /// No description provided for @bin.
  ///
  /// In en, this message translates to:
  /// **'BIN'**
  String get bin;

  /// No description provided for @bonuses.
  ///
  /// In en, this message translates to:
  /// **'Bonuses'**
  String get bonuses;

  /// No description provided for @boxLength.
  ///
  /// In en, this message translates to:
  /// **'Box length'**
  String get boxLength;

  /// No description provided for @branchesIn.
  ///
  /// In en, this message translates to:
  /// **'Branches in'**
  String get branchesIn;

  /// No description provided for @budget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budget;

  /// No description provided for @businessData.
  ///
  /// In en, this message translates to:
  /// **'Business data'**
  String get businessData;

  /// No description provided for @buyPremiumSubscription.
  ///
  /// In en, this message translates to:
  /// **'Buy a premium subscription and get access to all contacts'**
  String get buyPremiumSubscription;

  /// No description provided for @buyoutOfGoods.
  ///
  /// In en, this message translates to:
  /// **'Buyout of goods'**
  String get buyoutOfGoods;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call the number'**
  String get call;

  /// No description provided for @callTheNumber.
  ///
  /// In en, this message translates to:
  /// **'Call the number'**
  String get callTheNumber;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cancel2.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel2;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get cardNumber;

  /// No description provided for @cargoReadinessDate.
  ///
  /// In en, this message translates to:
  /// **'Cargo readiness date'**
  String get cargoReadinessDate;

  /// No description provided for @carrierProfile.
  ///
  /// In en, this message translates to:
  /// **'Carrier profile'**
  String get carrierProfile;

  /// No description provided for @carriersWhoResponded.
  ///
  /// In en, this message translates to:
  /// **'Carriers who responded'**
  String get carriersWhoResponded;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @certificateAccountAvailability.
  ///
  /// In en, this message translates to:
  /// **'Certificate of account availability'**
  String get certificateAccountAvailability;

  /// No description provided for @certificateRegistrationSoleProprietor.
  ///
  /// In en, this message translates to:
  /// **'Certificate of registration of sole proprietor'**
  String get certificateRegistrationSoleProprietor;

  /// No description provided for @certification.
  ///
  /// In en, this message translates to:
  /// **'Certification'**
  String get certification;

  /// No description provided for @changeAddress.
  ///
  /// In en, this message translates to:
  /// **'Change address'**
  String get changeAddress;

  /// No description provided for @changePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Change number'**
  String get changePhoneNumber;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get choose;

  /// No description provided for @chooseCity.
  ///
  /// In en, this message translates to:
  /// **'Choose a city'**
  String get chooseCity;

  /// No description provided for @chooseColor.
  ///
  /// In en, this message translates to:
  /// **'Choose a color'**
  String get chooseColor;

  /// No description provided for @choose_a_city.
  ///
  /// In en, this message translates to:
  /// **'Choose a city'**
  String get choose_a_city;

  /// No description provided for @choose_from_the_gallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from the gallery'**
  String get choose_from_the_gallery;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @clickLogin.
  ///
  /// In en, this message translates to:
  /// **'click Login'**
  String get clickLogin;

  /// No description provided for @clickToDownload.
  ///
  /// In en, this message translates to:
  /// **'Click to download'**
  String get clickToDownload;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @come_up_with_a_new_password.
  ///
  /// In en, this message translates to:
  /// **'Come up with a new password'**
  String get come_up_with_a_new_password;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @completed2.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed2;

  /// No description provided for @confirmation1.
  ///
  /// In en, this message translates to:
  /// **'Confirmation of agreement with the terms of use and'**
  String get confirmation1;

  /// No description provided for @confirmation2.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy.'**
  String get confirmation2;

  /// No description provided for @confirmation3.
  ///
  /// In en, this message translates to:
  /// **'Related links to'**
  String get confirmation3;

  /// No description provided for @confirmation4.
  ///
  /// In en, this message translates to:
  /// **'familiarization with the terms of use'**
  String get confirmation4;

  /// No description provided for @confirmation5.
  ///
  /// In en, this message translates to:
  /// **'and privacy policy.'**
  String get confirmation5;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @countryOrcity.
  ///
  /// In en, this message translates to:
  /// **'Country or city'**
  String get countryOrcity;

  /// No description provided for @create_an_account.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get create_an_account;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @currencySelection.
  ///
  /// In en, this message translates to:
  /// **'Currency selection'**
  String get currencySelection;

  /// No description provided for @currentAccount.
  ///
  /// In en, this message translates to:
  /// **'Current account'**
  String get currentAccount;

  /// Custom colors for the application
  ///
  /// In en, this message translates to:
  /// **'Custom Colors'**
  String get custom_colors;

  /// No description provided for @customsClearance.
  ///
  /// In en, this message translates to:
  /// **'Customs clearance'**
  String get customsClearance;

  /// No description provided for @dateReady.
  ///
  /// In en, this message translates to:
  /// **'Ready date'**
  String get dateReady;

  /// No description provided for @dateReadyHint.
  ///
  /// In en, this message translates to:
  /// **'DD-MM-YYYY'**
  String get dateReadyHint;

  /// Default themes for the application
  ///
  /// In en, this message translates to:
  /// **'Default Themes'**
  String get default_themes;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete an account'**
  String get deleteAccount;

  /// No description provided for @deleteAddress.
  ///
  /// In en, this message translates to:
  /// **'Delete an address'**
  String get deleteAddress;

  /// No description provided for @deleteApplication.
  ///
  /// In en, this message translates to:
  /// **'Delete application'**
  String get deleteApplication;

  /// No description provided for @deleteOrder.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to delete the order'**
  String get deleteOrder;

  /// No description provided for @deleteProduct.
  ///
  /// In en, this message translates to:
  /// **'Delete a product'**
  String get deleteProduct;

  /// No description provided for @deletedProfile.
  ///
  /// In en, this message translates to:
  /// **'Deleted Profile'**
  String get deletedProfile;

  /// No description provided for @deliverCargo.
  ///
  /// In en, this message translates to:
  /// **'Deliver cargo'**
  String get deliverCargo;

  /// No description provided for @deliveryIsNotYetComplete.
  ///
  /// In en, this message translates to:
  /// **'Delivery is not yet complete'**
  String get deliveryIsNotYetComplete;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @didEverythingGoWell.
  ///
  /// In en, this message translates to:
  /// **'Did everything go well?'**
  String get didEverythingGoWell;

  /// No description provided for @didnt_get_the_code.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t get the code?'**
  String get didnt_get_the_code;

  /// No description provided for @discountedPrice.
  ///
  /// In en, this message translates to:
  /// **'Discounted price'**
  String get discountedPrice;

  /// No description provided for @doYouWantToCall.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to make a call?'**
  String get doYouWantToCall;

  /// No description provided for @document.
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get document;

  /// No description provided for @documentScan.
  ///
  /// In en, this message translates to:
  /// **'Document scan'**
  String get documentScan;

  /// No description provided for @documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documents;

  /// No description provided for @documentsAreBeingCheckedPleaseWaitForConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Documents are being checked, please wait for confirmation.'**
  String get documentsAreBeingCheckedPleaseWaitForConfirmation;

  /// No description provided for @dont_you_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t you have an account?'**
  String get dont_you_have_an_account;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @downloadDocs.
  ///
  /// In en, this message translates to:
  /// **'If you upload company documents, you will get a check mark as a verified company.'**
  String get downloadDocs;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @editData.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editData;

  /// No description provided for @editTheProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit the product'**
  String get editTheProduct;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emptyHereForNow.
  ///
  /// In en, this message translates to:
  /// **'Empty here for now'**
  String get emptyHereForNow;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// No description provided for @enterAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter the address'**
  String get enterAddress;

  /// No description provided for @enterBIKIIN.
  ///
  /// In en, this message translates to:
  /// **'BIK / IIN'**
  String get enterBIKIIN;

  /// No description provided for @enterBin.
  ///
  /// In en, this message translates to:
  /// **'Enter BIN'**
  String get enterBin;

  /// No description provided for @enterBudget.
  ///
  /// In en, this message translates to:
  /// **'Enter budget'**
  String get enterBudget;

  /// No description provided for @enterCardNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter card number'**
  String get enterCardNumber;

  /// No description provided for @enterCargoReadinessDate.
  ///
  /// In en, this message translates to:
  /// **'Enter cargo readiness date'**
  String get enterCargoReadinessDate;

  /// No description provided for @enterCity.
  ///
  /// In en, this message translates to:
  /// **'Enter city'**
  String get enterCity;

  /// No description provided for @enterCountry.
  ///
  /// In en, this message translates to:
  /// **'Enter country'**
  String get enterCountry;

  /// No description provided for @enterCvv.
  ///
  /// In en, this message translates to:
  /// **'Enter CVV'**
  String get enterCvv;

  /// No description provided for @enterData.
  ///
  /// In en, this message translates to:
  /// **'Enter data'**
  String get enterData;

  /// No description provided for @enterDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter a description'**
  String get enterDescription;

  /// No description provided for @enterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get enterFullName;

  /// No description provided for @enterFullNameOwnerSole.
  ///
  /// In en, this message translates to:
  /// **'Enter the full name of the owner of the sole proprietor/LLP'**
  String get enterFullNameOwnerSole;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get enterName;

  /// No description provided for @enterNameOrganization.
  ///
  /// In en, this message translates to:
  /// **'Enter the name of the organization'**
  String get enterNameOrganization;

  /// No description provided for @enterNikName.
  ///
  /// In en, this message translates to:
  /// **'Enter a name'**
  String get enterNikName;

  /// No description provided for @enterRegion.
  ///
  /// In en, this message translates to:
  /// **'Enter region'**
  String get enterRegion;

  /// No description provided for @enterRegistrationNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a registration number'**
  String get enterRegistrationNumber;

  /// No description provided for @enterRequirements.
  ///
  /// In en, this message translates to:
  /// **'Enter requirements'**
  String get enterRequirements;

  /// No description provided for @enterTheAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter the account number'**
  String get enterTheAccountNumber;

  /// No description provided for @enterTheBIK.
  ///
  /// In en, this message translates to:
  /// **'Enter the swift'**
  String get enterTheBIK;

  /// No description provided for @enterTheBank.
  ///
  /// In en, this message translates to:
  /// **'Enter the bank'**
  String get enterTheBank;

  /// No description provided for @enterTheBonusPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter the bonus price'**
  String get enterTheBonusPrice;

  /// No description provided for @enterTheName.
  ///
  /// In en, this message translates to:
  /// **'Enter the name'**
  String get enterTheName;

  /// No description provided for @enterThePrice.
  ///
  /// In en, this message translates to:
  /// **'Enter the price'**
  String get enterThePrice;

  /// No description provided for @enterTheQuantity.
  ///
  /// In en, this message translates to:
  /// **'Enter the quantity'**
  String get enterTheQuantity;

  /// No description provided for @enterTime.
  ///
  /// In en, this message translates to:
  /// **'Enter the time'**
  String get enterTime;

  /// No description provided for @enterTypeActivity.
  ///
  /// In en, this message translates to:
  /// **'Enter the type of activity'**
  String get enterTypeActivity;

  /// No description provided for @enterVolume.
  ///
  /// In en, this message translates to:
  /// **'Enter volume (м³)'**
  String get enterVolume;

  /// No description provided for @enterWeight.
  ///
  /// In en, this message translates to:
  /// **'Enter weight (kg)'**
  String get enterWeight;

  /// No description provided for @enterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterYourPhoneNumber;

  /// No description provided for @enter_a_new_password.
  ///
  /// In en, this message translates to:
  /// **'Enter a new password'**
  String get enter_a_new_password;

  /// No description provided for @enter_the_code_from_the_mail.
  ///
  /// In en, this message translates to:
  /// **'Enter the code from the mail'**
  String get enter_the_code_from_the_mail;

  /// No description provided for @enter_the_password.
  ///
  /// In en, this message translates to:
  /// **'Enter the password'**
  String get enter_the_password;

  /// No description provided for @enter_your_email_address.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get enter_your_email_address;

  /// No description provided for @enter_your_name.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enter_your_name;

  /// No description provided for @enter_your_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enter_your_phone_number;

  /// No description provided for @enter_your_surname.
  ///
  /// In en, this message translates to:
  /// **'Enter your surname'**
  String get enter_your_surname;

  /// No description provided for @equipment.
  ///
  /// In en, this message translates to:
  /// **'Equipment'**
  String get equipment;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @explore_the_app.
  ///
  /// In en, this message translates to:
  /// **'Welcome to sirius — the future of the gift world!'**
  String get explore_the_app;

  /// No description provided for @filesAreAdded.
  ///
  /// In en, this message translates to:
  /// **'Files are added'**
  String get filesAreAdded;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @find.
  ///
  /// In en, this message translates to:
  /// **'Find'**
  String get find;

  /// No description provided for @findCargo.
  ///
  /// In en, this message translates to:
  /// **'Find cargo'**
  String get findCargo;

  /// No description provided for @findOutWhyYouNeedtoAdvertiseProducts.
  ///
  /// In en, this message translates to:
  /// **'Find out why you need to advertise products?'**
  String get findOutWhyYouNeedtoAdvertiseProducts;

  /// No description provided for @first_add_the_stores_address.
  ///
  /// In en, this message translates to:
  /// **'First add the store\'s address!'**
  String get first_add_the_stores_address;

  /// No description provided for @forgot_your_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgot_your_password;

  /// No description provided for @foundDeliveryOutsideThePlatform.
  ///
  /// In en, this message translates to:
  /// **'Found delivery outside the platform (not through this system).'**
  String get foundDeliveryOutsideThePlatform;

  /// No description provided for @freightExchange.
  ///
  /// In en, this message translates to:
  /// **'Freight exchange'**
  String get freightExchange;

  /// No description provided for @fromWhere.
  ///
  /// In en, this message translates to:
  /// **'Where'**
  String get fromWhere;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @fullNameOwnerSole.
  ///
  /// In en, this message translates to:
  /// **'Full name of the owner of the sole proprietor/LLP'**
  String get fullNameOwnerSole;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @getCodeElse.
  ///
  /// In en, this message translates to:
  /// **'Get a new code via'**
  String get getCodeElse;

  /// No description provided for @get_it_again.
  ///
  /// In en, this message translates to:
  /// **'Get it again'**
  String get get_it_again;

  /// No description provided for @gifts_in_a_couple_of_clicks_fast_stylish_with_a_soul.
  ///
  /// In en, this message translates to:
  /// **'New customers, convenient sales and growth opportunities are waiting for you here. Start now!'**
  String get gifts_in_a_couple_of_clicks_fast_stylish_with_a_soul;

  /// No description provided for @giveRateTheCarrier.
  ///
  /// In en, this message translates to:
  /// **'Rate the carrier'**
  String get giveRateTheCarrier;

  /// No description provided for @goThroughVerificationAndBecome.
  ///
  /// In en, this message translates to:
  /// **'Go through verification and become\na verified carrier'**
  String get goThroughVerificationAndBecome;

  /// No description provided for @goThroughVerificationText.
  ///
  /// In en, this message translates to:
  /// **'Go through verification'**
  String get goThroughVerificationText;

  /// No description provided for @goToWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'Go to Whatsapp'**
  String get goToWhatsapp;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height (м)'**
  String get height;

  /// No description provided for @howManyBonusesDoYouWantSpend.
  ///
  /// In en, this message translates to:
  /// **'How many bonuses do you want to spend?'**
  String get howManyBonusesDoYouWantSpend;

  /// No description provided for @ifYouAlreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'If you already have an account, '**
  String get ifYouAlreadyHaveAnAccount;

  /// No description provided for @inProcessing.
  ///
  /// In en, this message translates to:
  /// **'In processing'**
  String get inProcessing;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get income;

  /// No description provided for @invalidNumberFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid number format'**
  String get invalidNumberFormat;

  /// No description provided for @invoiceForPayment.
  ///
  /// In en, this message translates to:
  /// **'Invoice for payment'**
  String get invoiceForPayment;

  /// No description provided for @isThereAnInstallmentPlan.
  ///
  /// In en, this message translates to:
  /// **'Is there an installment plan?'**
  String get isThereAnInstallmentPlan;

  /// No description provided for @itIsImpossible.
  ///
  /// In en, this message translates to:
  /// **'It is impossible to send a message'**
  String get itIsImpossible;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kg;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @length.
  ///
  /// In en, this message translates to:
  /// **'Length (м)'**
  String get length;

  /// No description provided for @link.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get link;

  /// No description provided for @loadingPoint.
  ///
  /// In en, this message translates to:
  /// **'Loading point'**
  String get loadingPoint;

  /// Locales for the application
  ///
  /// In en, this message translates to:
  /// **'Locales'**
  String get locales;

  /// No description provided for @logOutYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Log out of your account'**
  String get logOutYourAccount;

  /// No description provided for @log_in_to_the_app.
  ///
  /// In en, this message translates to:
  /// **'Log in to the app'**
  String get log_in_to_the_app;

  /// No description provided for @lookingForCarrier.
  ///
  /// In en, this message translates to:
  /// **'Looking for a carrier'**
  String get lookingForCarrier;

  /// No description provided for @lookingForWayToStandOutInTheMarket.
  ///
  /// In en, this message translates to:
  /// **'Looking for a way to stand out in the market?'**
  String get lookingForWayToStandOutInTheMarket;

  /// No description provided for @mail.
  ///
  /// In en, this message translates to:
  /// **'Mail'**
  String get mail;

  /// No description provided for @main.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get main;

  /// No description provided for @mainTypeActivity.
  ///
  /// In en, this message translates to:
  /// **'Main type of activity'**
  String get mainTypeActivity;

  /// No description provided for @moreThan100SuccessfulTransactionsDaily.
  ///
  /// In en, this message translates to:
  /// **'More than 100 successful transactions\ndaily!'**
  String get moreThan100SuccessfulTransactionsDaily;

  /// No description provided for @moreThanSuccessfulTransactionsDaily.
  ///
  /// In en, this message translates to:
  /// **'More than 100 successful \ntransactions daily!'**
  String get moreThanSuccessfulTransactionsDaily;

  /// No description provided for @myDocuments.
  ///
  /// In en, this message translates to:
  /// **'My documents'**
  String get myDocuments;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My orders'**
  String get myOrders;

  /// No description provided for @myProducts.
  ///
  /// In en, this message translates to:
  /// **'My products'**
  String get myProducts;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get myProfile;

  /// No description provided for @my_orders.
  ///
  /// In en, this message translates to:
  /// **'My orders'**
  String get my_orders;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @nameImenovanie.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameImenovanie;

  /// No description provided for @nameOrganization.
  ///
  /// In en, this message translates to:
  /// **'Name of the organization'**
  String get nameOrganization;

  /// No description provided for @neww.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get neww;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @notRequired.
  ///
  /// In en, this message translates to:
  /// **'Not required'**
  String get notRequired;

  /// No description provided for @nothingWasFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing was found.'**
  String get nothingWasFound;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @numberOfProducts.
  ///
  /// In en, this message translates to:
  /// **'Number of products'**
  String get numberOfProducts;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @onlinePayment.
  ///
  /// In en, this message translates to:
  /// **'Online payment'**
  String get onlinePayment;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @orderNumber.
  ///
  /// In en, this message translates to:
  /// **'Order number'**
  String get orderNumber;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @pass.
  ///
  /// In en, this message translates to:
  /// **'Pass'**
  String get pass;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwords_dont_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get passwords_dont_match;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @payByCard.
  ///
  /// In en, this message translates to:
  /// **'Pay by card'**
  String get payByCard;

  /// No description provided for @pdfOrPhoto1.
  ///
  /// In en, this message translates to:
  /// **'In PDF or photo format'**
  String get pdfOrPhoto1;

  /// No description provided for @pdfOrPhoto2.
  ///
  /// In en, this message translates to:
  /// **'no more than 10MB'**
  String get pdfOrPhoto2;

  /// No description provided for @period.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get period;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get personalInformation;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_number;

  /// No description provided for @photo_selection.
  ///
  /// In en, this message translates to:
  /// **'Photo selection'**
  String get photo_selection;

  /// No description provided for @physicRegister.
  ///
  /// In en, this message translates to:
  /// **'Physical'**
  String get physicRegister;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @productName.
  ///
  /// In en, this message translates to:
  /// **'Product name'**
  String get productName;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @provideCargoDetails.
  ///
  /// In en, this message translates to:
  /// **'Provide cargo details to get responses from carriers'**
  String get provideCargoDetails;

  /// No description provided for @pullDownToRefresh.
  ///
  /// In en, this message translates to:
  /// **'Pull down to refresh'**
  String get pullDownToRefresh;

  /// No description provided for @pullUpToLoadTheData.
  ///
  /// In en, this message translates to:
  /// **'Pull up to load the data'**
  String get pullUpToLoadTheData;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @rateTheCarrier.
  ///
  /// In en, this message translates to:
  /// **'Rate the carrier'**
  String get rateTheCarrier;

  /// No description provided for @region.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get region;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @register_two.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register_two;

  /// No description provided for @registration.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registration;

  /// No description provided for @repeat_the_password.
  ///
  /// In en, this message translates to:
  /// **'Repeat the password'**
  String get repeat_the_password;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @requiredFillIn.
  ///
  /// In en, this message translates to:
  /// **'Required to fill'**
  String get requiredFillIn;

  /// No description provided for @required_to_fill_in.
  ///
  /// In en, this message translates to:
  /// **'Required to fill in'**
  String get required_to_fill_in;

  /// No description provided for @respond.
  ///
  /// In en, this message translates to:
  /// **'Respond'**
  String get respond;

  /// No description provided for @reviewed.
  ///
  /// In en, this message translates to:
  /// **'Reviewed'**
  String get reviewed;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @sec.
  ///
  /// In en, this message translates to:
  /// **'sec'**
  String get sec;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @selectCarrierFromTheListOfRespondentsAndRate.
  ///
  /// In en, this message translates to:
  /// **'Select a carrier from the list of respondents and rate it.'**
  String get selectCarrierFromTheListOfRespondentsAndRate;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select a category'**
  String get selectCategory;

  /// No description provided for @selectCity.
  ///
  /// In en, this message translates to:
  /// **'Select a city'**
  String get selectCity;

  /// No description provided for @selectCurrency.
  ///
  /// In en, this message translates to:
  /// **'Select currency'**
  String get selectCurrency;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLanguage;

  /// No description provided for @selectRole.
  ///
  /// In en, this message translates to:
  /// **'Select a role'**
  String get selectRole;

  /// No description provided for @selectSubcategory.
  ///
  /// In en, this message translates to:
  /// **'Select a subcategory'**
  String get selectSubcategory;

  /// No description provided for @selectType.
  ///
  /// In en, this message translates to:
  /// **'Select type'**
  String get selectType;

  /// No description provided for @selectView.
  ///
  /// In en, this message translates to:
  /// **'Select view'**
  String get selectView;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @sent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get sent;

  /// No description provided for @sentDate.
  ///
  /// In en, this message translates to:
  /// **'Sent date'**
  String get sentDate;

  /// No description provided for @shareYourExperience.
  ///
  /// In en, this message translates to:
  /// **'Share your experience'**
  String get shareYourExperience;

  /// No description provided for @siriusDescription.
  ///
  /// In en, this message translates to:
  /// **'New generation freight exchange - reliable, fast, convenient.'**
  String get siriusDescription;

  /// No description provided for @specifyTheRoute.
  ///
  /// In en, this message translates to:
  /// **'Specify the route'**
  String get specifyTheRoute;

  /// No description provided for @specifyTheRouteCharacter.
  ///
  /// In en, this message translates to:
  /// **'Specify the route, characteristics and receive feedback from carriers'**
  String get specifyTheRouteCharacter;

  /// No description provided for @specifyTheRouteCharacteristics.
  ///
  /// In en, this message translates to:
  /// **'Specify the route, characteristics and receive feedback from carriers'**
  String get specifyTheRouteCharacteristics;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @subcategory.
  ///
  /// In en, this message translates to:
  /// **'Subcategory'**
  String get subcategory;

  /// No description provided for @successfullyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Successfully updated!'**
  String get successfullyUpdated;

  /// No description provided for @supportService.
  ///
  /// In en, this message translates to:
  /// **'Support service'**
  String get supportService;

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surname;

  /// No description provided for @termOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termOfUse;

  /// No description provided for @theMainStateRegistrationNumber.
  ///
  /// In en, this message translates to:
  /// **'The main state registration number'**
  String get theMainStateRegistrationNumber;

  /// No description provided for @theOrderHasBeenUpdatedWaitForResponses.
  ///
  /// In en, this message translates to:
  /// **'The order has been updated!\nWait for responses'**
  String get theOrderHasBeenUpdatedWaitForResponses;

  /// No description provided for @theServiceIsTemporarilyUnavailable.
  ///
  /// In en, this message translates to:
  /// **'The service is temporarily unavailable'**
  String get theServiceIsTemporarilyUnavailable;

  /// No description provided for @the_list_is_empty.
  ///
  /// In en, this message translates to:
  /// **'The list is empty'**
  String get the_list_is_empty;

  /// No description provided for @the_minimum_password_length_is_6.
  ///
  /// In en, this message translates to:
  /// **'The minimum password length is 6'**
  String get the_minimum_password_length_is_6;

  /// No description provided for @thisSectionIsUnderDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Section is under development'**
  String get thisSectionIsUnderDevelopment;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @toAddProductSpecifyTheStoresAddressInYourProfile.
  ///
  /// In en, this message translates to:
  /// **'To add a product, specify the store\'s address in your profile.'**
  String get toAddProductSpecifyTheStoresAddressInYourProfile;

  /// No description provided for @toPay.
  ///
  /// In en, this message translates to:
  /// **'To pay'**
  String get toPay;

  /// No description provided for @to_change.
  ///
  /// In en, this message translates to:
  /// **'To change'**
  String get to_change;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @transportRequirements.
  ///
  /// In en, this message translates to:
  /// **'Transport requirements'**
  String get transportRequirements;

  /// No description provided for @typeOfPackaging.
  ///
  /// In en, this message translates to:
  /// **'Type of packaging'**
  String get typeOfPackaging;

  /// No description provided for @typeOfTransport.
  ///
  /// In en, this message translates to:
  /// **'Type of transport'**
  String get typeOfTransport;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// No description provided for @unloadingPoint.
  ///
  /// In en, this message translates to:
  /// **'Unloading point'**
  String get unloadingPoint;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update!'**
  String get update;

  /// No description provided for @updateDotDotDot.
  ///
  /// In en, this message translates to:
  /// **'Update...'**
  String get updateDotDotDot;

  /// No description provided for @uploadingDotDotDot.
  ///
  /// In en, this message translates to:
  /// **'Uploading...'**
  String get uploadingDotDotDot;

  /// The
  ///
  /// In en, this message translates to:
  /// **'The '**
  String verySoonWillAppearInTheApplicationAndYouWillAbleCheck(String value);

  /// No description provided for @volume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get volume;

  /// No description provided for @volumes.
  ///
  /// In en, this message translates to:
  /// **'Volumes'**
  String get volumes;

  /// No description provided for @wasAddDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'was added 20 days ago. Please rate the carrier'**
  String get wasAddDaysAgo;

  /// No description provided for @we_have_sent_a_confirmation.
  ///
  /// In en, this message translates to:
  /// **'We have sent a confirmation code to your email address.: '**
  String get we_have_sent_a_confirmation;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @welcomeToSirius.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Sirius'**
  String get welcomeToSirius;

  /// No description provided for @where.
  ///
  /// In en, this message translates to:
  /// **'Where'**
  String get where;

  /// No description provided for @width.
  ///
  /// In en, this message translates to:
  /// **'Width (м)'**
  String get width;

  /// No description provided for @withConditions.
  ///
  /// In en, this message translates to:
  /// **'with conditions'**
  String get withConditions;

  /// No description provided for @workSchedule.
  ///
  /// In en, this message translates to:
  /// **'Work schedule'**
  String get workSchedule;

  /// No description provided for @write.
  ///
  /// In en, this message translates to:
  /// **'Write'**
  String get write;

  /// No description provided for @writeComment.
  ///
  /// In en, this message translates to:
  /// **'Write a comment ..'**
  String get writeComment;

  /// No description provided for @writeMessage.
  ///
  /// In en, this message translates to:
  /// **'Write a message'**
  String get writeMessage;

  /// No description provided for @writeToUsOnWhatsAppweAreAlwaysTouchAndReadytoHelp.
  ///
  /// In en, this message translates to:
  /// **'Write to us on WhatsApp - we are always in touch \n and ready to help!'**
  String get writeToUsOnWhatsAppweAreAlwaysTouchAndReadytoHelp;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @yesIGetOut.
  ///
  /// In en, this message translates to:
  /// **'Yes, I get out'**
  String get yesIGetOut;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @youSearched.
  ///
  /// In en, this message translates to:
  /// **'You\'ve already searched'**
  String get youSearched;

  /// No description provided for @yourOpinionImportantUs.
  ///
  /// In en, this message translates to:
  /// **'Your opinion is important to us!'**
  String get yourOpinionImportantUs;

  /// No description provided for @yuridicRegister.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get yuridicRegister;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'kk', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'kk':
      return AppLocalizationsKk();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
