import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.white,
      elevation: 0.0,
    ),
    primaryColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

// TextTheme textTheme() {
//   return TextTheme(
//     headline1:
//         GoogleFonts.nanumGothic(fontSize: 18.0, fontWeight: FontWeight.bold),
//     headline2:
//         GoogleFonts.nanumGothic(fontSize: 16.0, fontWeight: FontWeight.bold),
//     subtitle1: GoogleFonts.nanumGothic(fontSize: 16.0),
//     bodyText1: GoogleFonts.nanumGothic(fontSize: 15.0),
//     bodyText2: GoogleFonts.nanumGothic(fontSize: 14.0),
//   );
// }

TextTheme textTheme() {
  return const TextTheme(
    headline1:
    TextStyle(fontFamily:'Goyang', fontSize: 18.0, fontWeight: FontWeight.bold),
    headline2:
    TextStyle(fontFamily:'Gyang', fontSize: 18.0, fontWeight: FontWeight.bold),
    subtitle1: TextStyle(fontFamily:'Goyang', fontSize: 16.0),
    bodyText1: TextStyle(fontFamily:'Goyang', fontSize: 15.0),
    bodyText2: TextStyle(fontFamily:'Goyang', fontSize: 14.0),
  );
}
