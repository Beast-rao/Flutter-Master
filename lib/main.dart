
import 'package:flutter/material.dart';
import 'package:flutter_master/screens/Vxhome.dart';
import 'package:flutter_master/screens/cart.dart';
import 'package:flutter_master/screens/login.dart';
import 'package:flutter_master/store%20management/store.dart';
import 'package:flutter_master/untils/routes.dart';
import 'package:flutter_master/untils/theme.dart';
import 'package:velocity_x/velocity_x.dart';


void main() {
  runApp(VxState(child:MyApp(),store: MyStore(),));
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
      darkTheme: MyTheme.dTheme(context),
      initialRoute: MyRoutees.homeroute,
      routes: {
        "/":(context)=> VxHomePage(),
        MyRoutees.homeroute:(context)=> VxHomePage(),
        MyRoutees.loginroute:(context)=> LoginPage(),
        MyRoutees.cartroute:(context)=> CartPage(),




      },
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
