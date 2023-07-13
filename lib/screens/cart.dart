import 'package:flutter/material.dart';
import 'package:flutter_master/App%20data/cart.dart';
import 'package:flutter_master/untils/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make().centered(),
      ),
      backgroundColor: MyTheme.creamcolor,
      body: Column(
        children: [CartItems().expand(), Divider(), CartButton()],
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        "\$${_cart.totalPrice}".text.xl5.color(MyTheme.darkbluesh).make(),
        20.widthBox,
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: "Buying is not Supported yet".text.make(),
              ),
            );
          },
          child: Text(
            "Buy",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
          ),
        ).w20(context).h8(context),
      ],
    );
  }
}

class CartItems extends StatelessWidget {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show here".text.xl4.make().centered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  _cart.remove(_cart.items[index]);
                  // setState(() {});
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
