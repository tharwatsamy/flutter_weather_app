import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/models/weather_model.dart';
import 'package:weather_app/domain/provider/theme_provider.dart';
import 'package:weather_app/domain/provider/weather_proviider.dart';
import 'package:weather_app/domain/repos/weather_repo.dart';
import 'package:weather_app/presentation/pages/home_page.dart';

class SearchPage extends StatelessWidget {
  static String id = 'SearchPage';
  final Function toggleTheme;
  SearchPage({this.toggleTheme});
  String searchedCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
              suffix: IconButton(
                  onPressed: () async {
                    WeatherRepo weatherRepo = WeatherRepo();
                    Weather weather =
                        await weatherRepo.geteWather(searchedCity);
                    var weatherProvider =
                        Provider.of<WeatherProvider>(context, listen: false);
                    weatherProvider.changeWeather(weather);
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme(weather.getThemeColor());
                    Navigator.pop(context);
                    print('success');
                  },
                  icon: Icon(
                    Icons.search,
                  )),
              labelText: 'Search',
              border: OutlineInputBorder(),
              hintText: 'Enter City Name',
            ),
            onChanged: (value) {
              searchedCity = value;
            },
          ),
        ),
      ),
    );
  }
}
