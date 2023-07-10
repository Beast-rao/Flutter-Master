import 'package:flutter/material.dart';
import 'package:flutter_master/screens/home.dart';
import 'package:flutter_master/screens/login.dart';
import 'package:flutter_master/untils/routes.dart';
import 'package:flutter_master/untils/theme.dart';



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
      theme: MyTheme.lTheme(context),
      darkTheme: MyTheme.DTheme(context),
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
