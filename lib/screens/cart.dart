import 'package:flutter/material.dart';
import 'package:flutter_master/App%20data/cart.dart';
import 'package:flutter_master/store%20management/store.dart';
import 'package:flutter_master/untils/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make().centered(),
        ),
        backgroundColor: MyTheme.creamcolor,
        body: Column(
          children: [
            CartItems().expand(),
            Divider(),
            CartButton(),
          ],
        ),
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        VxConsumer(
          mutations: {RemoveMutation, AddMutation},
          builder: (context, _, __) {
            return "\$${_cart.totalPrice}"
                .text
                .xl5
                .color(MyTheme.darkbluesh)
                .make();
          },
        ),
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
            backgroundColor: MaterialStateProperty.all(MyTheme.darkbluesh),
          ),
        ).w20(context).h8(context),
      ],
    );
  }
}

class CartItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return VxConsumer(
      mutations: {AddMutation, RemoveMutation},
      builder: (context, _, __) {
        return _cart.items.isEmpty
            ? "Nothing to show here".text.xl4.make().centered()
            : ListView.builder(
                itemCount: _cart.items.length,
                itemBuilder: (context, index) {
                  final item = _cart.items[index];
                  final itemQuantity =
                      _cart.getItemQuantity(item); // Get item quantity

                  return ListTile(
                    leading: Icon(Icons.done),
                    trailing: Container(
                      width: 100, // Adjust the width as needed
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () => RemoveMutation(item),
                          ),
                          Text(
                            itemQuantity.toString(), // Display item quantity
                          ),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () => AddMutation(item),
                          ),
                        ],
                      ),
                    ),
                    title: item.name.text.make(),
                  );
                },
              );
      },
    );
  }
}
