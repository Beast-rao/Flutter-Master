import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_master/App%20data/products.dart';
import 'package:flutter_master/screens/drawer.dart';
// import 'package:flutter_master/untils/allitems.dart';

import '../untils/griditems.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // we are mapping data from json file below
  @override
  void initState() {
    super.initState();
    localData();
  }

  localData() async {
    await Future.delayed(Duration(seconds: 4));
    var Jsonfile = await rootBundle.loadString("assets/jsonfiles/catalog.json");
    final decodefile = jsonDecode(Jsonfile);
    var decodedata = decodefile["products"];
    ProductsModel.goods =
        List.from(decodedata).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummydata = List.generate(100, (index) => ProductsModel.goods[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Practice App"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (ProductsModel.goods.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,mainAxisSpacing: 16 ,
                crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  return GriItems(item:ProductsModel.goods[index] );
                },
                itemCount: ProductsModel.goods.length,
              )
            //to show circualar wait
            : Center(
                child: CircularProgressIndicator(
                    color: Colors.blueAccent, backgroundColor: Colors.black26),
              ),
      ),
    );
  }
}
