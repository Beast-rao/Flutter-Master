import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/store%20management/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../untils/theme.dart';
import '../cart.dart';
import '../products.dart';

class AddToCart extends StatelessWidget {
  final Item item;

  AddToCart({required this.item});


  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on:[AddMutation, RemoveMutation]);
    final CartModel _cart=(VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(item);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(item);
            // setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              MyTheme.darkbluesh,
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            )),
        child: isInCart
            ? Icon(
                Icons.done,
                color: Colors.white,
              )
            : Icon(
                CupertinoIcons.cart_badge_plus,
                color: Colors.white,
              ));
  }
}
