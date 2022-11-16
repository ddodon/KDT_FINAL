import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.white,
      elevation: 0.0,
    ),
    primaryColor: Colors.white,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    visualDensity: VisualDensity.adaptivePlatformDensity
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1:
    TextStyle(fontFamily:'Nanum', fontSize: 18.0, fontWeight: FontWeight.bold),
    headline2:
    TextStyle(fontFamily:'Nanum', fontSize: 18.0, fontWeight: FontWeight.bold),
    subtitle1: TextStyle(fontFamily:'Nanum', fontSize: 16.0),
    bodyText1: TextStyle(fontFamily:'Nanum', fontSize: 15.0),
    bodyText2: TextStyle(fontFamily:'Nanum', fontSize: 14.0),
  );
}
