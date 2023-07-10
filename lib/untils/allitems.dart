import 'package:flutter/material.dart';
import 'package:flutter_master/App%20data/products.dart';
class AllItems extends StatelessWidget {
  final Item item;

  const AllItems({Key? key, required this.item})
      : assert(item != null, 'Item must not be null.');

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          // leading: Image.network(item.imageUrl),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(item.price.toString()),
        ),
      ],
    );
  }
}
