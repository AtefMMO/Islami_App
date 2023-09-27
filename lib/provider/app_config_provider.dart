import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  static String key = 'key';
  SharedPreferences? sharedPreferences;

  void ChangeLanguage(String newLanguage) {
    if (appLanguage != newLanguage) {
      appLanguage = newLanguage;
      notifyListeners();
    }
  }

  bool? darkTheme;

  initSp() async {
    darkTheme = sharedPreferences!.getBool(key);
    if (darkTheme!) {
      appTheme = ThemeMode.dark;
    }
  }

  loadSp() async {
    await initSp();
  }

  saveSp() async {
    await initSp();
    darkTheme = await sharedPreferences!.setBool(key, darkTheme!);
  }

  ThemeMode appTheme = ThemeMode.light;

  void ChangeTheme(ThemeMode newTheme) async {
    if (appTheme != newTheme) {
      appTheme = newTheme;
      darkTheme = true;
      saveSp();
      notifyListeners();
    }
  }
}
