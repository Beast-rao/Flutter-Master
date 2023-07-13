import 'package:flutter_master/App%20data/products.dart';
import 'package:flutter_master/store%20management/store.dart';
import 'package:velocity_x/velocity_x.dart';


class CartModel {
  //singolton class
  // static final cartModel = CartModel._internal();
  //
  // CartModel._internal();
  //
  // factory CartModel() => cartModel;

  late ProductsModel _cartlog;
//collection of IDs store of each item
  final List<int> _itemIds = [];
//get cartlog
  ProductsModel get cartlog => _cartlog;
  set cartlog(ProductsModel newCartlog) {
    _cartlog = newCartlog;
  }

  //To get items in cart
  List<Item> get items => _itemIds.map((id) => _cartlog.getById(id)).toList();

//get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // //add item
  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  // // To  remove items
  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}
class AddMutation extends VxMutation<MyStore>{
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }

}
class RemoveMutation extends VxMutation<MyStore>{
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }

}