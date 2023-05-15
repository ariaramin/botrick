import 'package:shared_preferences/shared_preferences.dart';
import 'package:whiz/di/di.dart';

class OnBoardingManager {
  final SharedPreferences _preferences = locator.get();
  static const String isFirstTime = "is_first_time";

  setState() {
    _preferences.setBool(isFirstTime, false);
  }

  bool getState() {
    return _preferences.getBool(isFirstTime) ?? true;
  }
}
