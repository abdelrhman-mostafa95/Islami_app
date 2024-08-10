import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/settings_tab/language_bottom.dart';
import 'package:islami_app/ui/home/tabs/settings_tab/theme_bottom.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Theme',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 9),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Text('Light',
                    style: TextStyle(fontSize: 14, color: Colors.black))),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Language',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 9),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Text('Arabic',
                    style: TextStyle(fontSize: 14, color: Colors.black))),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottom(),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottom());
  }
}
