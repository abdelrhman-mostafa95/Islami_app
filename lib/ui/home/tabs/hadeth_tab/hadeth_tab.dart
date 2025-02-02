import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadith_title-widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadithItem> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) loadHadithFile();
    return Container(
      child: hadithList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/hadeth_logo.png')),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                                  color: Theme.of(context).dividerColor))),
                      child: Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(AppLocalizations.of(context)!.ahadith,
                              style: Theme.of(context).textTheme.labelMedium),
                        ),
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: ListView.separated(
                      itemBuilder: (context, index) => HadithTitleWidget(
                            hadithItem: hadithList[index],
                          ),
                      separatorBuilder: (context, index) => Divider(
                            indent: 30,
                            endIndent: 30,
                            color: Theme.of(context).dividerColor,
                          ),
                      itemCount: hadithList.length),
                )
              ],
            ),
    );
  }

  void loadHadithFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allAhadith = fileContent.split('#');
    for (int i = 0; i < allAhadith.length; i++) {
      List<String> hadithLines = allAhadith[i].trim().split('\n');
      String hadithTitle = hadithLines[0];
      hadithLines.removeAt(0);
      String hadithContent = hadithLines.join('\n');
      HadithItem hadithItem =
          HadithItem(title: hadithTitle, content: hadithContent);
      hadithList.add(hadithItem);
      setState(() {

      });
    }
  }
}

class HadithItem {
  String title;
  String content;

  HadithItem({required this.title, required this.content});
}
