import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/settings_provider/settings_provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
    return Scaffold(
        body: provider.currentTheme == ThemeMode.light
            ? Image.asset(
                'assets/images/splash.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/splash_2.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ));
  }
}
