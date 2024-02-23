import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
    Locale('id')
  ];

  /// No description provided for @titleLogin.
  ///
  /// In id, this message translates to:
  /// **'Selamat Datang'**
  String get titleLogin;

  /// No description provided for @titleRegister.
  ///
  /// In id, this message translates to:
  /// **'Buat Akun Anda'**
  String get titleRegister;

  /// No description provided for @email.
  ///
  /// In id, this message translates to:
  /// **'Alamat Email'**
  String get email;

  /// No description provided for @name.
  ///
  /// In id, this message translates to:
  /// **'Nama'**
  String get name;

  /// No description provided for @password.
  ///
  /// In id, this message translates to:
  /// **'Kata Sandi'**
  String get password;

  /// No description provided for @loginButton.
  ///
  /// In id, this message translates to:
  /// **'Masuk'**
  String get loginButton;

  /// No description provided for @registerButton.
  ///
  /// In id, this message translates to:
  /// **'Daftar'**
  String get registerButton;

  /// No description provided for @loginGoButton.
  ///
  /// In id, this message translates to:
  /// **'Pengguna baru? Daftar'**
  String get loginGoButton;

  /// No description provided for @regGoButton.
  ///
  /// In id, this message translates to:
  /// **'Sudah punya akun? Masuk'**
  String get regGoButton;

  /// No description provided for @validationEmail.
  ///
  /// In id, this message translates to:
  /// **'Silakan masukkan alamat email yang valid.'**
  String get validationEmail;

  /// No description provided for @validationName.
  ///
  /// In id, this message translates to:
  /// **'Nama harus terdiri dari minimal 4 karakter.'**
  String get validationName;

  /// No description provided for @validationPw.
  ///
  /// In id, this message translates to:
  /// **'Kata sandi harus terdiri dari minimal 8 karakter.'**
  String get validationPw;

  /// No description provided for @stories.
  ///
  /// In id, this message translates to:
  /// **'Cerita'**
  String get stories;

  /// No description provided for @addStory.
  ///
  /// In id, this message translates to:
  /// **'Tambah Cerita'**
  String get addStory;

  /// No description provided for @settings.
  ///
  /// In id, this message translates to:
  /// **'Pengaturan'**
  String get settings;

  /// No description provided for @labelDesc.
  ///
  /// In id, this message translates to:
  /// **'Tambahkan deskripsi disini...'**
  String get labelDesc;

  /// No description provided for @noImage.
  ///
  /// In id, this message translates to:
  /// **'Tidak Ada Gambar'**
  String get noImage;

  /// No description provided for @upload.
  ///
  /// In id, this message translates to:
  /// **'Unggah'**
  String get upload;

  /// No description provided for @addBio.
  ///
  /// In id, this message translates to:
  /// **'Tambah'**
  String get addBio;

  /// No description provided for @userName.
  ///
  /// In id, this message translates to:
  /// **'Nama pengguna'**
  String get userName;

  /// No description provided for @phone.
  ///
  /// In id, this message translates to:
  /// **'Nomor'**
  String get phone;

  /// No description provided for @logout.
  ///
  /// In id, this message translates to:
  /// **'Keluar'**
  String get logout;

  /// No description provided for @logoutDesc.
  ///
  /// In id, this message translates to:
  /// **'Apakah kamu yakin ingin keluar?'**
  String get logoutDesc;

  /// No description provided for @cancel.
  ///
  /// In id, this message translates to:
  /// **'Kembali'**
  String get cancel;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'id': return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
