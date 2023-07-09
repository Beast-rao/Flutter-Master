import 'package:flutter/material.dart';
import 'package:flutter_master/screens/home.dart';
import 'package:flutter_master/screens/login.dart';
import 'package:flutter_master/untils/routes.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practice App',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily:GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(brightness: Brightness.light),
      initialRoute: MyRoutees.homeroute,
      routes: {
        "/":(context)=> LoginPage(),
        MyRoutees.homeroute:(context)=> HomePage(),
        MyRoutees.loginroute:(context)=> LoginPage(),



      },
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
