import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../untils/theme.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkbluesh).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}