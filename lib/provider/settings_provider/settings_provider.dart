import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = 'en';

  changeAppLanguage(String newLang) {
    if (newLang == currentLanguage) {
      return;
    }
    currentLanguage = newLang;
    notifyListeners();
  }

  changeThemeMode(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }
}
