import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practice App"),
        centerTitle: true,
      ),
      drawer:Drawer(

      ),
      body: Center(child: Text("Welcome to My Practice App")),
    );
  }
}
