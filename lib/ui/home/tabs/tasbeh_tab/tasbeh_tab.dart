import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset('assets/images/head_sebha_logo.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 75),
                  child: Transform.rotate(
                    angle: angle,
                    child: GestureDetector(
                        onTap: () {
                          onTap();
                        },
                        child:
                            Image.asset('assets/images/body_sebha_logo.png')),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "عدد التسبيحات",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color(0xFFB7935F),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                '$counter',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0xFFB7935F),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  '${tsbeh[index]}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
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
