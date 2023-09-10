import 'package:shared_preferences/shared_preferences.dart';

class ThemeSharedPreferences {
  static const String _keyTheme = 'theme';
  static const String _keyMode = 'mode';

  static Future<void> setThemeName(String theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyTheme, theme);
  }

  static Future<String?> getThemeName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyTheme);
  }

  static Future<void> setModeName(String mode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyMode, mode);
  }

  static Future<String?> getModeName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyMode);
  }
}
