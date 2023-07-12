import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_master/App%20data/products.dart';
import 'package:flutter_master/untils/routes.dart';
import 'package:flutter_master/untils/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../App data/HomeScreenData/catalog_header.dart';
import '../App data/HomeScreenData/catalog_list.dart';

// import 'package:flutter_master/screens/drawer.dart';
// import 'package:flutter_master/untils/allitems.dart';

// import '../untils/griditems.dart';

class VxHomePage extends StatefulWidget {
  @override
  State<VxHomePage> createState() => _VxHomePageState();
}

class _VxHomePageState extends State<VxHomePage> {
  // we are mapping data from json file below
  @override
  void initState() {
    super.initState();
    localData();
  }

  localData() async {
    await Future.delayed(Duration(seconds: 1));
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
        backgroundColor: MyTheme.creamcolor,
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, MyRoutees.cartroute);
          },
            backgroundColor: MyTheme.darkbluesh,
          child: Icon(CupertinoIcons.cart,color: Colors.white,)
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
                     CircularProgressIndicator().expand().centered(),

              ],
            ),
          ),
        ));
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
