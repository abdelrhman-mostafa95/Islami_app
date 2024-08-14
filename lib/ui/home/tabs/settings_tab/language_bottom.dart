import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../provider/settings_provider/settings_provider.dart';
import '../../../../style/theme_data.dart';

class LanguageBottom extends StatefulWidget {
  @override
  State<LanguageBottom> createState() => _LanguageBottomState();
}

class _LanguageBottomState extends State<LanguageBottom> {
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
                provider.changeAppLanguage('ar');
              },
              child: provider.currentLanguage == 'ar'
                  ? buildSelectedThemeItem(AppLocalizations.of(context)!.arabic)
                  : buildUnSelectedThemeItem(
                      AppLocalizations.of(context)!.arabic)),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                provider.changeAppLanguage('en');
              },
              child: provider.currentLanguage == 'en'
                  ? buildSelectedThemeItem(
                      AppLocalizations.of(context)!.english)
                  : buildUnSelectedThemeItem(
                      AppLocalizations.of(context)!.english))
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
