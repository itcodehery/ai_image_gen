import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_integrated_app/flutter_gen/';

class LanguageSharedPreferences {
  static const String appLanguageCode = 'langCode';

  static Locale _locale(String languageCode) {
    switch (languageCode) {
      case englishLanguage:
        return const Locale(englishLanguage, 'US');
      case arabicLanguage:
        return const Locale(arabicLanguage, 'DZ');
      default:
        return const Locale(englishLanguage, 'US');
    }
  }

  static Future<Locale> setLocale(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(appLanguageCode, languageCode);
    return _locale(languageCode);
  }

  static Future<Locale> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(appLanguageCode) ?? englishLanguage;
    return _locale(languageCode);
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context);
}
