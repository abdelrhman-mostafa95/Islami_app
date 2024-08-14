import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/settings_tab/settings_tab.dart';
import 'package:islami_app/ui/home/tabs/tasbeh_tab/tasbeh_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../provider/settings_provider/settings_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: provider.currentTheme == ThemeMode.light
                  ? AssetImage('assets/images/bg3.png')
                  : AssetImage('assets/images/dark_bg.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_title),
          centerTitle: true,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).colorScheme.secondary,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/quran@3x.png')),
                  label: AppLocalizations.of(context)?.quran),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/Group 6@3x.png')),
                  label: AppLocalizations.of(context)?.hadith),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/sebha_blue@3x.png')),
                  label: AppLocalizations.of(context)?.sebha),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/radio_blue@2x.png')),
                  label: AppLocalizations.of(context)?.radio),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)?.settings),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    RadioTab(),
    SettingsTab()
  ];
}
