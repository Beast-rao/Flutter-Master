import 'package:flutter/material.dart';
import 'package:flutter_master/screens/drawer.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Practice App"),
        centerTitle: true,
      ),
      drawer:MyDrawer(),
      body: Center(child: Text("Welcome to My Practice App")),
    );
  }
}
