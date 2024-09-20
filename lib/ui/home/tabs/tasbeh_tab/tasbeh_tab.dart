import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/settings_provider/settings_provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  List<String> tsbeh = [
    'سبحان الله',
    'الحمدلله',
    'الله اكبر',
    'لا اله الا الله',
    'سبحان الله وبحمده سبحان الله العظيم',
    'استغفر الله العظيم'
  ];
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(provider.currentTheme == ThemeMode.light
                    ? 'assets/images/head_sebha_logo.png'
                    : 'assets/images/head_sebha_dark.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 75),
                  child: Transform.rotate(
                    angle: angle,
                    child: GestureDetector(
                        onTap: () {
                          onTap();
                        },
                        child: Image.asset(
                            provider.currentTheme == ThemeMode.light
                                ? 'assets/images/body_sebha_logo.png'
                                : 'assets/images/body_sebha_dark.png')),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "عدد التسبيحات",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  '${tsbeh[index]}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
      counter++;
      counter = 0;
    }
    if (index == tsbeh.length) {
      index = 0;
    }
    setState(() {
      angle += 360 / 4;
    });
  }
}
