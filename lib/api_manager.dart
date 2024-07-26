import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islamic_app/models/radio_model/radio.dart';

import 'models/radio_model/radio_model.dart';


class ApiManager {
  static Future<List<Radios>> getRadioData({String language = 'ar'}) async {
    try {
      Uri uri =
          Uri.parse("https://mp3quran.net/api/v3/radios?language=$language");
      var response = await http.get(uri);
      var json = jsonDecode(response.body);
      RadioModel model = RadioModel.fromJson(json);
      return model.radios ?? [];
    } catch (e) {
      throw e;
    }
  }
}
