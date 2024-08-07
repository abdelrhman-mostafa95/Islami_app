import 'package:flutter/material.dart';

class HadithContent extends StatelessWidget {
  String content;

  HadithContent({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
          child: Text(
        content,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
      )),
    );
  }
}
