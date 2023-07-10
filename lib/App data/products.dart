class ProductsModel {
  static final products = [
    Item(
        id: "Rao9001",
        name: "iphone 12 pro",
        desc: "Apple iphone 12th Generation",
        price: 250000,
        color: "#33505a",
        ImageUrl:
            "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1024w2/gsmarena_012.jpg"),
  ];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String ImageUrl;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.ImageUrl});
}
