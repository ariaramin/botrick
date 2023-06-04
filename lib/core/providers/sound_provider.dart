import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:botrick/di/di.dart';

class SoundProvider extends ChangeNotifier {
  final SharedPreferences _preferences = locator.get();
  static const String soundKey = 'sound_key';
  late bool _isMute;

  bool get isMute => _isMute;

  SoundProvider() {
    getSoundState();
  }

  set isMute(bool value) {
    _isMute = value;
    setSoundState(value);
    notifyListeners();
  }

  setSoundState(bool value) {
    _preferences.setBool(soundKey, value);
  }

  getSoundState() {
    _isMute = _preferences.getBool(soundKey) ?? false;
    notifyListeners();
  }
}
