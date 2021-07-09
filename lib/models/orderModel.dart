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
    var index =
        orderValue.indexWhere((element) => element["id"] == value["id"]);
    var checkId = orderValue.where((element) => element["id"] == value["id"]);

    if (checkId.isEmpty) {
      orderValue.add(value);
    } else {
      print("id yg sama ada di index $index");

      // orderValue.remove(value);
    }

    notifyListeners();
  }

  void removeOrder(id) {
    print(id);
    orderValue.removeWhere((element) => element["id"] == id);
    notifyListeners();
  }

  void removeAllOrder() {
    orderValue.clear();
    notifyListeners();
  }
}
