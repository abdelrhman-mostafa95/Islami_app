import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/RadiosModel.dart';

class ApiServices {
  static Future<RadiosModel> getRadio() async {
    var url = Uri.https('mp3quran.net', 'api/v3/radios', {'language': 'eng'});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return RadiosModel.fromJson(json);
  }
}