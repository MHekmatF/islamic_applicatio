import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  SharedPreferences? sharedPreferences;
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

  /*  must put late coz in intilaize the value is unknown  */
  // late String backgroundImageName =
  //     themeMode == ThemeMode.light ? "default_bg" : "default_bg";
  String get backgroundImageName =>
      themeMode == ThemeMode.light ? "default_bg" : "dark_bg";

  String get sebhaName => themeMode == ThemeMode.light
      ? "body_sebha_logo.png"
      : "body_sebha_dark.png";

  String get headSebha => themeMode == ThemeMode.light
      ? "head_sebha_logo.png"
      : "head_sebha_dark.png";

  // void changeTheme(ThemeMode selectedTheme) {
  //   /* this for   bootun sheet to not coose dark twice and rebuld for no reason*/
  //   if (selectedTheme == themeMode) return;
  //   themeMode = selectedTheme;
  //   saveTheme(themeMode);
  //   notifyListeners();
  // }

  //practice hosni
  Future<void> changeTheme(ThemeMode selectedTheme) async {
    /* this for   bootun sheet to not coose dark twice and rebuld for no reason*/
    if (selectedTheme == themeMode) return;
    themeMode = selectedTheme;
    notifyListeners();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isDark', selectedTheme == ThemeMode.dark);
  }

  // void changeLanguage(String selectedLanguage) {
  //   if (selectedLanguage == languageCode) return;
  //
  //   languageCode = selectedLanguage;
  //   notifyListeners();
  // }

  //eng practice
  void changeLanguage(String selectedLanguage) async {
    if (selectedLanguage == languageCode) return;

    languageCode = selectedLanguage;
    notifyListeners();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('lang', selectedLanguage);
  }

  //practice noura
  Future<void> saveTheme(ThemeMode themeMode) async {
    String newTheme = themeMode == ThemeMode.dark ? "dark" : "light";
    await sharedPreferences!.setString('theme', newTheme);
  }

  String? getTheme() {
    return sharedPreferences!.getString('theme');
  }

  Future<void> loadThemeData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? oldTheme = getTheme();
    if (oldTheme != null) {
      themeMode = oldTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future<void> getlang() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? lang = pref.getString('lang');
    if (lang != null) {
      languageCode = lang;
      notifyListeners();
    }
  }
}
