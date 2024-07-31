import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen()
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          scaffoldBackgroundColor: Colors.transparent,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.black,
              selectedIconTheme: IconThemeData(
                size: 30,
              ),
              unselectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: false)),
    );
  }
}
