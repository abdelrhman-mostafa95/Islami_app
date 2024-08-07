import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadith_detials/hadith_details.dart';

import 'hadeth_tab.dart';

class HadithTitleWidget extends StatelessWidget {
  HadithItem hadithItem;

  HadithTitleWidget({required this.hadithItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HadithDetails.routeName,
            arguments: hadithItem);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          hadithItem.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
    );
  }
}
