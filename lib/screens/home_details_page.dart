import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

import '../App data/products.dart';
import '../untils/theme.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item item;

  const HomeDetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${item.price}".text.bold.xl4.red500.make(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                MyTheme.darkbluesh,
              ),
              shape: MaterialStateProperty.all(
                const StadiumBorder(),
              ),
            ),
            child: "Add to Cart".text.lg.bold.white.make(),
          ).wh(150, 50)
        ],
      ).p(32),
      backgroundColor: MyTheme.creamcolor,
      body: SafeArea(
        maintainBottomViewPadding: false,
        child: Column(
          children: [
            Hero(
                tag: item.id.toString(),
                child: Image.network(
                  item.image,
                )).h32(context),
            Expanded(
              child: VxArc(
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                height: 24,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      item.name.text.xl4.color(MyTheme.darkbluesh).bold.make(),
                      item.desc.text.xl.textStyle(context.captionStyle).make(),
                      "They come in use for communicating through voice, messages, and mails. We can also surf the internet using a phone. Most importantly, we also click photos and record videos through our mobile's camera."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                    ],
                  ).py32(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
