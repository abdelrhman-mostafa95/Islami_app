import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_detalis/verses.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/sura_title.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/settings_provider/settings_provider.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = '/quran';

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    SuraArguments arguments =
        ModalRoute.of(context)?.settings.arguments as SuraArguments;
    if (verses.isEmpty) loadFile(arguments.index);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(provider.currentTheme == ThemeMode.light
                  ? 'assets/images/bg3.png'
                  : 'assets/images/dark_bg.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text('سورة ${arguments.suraTitle}'),
        ),
        body: verses.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Card(
                margin: EdgeInsets.all(12),
                child: ListView.separated(
                    itemBuilder: (context, index) => Verses(
                          verse: verses[index],
                    index: index,
                  ),
              separatorBuilder: (context, index) =>
                  Padding(padding: EdgeInsets.all(0))
              // Divider(
              //   // color: Color(0xFFB7935F),
              // ),
              ,
              itemCount: verses.length),
        ),
      ),
    );
  }

  void loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = fileContent.split('\n');
    verses = suraLines;
    setState(() {});
  }
}
