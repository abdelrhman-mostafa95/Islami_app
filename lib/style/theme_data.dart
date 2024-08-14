import 'package:flutter/material.dart';

class MyThemeData {
  static const Color goldColor = Color(0xFFB7935F);
  static const Color darkColor = Color(0xFF141A2E);
  static const Color yellowColor = Color(0xFFFACC1D);
  static ThemeData lightTheme = ThemeData(
      primaryColor: goldColor,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black)),
      scaffoldBackgroundColor: Colors.transparent,
      // canvasColor: Color(0xFFB7935F),
      colorScheme:
          ColorScheme.fromSeed(seedColor: goldColor, primary: goldColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(
            size: 30,
          ),
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.all(12),
      ),
      dividerColor: goldColor,
      textTheme: TextTheme(
          labelMedium: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
          titleMedium: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          bodySmall: TextStyle(fontSize: 18, color: Colors.black),
          labelSmall: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)));
  static ThemeData darkTheme = ThemeData(
    primaryColor: darkColor,
    colorScheme: ColorScheme.fromSeed(
        seedColor: darkColor, secondary: darkColor, primary: yellowColor),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: yellowColor),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white)),
    scaffoldBackgroundColor: Colors.transparent,
    // canvasColor: Color(0xFFB7935F),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowColor,
        selectedIconTheme: IconThemeData(
          size: 30,
        ),
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: false),
    cardTheme: CardTheme(
      color: darkColor,
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      margin: EdgeInsets.all(12),
    ),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: darkColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    dividerColor: yellowColor,
    textTheme: TextTheme(
        labelMedium: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
        titleMedium: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        bodySmall: TextStyle(fontSize: 22, color: Colors.white),
        labelSmall: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
  );
}
