class ProductsModel {
  //Singolton class
  // static final productModel = ProductsModel._internal();
  // ProductsModel._internal();
  // factory ProductsModel() => productModel;

  static List<Item> goods = [];

  //Get by ID
  Item getById(int id) =>
      goods.firstWhere((element) => element.id == id, );

  //Gey by Position
  Item getByPos(int pos) => goods[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

//we are using below to map json file data
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"] as int? ?? 0,
      name: map["name"] as String? ?? "",
      desc: map["desc"] as String? ?? "",
      price: map["price"] as int? ?? 0,
      color: map["color"] as String? ?? "",
      image: map["image"] as String? ?? "",
    );
  }

//we ae using below to convert back mapping
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
