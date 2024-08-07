import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadith_title-widget.dart';

class HadethTab extends StatelessWidget {
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
                              horizontal:
                                  BorderSide(color: Color(0xFFB7935F)))),
                      child: Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('الأحاديث',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ),
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: ListView.separated(
                      itemBuilder: (context, index) => HadithTitleWidget(
                            hadithItem: hadithList[index],
                          ),
                      separatorBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 2,
                            color: Color(0xFFB7935F),
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
    }
  }
}

class HadithItem {
  String title;
  String content;

  HadithItem({required this.title, required this.content});
}
