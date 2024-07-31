import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
    return Scaffold(
        body: Image.asset(
      'assets/images/splash.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    ));
  }
}
