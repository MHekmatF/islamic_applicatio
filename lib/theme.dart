import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryLight = const Color(0xFFB7935F);
  static Color primaryDark = const Color(0xFF141A2E);
  static Color black = const Color(0xFF242424);
  static Color white = const Color(0xFFFFFFFF);
  static Color gold = const Color(0xFFFACC1D);
  static ThemeData lightTheme = ThemeData(
    // scaffoldBackgroundColor: Colors.black,
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    inputDecorationTheme: const InputDecorationTheme(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryLight,
      unselectedItemColor: white,
      selectedItemColor: black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: black,
      ),
    ),
    textTheme: TextTheme(
        headlineSmall:
            TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: black),
        titleMedium:
            TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: black)),
  );
  static ThemeData darkTheme = ThemeData(
    // scaffoldBackgroundColor: Colors.black,
    primaryColor: primaryDark,
    scaffoldBackgroundColor: Colors.transparent,
    inputDecorationTheme: const InputDecorationTheme(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryDark,
      unselectedItemColor: white,
      selectedItemColor: gold,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),
    textTheme: TextTheme(
        headlineSmall:
            TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: white),
        titleMedium:
            TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: gold)),
  );
}
