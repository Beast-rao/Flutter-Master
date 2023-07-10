class ProductsModel {
  static final products = [
    Item(
        id: "Rao9001",
        name: "iPhone 12 pro",
        desc: "Apple iPhone 12th Generation",
        price: 1000,
        color: "#33505a",
        ImageUrl:
            "assets/images/rao.jpg"),
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
