import 'package:flutter/material.dart';
import 'package:flutter_master/App%20data/products.dart';

class AllItems extends StatelessWidget {
  final Item item;

  const AllItems({Key? key, required this.item})
      : assert(item != null, 'Item must not be null.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Card(
        child: ListView(
          children: [
            ListTile(
              leading: Image.asset(item.ImageUrl),
              title: Text(item.name),
              subtitle: Text(item.desc),
              trailing: Text("\$${item.price}",
                  textScaleFactor: 1.3,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
