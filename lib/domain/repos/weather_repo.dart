import 'package:weather_app/data/weather_service.dart';
import 'package:weather_app/domain/models/weather_model.dart';

class WeatherRepo {
  Future<Weather> geteWather(cityName) async {
    final weatherService = WeatherService();
    var weather = await weatherService.getWetaher(cityName);
    return weather;
  }
}
