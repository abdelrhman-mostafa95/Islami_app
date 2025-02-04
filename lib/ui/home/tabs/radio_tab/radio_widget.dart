import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/provider/settings_provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../api/model/Radios.dart';
import '../../../../style/theme_data.dart';

class RadioWidget extends StatefulWidget {
  final Radios radioChannels;
  void Function() next,previous;
  final AudioPlayer player;

  RadioWidget({super.key, required this.radioChannels, required this.next, required this.previous, required this.player});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.skip_previous,size: 40,
                  color: provider.currentTheme == ThemeMode.light
                      ? MyThemeData.goldColor
                      : MyThemeData.whiteColor),
              onPressed: () {
                widget.previous();
              },
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.06),
            IconButton(
                icon: Icon(Icons.play_arrow,size: 40,
                    color: provider.currentTheme == ThemeMode.light
                        ? MyThemeData.goldColor
                        : MyThemeData.whiteColor),
              onPressed: () {
                widget.player.play(UrlSource(widget.radioChannels.url!));
              },
                ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.06),
            IconButton(
              icon: Icon(Icons.pause,size: 40,
                  color: provider.currentTheme == ThemeMode.light
                      ? MyThemeData.goldColor
                      : MyThemeData.whiteColor),
              onPressed: () {
                widget.player.pause();
              },
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.06),
            IconButton(
              icon: Icon(Icons.skip_next,size: 40,
                  color: provider.currentTheme == ThemeMode.light
                      ? MyThemeData.goldColor
                      : MyThemeData.whiteColor),
              onPressed: () {
                widget.next();
              },
            ),
          ],
        ),
        Text(widget.radioChannels.name ?? '', style: TextStyle(color: provider.currentTheme == ThemeMode.light
            ? MyThemeData.goldColor
            : MyThemeData.whiteColor),)
      ],
    );
  }
}