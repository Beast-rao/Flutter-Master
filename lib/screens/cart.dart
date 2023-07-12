import 'package:flutter/material.dart';
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
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        "\$999".text.xl5.color(MyTheme.darkbluesh).make(),
        20.widthBox,
        ElevatedButton(
          onPressed: () {

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: "Buying is not Supported yet".text.make(),
              ),
            );
          },
          child: Text("Buy",style: TextStyle(color: Colors.white,fontSize: 20),),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
          ),
        ).w20(context).h8(context),
      ],
    );
  }
}

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
          },
        ),
        title: "Item".text.make(),
      ),
    );
  }
}


