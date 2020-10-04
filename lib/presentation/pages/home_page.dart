import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/provider/weather_proviider.dart';
import 'package:weather_app/presentation/pages/search_page.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    var weatherProvider = Provider.of<WeatherProvider>(context, listen: true);
    var weather = weatherProvider.weather;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
          )
        ],
      ),
      body: (weather == null)
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    weather.getMaterialColor()[700],
                    weather.getMaterialColor()[500],
                    weather.getMaterialColor()[300],
                  ])),
              child: Container(
                width: double.infinity,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Text(
                          weather.cityName,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        Text(
                          'Updated: ${TimeOfDay.fromDateTime(weather.createdTime).format(context)}',
                          style: TextStyle(fontSize: 15, letterSpacing: .7),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 40,
                          backgroundImage: AssetImage(weather.getImage()),
                        ),
                        Text(
                          weather.theTemp.floor().toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                        Column(
                          children: [
                            Text('max: ${weather.maxTemp.floor().toString()}'),
                            Text('min: ${weather.minTemp.floor().toString()}'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Text(
                        weather.weatherStateName,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
