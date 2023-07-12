import 'package:flutter/material.dart';
import 'package:flutter_master/untils/theme.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: MyTheme.creamcolor,
    );
  }
}
