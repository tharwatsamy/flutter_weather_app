import 'package:flutter/cupertino.dart';
import 'package:weather_app/domain/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  Weather weather;

  changeWeather(Weather weatherData) {
    weather = weatherData;
    notifyListeners();
  }
}
