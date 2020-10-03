import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/provider/theme_provider.dart';
import 'package:weather_app/domain/provider/weather_proviider.dart';
import 'package:weather_app/presentation/pages/home_page.dart';
import 'package:weather_app/presentation/pages/search_page.dart';
//
//void main() {
//  runApp(ChangeNotifierProvider<ThemeProvider>(
//    create: (context) => ThemeProvider(),
//    child: WeatherApp(),
//  ));
//}

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<WeatherProvider>(
      create: (context) => WeatherProvider(),
    ),
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
    ),
  ], child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).customTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        SearchPage.id: (context) => SearchPage(),
      },
    );
  }
}
