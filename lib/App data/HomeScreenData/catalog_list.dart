import 'package:flutter/material.dart';
import 'package:flutter_master/App%20data/cart.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../screens/home_details_page.dart';
import '../../untils/theme.dart';
import '../products.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductsModel.goods.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeDetailsPage(item: ProductsModel.goods[index])));
            },
            child: CatalogItem(item: ProductsModel.goods[index]));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item item;

  const CatalogItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: (item.id.toString()),
            child: Image.network(
              item.image,
            )
                .box
                .rounded
                .p8
                .color(MyTheme.creamcolor)
                .make()
                .p16()
                .w40(context),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.name.text.lg.color(MyTheme.darkbluesh).bold.make(),
              item.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${item.price}".text.bold.xl.make(),
                  _AddToCart(item: item),
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item item;

  const _AddToCart({ required this.item});

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
   bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () {
        final _catalog=ProductsModel();
        final _cart=CartModel();
        _cart.cartlog=_catalog;
        _cart.add(widget.item);
        setState(() {
          isAdded=true;
        });
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyTheme.darkbluesh,
          ),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isAdded ? Icon(Icons.done, color: Colors.white,) : "Add to Cart".text.white.make(),
    );
  }
}
