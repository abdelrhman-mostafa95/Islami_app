import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/provider/settings_provider/settings_provider.dart';
import 'package:islami_app/style/theme_data.dart';
import 'package:provider/provider.dart';

class ThemeBottom extends StatefulWidget {
  @override
  State<ThemeBottom> createState() => _ThemeBottomState();
}

class _ThemeBottomState extends State<ThemeBottom> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
                provider.changeThemeMode(ThemeMode.light);
              },
              child: provider.currentTheme == ThemeMode.light
                  ? buildSelectedThemeItem(AppLocalizations.of(context)!.light)
                  : buildUnSelectedThemeItem(
                      AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                Navigator.pop(context);
                provider.changeThemeMode(ThemeMode.dark);
              },
              child: provider.currentTheme == ThemeMode.dark
                  ? buildSelectedThemeItem(AppLocalizations.of(context)!.dark)
                  : buildUnSelectedThemeItem(
                      AppLocalizations.of(context)!.dark))
        ],
      ),
    );
  }

  Widget buildSelectedThemeItem(String selectedTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(selectedTheme,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Theme.of(context).colorScheme.primary)),
        Icon(
          Icons.check,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        )
      ],
    );
  }

  Widget buildUnSelectedThemeItem(String unselectedTheme) {
    return Text(unselectedTheme, style: Theme.of(context).textTheme.labelSmall);
  }
}
