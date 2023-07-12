import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lTheme(BuildContext context)  =>
    ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily:GoogleFonts.poppins().fontFamily,
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0.0,
    color: Colors.white,
    ),);
  static ThemeData DTheme(BuildContext context)  =>
      ThemeData(brightness: Brightness.light);
  static Color creamcolor=Color(0xfff5f5f5);
  static Color darkbluesh=Color(0xff403b58);
  }
