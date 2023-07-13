import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../untils/theme.dart';
import '../cart.dart';
import '../products.dart';

class AddToCart extends StatelessWidget {
  final Item item;

  AddToCart({required this.item});

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(item);

    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = true;
            final _catalog = ProductsModel();
            _cart.cartlog = _catalog;
            _cart.add(item);
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
