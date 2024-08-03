import 'package:flutter/material.dart';

class Verses extends StatelessWidget {
  String verse;

  Verses({required this.verse});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        verse,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
      ),
    );
  }
}
