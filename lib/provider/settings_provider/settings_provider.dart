import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = 'en';

  changeAppLanguage(String newLang) {
    if (newLang == currentLanguage) {
      return;
    }
    currentLanguage = newLang;
    saveLanguage(currentLanguage);
    notifyListeners();
  }

  saveLanguage(String lang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("lang", lang);
  }

  getLanguge() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("lang") ?? "en";
    currentLanguage = lang;
    notifyListeners();
  }

  changeThemeMode(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    saveTheme(currentTheme);
    notifyListeners();
  }

  saveTheme(ThemeMode theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (theme == ThemeMode.light) {
      await prefs.setString("theme", "light");
    } else {
      await prefs.setString("theme", "dark");
    }
  }

  getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString("theme") ?? "light";
    if (theme == 'light') {
      currentTheme = ThemeMode.light;
    } else {
      currentTheme = ThemeMode.dark;
    }
    notifyListeners();
  }
}
