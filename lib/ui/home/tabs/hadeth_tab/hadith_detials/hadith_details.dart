import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadith_detials/hadith_content.dart';

class HadithDetails extends StatelessWidget {
  const HadithDetails({super.key});

  static const String routeName = '/hadith';

  @override
  Widget build(BuildContext context) {
    HadithItem hadithItem =
        ModalRoute.of(context)?.settings.arguments as HadithItem;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/images/bg3.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadithItem.title),
        ),
        body: Card(
          margin: EdgeInsets.all(12),
          elevation: 12,
          color: Color(0xFFB7935F),
          child: HadithContent(content: hadithItem.content),
        ),
      ),
    );
  }
}
