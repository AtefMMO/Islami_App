import 'package:flutter/material.dart';
class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';

  void ChangeLanguage(String newLanguage) {
    if (appLanguage != newLanguage) {
      appLanguage = newLanguage;
      notifyListeners();
    }
  }

  ThemeMode appTheme = ThemeMode.light;

  void ChangeTheme(ThemeMode newTheme) {
    if (appTheme != newTheme) {
      appTheme = newTheme;
      notifyListeners();
    }
  }
}
