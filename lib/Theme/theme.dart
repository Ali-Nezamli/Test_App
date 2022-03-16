import 'package:flutter/material.dart';

class Apptheme {
  static Color primaryColor = Colors.blue;
  static Color secondaryColor = Colors.black;
  static Color scaffoldBackGroundColor = Colors.white;
  static Color hintColor = Colors.grey;

  static ThemeData themeData = ThemeData.light().copyWith(
    scaffoldBackgroundColor: scaffoldBackGroundColor,
    primaryColor: primaryColor,
    hintColor: hintColor,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      button: TextStyle(fontSize: 16.5, color: Colors.white),
      bodyText2: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    ).apply(),
  );
}
