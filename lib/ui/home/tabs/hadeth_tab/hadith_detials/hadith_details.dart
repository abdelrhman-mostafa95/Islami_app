import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadith_detials/hadith_content.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/settings_provider/settings_provider.dart';

class HadithDetails extends StatelessWidget {
  const HadithDetails({super.key});

  static const String routeName = '/hadith';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    HadithItem hadithItem =
        ModalRoute.of(context)?.settings.arguments as HadithItem;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(provider.currentTheme == ThemeMode.light
                  ? 'assets/images/bg3.png'
                  : 'assets/images/dark_bg.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadithItem.title),
        ),
        body: Card(
          child: HadithContent(content: hadithItem.content),
        ),
      ),
    );
  }
}
