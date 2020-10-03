import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/domain/models/weather_model.dart';

class WeatherService {
  Future<int> getCityId(String cityName) async {
    try {
      var responise = await http.get(
          'https://www.metaweather.com/api/location/search/?query=$cityName');
      if (responise.statusCode == 200) {
        print(responise.body);
        var jsonData = jsonDecode(responise.body)[0];
        int id = jsonData['woeid'];
        return id;
      } else {
        print(responise.statusCode);
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<Weather> getWetaher(String cityName) async {
    int id = await getCityId(cityName);
    var responise =
        await http.get('https://www.metaweather.com/api/location/$id/');
    if (responise.statusCode == 200) {
      var jsonData = jsonDecode(responise.body);
      var datathatINeed = jsonData['consolidated_weather'][0];
      Weather weather = Weather(
          minTemp: datathatINeed['min_temp'],
          maxTemp: datathatINeed['max_temp'],
          theTemp: datathatINeed['the_temp'],
          weatherStateName: datathatINeed['weather_state_name'],
          cityName: jsonData['title'],
          createdTime: DateTime.now());

      return weather;
    } else {
      print(responise.statusCode);
    }
  }
}
