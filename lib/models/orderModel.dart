import 'package:flutter/cupertino.dart';

class OrderModel with ChangeNotifier {
  // format model dummy for testing
  // List orderValue = [
  //   {
  //     "id": 2,
  //     "menu_name": "Sirloin",
  //     "menu_img": "https://i.ibb.co/89p5fdR/abuba-Sirloin.jpg",
  //     "qty": 1,
  //     "option": "Wagyu MB 6-7",
  //     "price": 225000,
  //     "qty_price": 225000
  //   },
  //   {
  //     "id": 3,
  //     "menu_name": "Rib Eye",
  //     "menu_img": "https://i.ibb.co/6wDPLM3/abuba-Rib-Eye.jpg",
  //     "qty": 1,
  //     "option": "United State rib eye",
  //     "price": 135000,
  //     "qty_price": 135000
  //   },
  //   {
  //     "id": 13,
  //     "menu_name": "Spaghetty Bolognese",
  //     "menu_img": "https://i.ibb.co/syJRyYL/abuba-Spaghetti-Bolognese.png",
  //     "qty": 1,
  //     "option": "",
  //     "price": 51000,
  //     "qty_price": 51000
  //   },
  // ];

  List orderValue = [];

  int get countItem => orderValue.length;

  num get totalPrice =>
      orderValue.fold(0, (total, current) => total + current["price"]);

  void addOrder(value) {
    print(value);
    var index =
        orderValue.indexWhere((element) => element["id"] == value["id"]);
    var checkId = orderValue.where((element) => element["id"] == value["id"]);
    var checkOption =
        orderValue.where((element) => element["option"] == value["option"]);

    if (checkId.isEmpty) {
      orderValue.add(value);
    } else {
      if (checkOption.isEmpty) {
        orderValue.add(value);
      } else {
        var qty = value["qty"] + value["qty"];

        orderValue[index]["qty"] = qty;
        orderValue[index]["qty_price"] = value["price"] * qty;
      }
    }

    notifyListeners();
  }

  void incrementItem(id) {
    var index = orderValue.indexWhere((element) => element["id"] == id);
    var qty = 1;

    orderValue[index]["qty"] = orderValue[index]["qty"] + qty;
    orderValue[index]["qty_price"] =
        orderValue[index]["price"] * orderValue[index]["qty"];

    notifyListeners();
  }

  void decrementItem(id) {
    var index = orderValue.indexWhere((element) => element["id"] == id);
    var qty = 1;

    if (orderValue[index]["qty"] <= 1) {
      orderValue[index]["qty"] = 1;
    } else {
      orderValue[index]["qty"] = orderValue[index]["qty"] - qty;
      orderValue[index]["qty_price"] =
          orderValue[index]["qty_price"] - orderValue[index]["price"];
    }

    notifyListeners();
  }

  void removeOrder(id) {
    // print(id);
    orderValue.removeWhere((element) => element["id"] == id);
    notifyListeners();
  }

  void removeAllOrder() {
    orderValue.clear();
    notifyListeners();
  }
}
