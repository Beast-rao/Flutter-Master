import 'package:flutter/material.dart';
import 'package:flutter_master/App%20data/products.dart';
import 'package:flutter_master/screens/drawer.dart';
import 'package:flutter_master/untils/allitems.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Practice App"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: ProductsModel.products.length,
        itemBuilder: (context, index) {
          return AllItems(
            item: ProductsModel.products[index],
          );
        },
      ),
    );
  }
}
