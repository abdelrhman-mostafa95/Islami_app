import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_detalis/quran_details.dart';

class SuraTitle extends StatelessWidget {
  String suraTitle;
  String numOfVerses;
  int index;

  SuraTitle(
      {required this.suraTitle,
      required this.numOfVerses,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, QuranDetails.routeName,
              arguments: SuraArguments(suraTitle: suraTitle, index: index));
        },
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(numOfVerses,
                          style: Theme.of(context).textTheme.titleMedium))),
              Container(
                color: Theme.of(context).dividerColor,
                width: 2,
              ),
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        suraTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

class SuraArguments {
  String suraTitle;
  int index;

  SuraArguments({required this.suraTitle, required this.index});
}
