import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData customTheme = ThemeData.light();
  toggleTheme(Color color) {
    customTheme = ThemeData.light().copyWith(primaryColor: color);
    notifyListeners();
  }
}
