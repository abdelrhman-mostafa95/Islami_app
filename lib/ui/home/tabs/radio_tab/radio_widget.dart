import 'package:flutter/material.dart';
import 'package:islami_app/provider/settings_provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../api/model/Radios.dart';
import '../../../../style/theme_data.dart';

class RadioWidget extends StatelessWidget {
  final Radios radioChannels;

  const RadioWidget({super.key, required this.radioChannels});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    print(radioChannels.name);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.skip_previous,
                color: provider.currentTheme == ThemeMode.light
                    ? MyThemeData.goldColor
                    : MyThemeData.darkColor),
            SizedBox(width: MediaQuery.of(context).size.width * 0.06),
            Icon(Icons.play_arrow,
                size: 40,
                color: provider.currentTheme == ThemeMode.light
                    ? MyThemeData.goldColor
                    : MyThemeData.darkColor),
            SizedBox(width: MediaQuery.of(context).size.width * 0.06),
            Icon(Icons.pause,
                size: 40,
                color: provider.currentTheme == ThemeMode.light
                    ? MyThemeData.goldColor
                    : MyThemeData.darkColor),
            SizedBox(width: MediaQuery.of(context).size.width * 0.06),
            Icon(Icons.skip_next,
                color: provider.currentTheme == ThemeMode.light
                    ? MyThemeData.goldColor
                    : MyThemeData.darkColor)
          ],
        ),
        Text(radioChannels.name ?? '')
      ],
    );
  }
}