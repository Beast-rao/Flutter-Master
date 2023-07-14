import 'package:flutter_master/App%20data/products.dart';
import 'package:flutter_master/store%20management/store.dart';
import 'package:velocity_x/velocity_x.dart';



class CartModel {
  late ProductsModel _cartlog;
  final Map<int, int> _itemQuantities = {};

  ProductsModel get cartlog => _cartlog;
  set cartlog(ProductsModel newCartlog) {
    _cartlog = newCartlog;
  }

  List<int> get itemIds => _itemQuantities.keys.toList();

  List<Item> get items =>
      itemIds.map((id) => _cartlog.getById(id)).toList();

  int getItemQuantity(Item item) => _itemQuantities[item.id] ?? 0;

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price * getItemQuantity(current));

  void addItem(Item item) {
    if (_itemQuantities.containsKey(item.id)) {
      _itemQuantities[item.id] = getItemQuantity(item) + 1;
    } else {
      _itemQuantities[item.id] = 1;
    }
  }

  void removeItem(Item item) {
    final quantity = getItemQuantity(item);
    if (quantity > 1) {
      _itemQuantities[item.id] = quantity - 1;
    } else {
      _itemQuantities.remove(item.id);
    }
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart.addItem(item);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart.removeItem(item);
  }
}



// class CartModel {
//   //singolton class
//   // static final cartModel = CartModel._internal();
//   //
//   // CartModel._internal();
//   //
//   // factory CartModel() => cartModel;
//
//   late ProductsModel _cartlog;
// //collection of IDs store of each item
//   final List<int> _itemIds = [];
// //get cartlog
//   ProductsModel get cartlog => _cartlog;
//   set cartlog(ProductsModel newCartlog) {
//     _cartlog = newCartlog;
//   }
//
//   //To get items in cart
//   List<Item> get items => _itemIds.map((id) => _cartlog.getById(id)).toList();
//
// //get total price
//   num get totalPrice =>
//       items.fold(0, (total, current) => total + current.price);
//   num get totalcount =>
//       items.fold(0, (total, current) => total + current.id);
//
//   // //add item
//   // void add(Item item) {
//   //   _itemIds.add(item.id);
//   // }
//
//   // // To  remove items
//   // void remove(Item item) {
//   //   _itemIds.remove(item.id);
//   // }
// }
// class AddMutation extends VxMutation<MyStore>{
//   final Item item;
//   AddMutation(this.item);
//   @override
//   perform() {
//     store?.cart._itemIds.add(item.id);
//   }
//
// }
// class RemoveMutation extends VxMutation<MyStore>{
//   final Item item;
//   RemoveMutation(this.item);
//   @override
//   perform() {
//     store?.cart._itemIds.remove(item.id);
//   }
//
// }