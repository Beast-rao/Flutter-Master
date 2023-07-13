import 'package:flutter_master/App%20data/cart.dart';
import 'package:flutter_master/App%20data/products.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{


  late ProductsModel catalog;
  late CartModel cart;

  MyStore(){
    catalog=ProductsModel();
    cart=CartModel();
    cart.cartlog=catalog;

  }


}