import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lTheme(BuildContext context)  =>
    ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily:GoogleFonts.lato().fontFamily,
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0.0,
    color: Colors.white,
    ),);
  static ThemeData DTheme(BuildContext context)  =>
      ThemeData(brightness: Brightness.light);
  }
