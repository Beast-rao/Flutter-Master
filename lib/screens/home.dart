import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_master/App%20data/products.dart';
import 'package:flutter_master/screens/drawer.dart';
import 'package:flutter_master/untils/allitems.dart';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    localData();
  }

  localData()async {
   var Jsonfile =await rootBundle.loadString("assets/jsonfiles/catalog.json");
   var decodefile= jsonDecode(Jsonfile);
   print(decodefile);
  }

  @override
  Widget build(BuildContext context) {
    final dummydata = List.generate(100, (index) => ProductsModel.products[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Practice App"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: dummydata.length,
        itemBuilder: (context, index) {
          return AllItems(
            item: dummydata[index],
          );
        },
      ),
    );
  }
}
