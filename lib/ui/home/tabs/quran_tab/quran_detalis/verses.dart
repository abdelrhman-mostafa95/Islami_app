import 'package:flutter/material.dart';

class Verses extends StatelessWidget {
  String verse;
  int index;

  Verses({required this.verse, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(10),
      // alignment: Alignment.center,
      child: Text(
        '$verse${index + 1}',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
