import 'package:flutter/material.dart';

class ThemeBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSelectedThemeItem('Dark'),
          SizedBox(
            height: 10,
          ),
          buildUnSelectedThemeItem('Light')
        ],
      ),
    );
  }

  Widget buildSelectedThemeItem(String selectedTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(selectedTheme,
            style: TextStyle(fontSize: 22, color: Colors.black)),
        Icon(
          Icons.check,
          size: 30,
        )
      ],
    );
  }

  Widget buildUnSelectedThemeItem(String unselectedTheme) {
    return Text(unselectedTheme,
        style: TextStyle(fontSize: 22, color: Colors.black));
  }
}
