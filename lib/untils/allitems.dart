import 'package:flutter/material.dart';
import 'package:flutter_master/App%20data/products.dart';

class AllItems extends StatelessWidget {
  final Item item;

  const AllItems({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Card(
        child: ListView(
          children: [
            ListTile(
              leading: Container(
                  width: 70, height: 200, child: Image.network(item.image)),
              title: Text(item.name),
              subtitle: Text(item.desc),
              trailing: Text("\$${item.price}",
                  textScaleFactor: 1.3,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
