import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/tasbeh_tab/tasbeh_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/images/bg3.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text('اسلامي'),
          centerTitle: true,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(0xFFB7935F),
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
                  label: 'القرآن'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/Group 6@3x.png')),
                  label: 'الحديث'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/sebha_blue@3x.png')),
                  label: 'السبحة'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/radio_blue@2x.png')),
                  label: 'الراديو'),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [QuranTab(), HadethTab(), TasbehTab(), RadioTab()];
}
