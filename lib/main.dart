import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/provider/settings_provider/settings_provider.dart';
import 'package:islami_app/style/theme_data.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadith_detials/hadith_details.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_detalis/quran_details.dart';
import 'package:islami_app/ui/splash/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.currentLanguage),
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        QuranDetails.routeName: (_) => QuranDetails(),
        HadithDetails.routeName: (_) => HadithDetails(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.currentTheme,
    );
  }
}
