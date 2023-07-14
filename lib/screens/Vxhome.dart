import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_master/App%20data/cart.dart';
import 'dart:convert';
import 'package:flutter_master/App%20data/products.dart';
import 'package:flutter_master/store%20management/store.dart';
import 'package:flutter_master/untils/routes.dart';
import 'package:flutter_master/untils/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../App data/HomeScreenData/catalog_header.dart';
import '../App data/HomeScreenData/catalog_list.dart';
// import 'package:http/http.dart'as http;

// import 'package:flutter_master/screens/drawer.dart';
// import 'package:flutter_master/untils/allitems.dart';

// import '../untils/griditems.dart';


class VxHomePage extends StatefulWidget {
  @override
  State<VxHomePage> createState() => _VxHomePageState();
}

class _VxHomePageState extends State<VxHomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  // we are mapping data from json file below
  @override
  void initState() {
    super.initState();
    localData();
  }

  localData() async {
    await Future.delayed(Duration(seconds: 1));
    var Jsonfile = await rootBundle.loadString("assets/jsonfiles/catalog.json");
    //from http data json file
    // final response = await http.get(Uri.parse(url));
    // final  Jsonfile= response.body;
    final decodefile = jsonDecode(Jsonfile);
    var decodedata = decodefile["products"];
    ProductsModel.goods =
        List.from(decodedata).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummydata = List.generate(100, (index) => ProductsModel.goods[0]);
    final _cart = (VxState.store as MyStore).cart;
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyTheme.creamcolor,
          floatingActionButton: VxBuilder(
            mutations: {AddMutation, RemoveMutation},
            builder: (ctx, _, __) => FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutees.cartroute);
                    },
                    backgroundColor: MyTheme.darkbluesh,
                    child: Icon(
                      CupertinoIcons.cart,
                      color: Colors.white,
                    ))
                .badge(
                    size: 20,
                    color: Vx.red500,
                    count: _cart.items.length,
                    textStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          body: SafeArea(
            child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader().pOnly(bottom: 25),
                  if (ProductsModel.goods.isNotEmpty)
                    CatalogList().expand()
                  else
                    CircularProgressIndicator().centered().expand(),
                ],
              ),
            ),
          )),
    );
  }
}

// class CatalogImage extends StatelessWidget {
//   final String image;
//
//   const CatalogImage({required this.image});
//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       image,
//     ).box.rounded.p8.color(MyTheme.creamcolor).make().p16().w40(context);
//   }
// }
