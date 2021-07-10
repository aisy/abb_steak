import 'package:flutter/cupertino.dart';

class OrderModel with ChangeNotifier {
  // format model dummy for testing
  List orderValue = [
    {
      "id": 1,
      "menu_name": "Wagyu Sirloin",
      "menu_img":
          "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png",
      "qty": 1,
      "option": "MB 6-7",
      "price": 225000
    },
    {
      "id": 2,
      "menu_name": "Wagyu Rib Eye",
      "menu_img":
          "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png",
      "qty": 1,
      "option": "MB 6-7",
      "price": 235000
    },
    {
      "id": 14,
      "menu_name": "Spaghetty Bolognese",
      "menu_img":
          "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png",
      "qty": 1,
      "option": "",
      "price": 51000
    },
  ];

  // List orderValue = [];

  int get countItem => orderValue.length;

  num get totalPrice =>
      orderValue.fold(0, (total, current) => total + current["price"]);

  void addOrder(value) {
    // print(value);
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
    // print(id);
    orderValue.removeWhere((element) => element["id"] == id);
    notifyListeners();
  }

  void removeAllOrder() {
    orderValue.clear();
    notifyListeners();
  }
}
