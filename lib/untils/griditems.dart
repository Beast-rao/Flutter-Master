import 'package:flutter/material.dart';
import 'package:flutter_master/App%20data/products.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class GriItems extends StatelessWidget {
  final Item item;

  const GriItems({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: GridTile(
          header: Container(
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blueAccent,
              // borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
              item.name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          child: Image.network(item.image),
          // CachedNetworkImage(
          //   imageUrl: item.Image,
          //   placeholder: (context, url) => CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          // ),
          footer: Container(
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blueAccent,
              // borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
              "\$" + item.price.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
