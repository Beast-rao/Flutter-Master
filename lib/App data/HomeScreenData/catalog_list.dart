import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../screens/home_details_page.dart';
import '../../untils/theme.dart';
import '../products.dart';
import 'addtocartbutton.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 30),
            shrinkWrap: true,
            itemCount: ProductsModel.goods.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeDetailsPage(
                                item: ProductsModel.goods[index])));
                  },
                  child: CatalogItem(item: ProductsModel.goods[index]));
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: ProductsModel.goods.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeDetailsPage(
                                item: ProductsModel.goods[index])));
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
    var children2 = [
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
                .wPCT(context:context, widthPCT: context.isMobile? 40:20),
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
                  AddToCart(item: item),
                ],
              ).pOnly(right: 8.0)
            ],
          ).p(context.isMobile? 0:20),)
        ];
    return VxBox(
      child:context.isMobile? Row(
        children: children2,
      ): Column(
        children: children2,
      ),
    ).white.rounded.square(150).make().py16();
  }
}
