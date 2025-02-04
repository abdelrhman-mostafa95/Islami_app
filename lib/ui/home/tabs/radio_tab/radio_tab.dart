import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/api/api_services.dart';
import 'package:islami_app/api/model/Radios.dart';
import 'package:islami_app/provider/settings_provider/settings_provider.dart';
import 'package:islami_app/ui/home/tabs/radio_tab/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../../api/model/RadiosModel.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio_image.png'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        Text(
          'اذاعة القران الكريم',
          style: provider.currentTheme == ThemeMode.light
              ? TextStyle(color: Colors.black, fontSize: 20)
              : TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: FutureBuilder(
            future: ApiServices.getRadio(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Something went wrong');
              } else {
                RadiosModel? radioModel = snapshot.data;
                List<Radios> radio = radioModel?.radios?? [] ;
                return PageView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: radio.length,
                  itemBuilder: (context, index) {
                    return RadioWidget(
                      player: player,
                      next: () {
                        player.pause();
                        controller.nextPage(duration: Duration(seconds: 1), curve: Curves.bounceIn);
                      },
                      previous: () {
                        player.pause();
                        controller.previousPage(duration: Duration(seconds: 1), curve: Curves.bounceIn);
                      },
                      radioChannels: radio[index],
                    );
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }
}