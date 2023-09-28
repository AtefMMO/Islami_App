import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';

  SharedPreferences? sharedPreferences;

  initializePreferences() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  loadPrefrences() async {
    await initializePreferences();
    isDarkTheme = sharedPreferences!.getBool('isDark') ?? false;
    appTheme = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    language = sharedPreferences!.getString('lang') ?? 'en';
    if (language == 'en') {
      appLanguage = 'en';
    } else {
      appLanguage = 'ar';
    }
    notifyListeners();
  }

  AppConfigProvider() {
    loadPrefrences();
  }

  void changeLanguage(String newLanguage) async {
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

  bool isDarkTheme = false;
  String language = 'en';

  ThemeMode appTheme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) async {
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
