import 'package:flutter/cupertino.dart';

class OrderModel with ChangeNotifier {
  // format model
  // [
  //   {
  //     'id':5,
  //     'menu_name':"Chicken Steak",
  //     'menu_img':"http://img",
  //     'qty':2,
  //     'option': "normal",
  //     'price':20000
  //   }
  // ]

  List orderValue = [];

  // List get orderList => orderValue.map((id) => null);

  int get countItem => orderValue.length;

  num get totalPrice =>
      orderValue.fold(0, (total, current) => total + current["price"]);

  void addOrder(value) {
    orderValue.add(value);
    notifyListeners();
  }

  void removeOrder(id) {
    notifyListeners();
  }

  void removeAllOrder() {
    orderValue.clear();
    notifyListeners();
  }
}
