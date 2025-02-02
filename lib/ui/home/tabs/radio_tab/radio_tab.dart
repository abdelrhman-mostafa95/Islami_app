import 'package:flutter/material.dart';
import 'package:islami_app/api/api_services.dart';
import 'package:islami_app/api/model/Radios.dart';
import 'package:islami_app/provider/settings_provider/settings_provider.dart';
import 'package:islami_app/ui/home/tabs/radio_tab/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../../api/model/RadiosModel.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          height: MediaQuery.of(context).size.height * 0.1,
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
                  scrollDirection: Axis.horizontal,
                  itemCount: radio.length,
                  itemBuilder: (context, index) {
                    return RadioWidget(
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