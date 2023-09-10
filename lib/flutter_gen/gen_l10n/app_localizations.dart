import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'app_localizations_en.dart';

abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  String get settingsPage;

  String get changeLanguage;

  String get noResultFound;

  String get themes;

  String get languages;

  String get language;

  String get loading;

  String get download;

  String get failed;

  String get appMode;

  String get darkMode;

  String get lightMode;

  String get systemMode;

  String get putAnythingInYourMind;

  String get change;

  /// No description provided for @mainDirectory.
  ///
  /// In en, this message translates to:
  /// **'Main Directory'**
  String get mainDirectory;

  /// No description provided for @imageWasSaved.
  ///
  /// In en, this message translates to:
  /// **'Image was Saved Successfully in'**
  String get imageWasSaved;

  /// No description provided for @chooseStyle.
  ///
  /// In en, this message translates to:
  /// **'Choose style for the image'**
  String get chooseStyle;

  /// No description provided for @chooseDirectory.
  ///
  /// In en, this message translates to:
  /// **'Choose Directory'**
  String get chooseDirectory;

  /// No description provided for @confirmDirectory.
  ///
  /// In en, this message translates to:
  /// **'Do you want to Choose Directory to make the app can save images in your Device?'**
  String get confirmDirectory;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;
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
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsEn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
