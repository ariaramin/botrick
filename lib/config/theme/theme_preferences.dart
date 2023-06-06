import 'package:botrick/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  final SharedPreferences prefs = locator.get();
  static const String _keyDarkModeEnabled = 'darkModeEnabled';

  bool isDarkModeEnabled() {
    return prefs.getBool(_keyDarkModeEnabled) ?? false;
  }

  Future<void> setDarkModeEnabled(bool value) async {
    await prefs.setBool(_keyDarkModeEnabled, value);
  }
}
