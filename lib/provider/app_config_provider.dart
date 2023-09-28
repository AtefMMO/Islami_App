import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';

  SharedPreferences? sharedPreferences;

  void ChangeLanguage(String newLanguage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (appLanguage != newLanguage) {
      appLanguage = newLanguage;
      if (appLanguage == 'en') {
        prefs.setString('lang', 'en');
      } else {
        prefs.setString('lang', 'ar');
      }
      notifyListeners();
    }
  }

  bool isdarkTheme = false;
  String? language = 'en';

  ThemeMode appTheme = ThemeMode.light;

  AppConfigProvider({required this.isdarkTheme, required this.language}) {
    appTheme = isdarkTheme ? ThemeMode.dark : ThemeMode.light;
    if (language == 'en') {
      appLanguage = 'en';
    } else {
      appLanguage = 'ar';
    }
  }

  void ChangeTheme(ThemeMode newTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (appTheme != newTheme) {
      appTheme = newTheme;
      if (appTheme == ThemeMode.light) {
        prefs.setBool('isDark', false);
      } else {
        prefs.setBool('isDark', true);
      }

      notifyListeners();
    }
  }
}
