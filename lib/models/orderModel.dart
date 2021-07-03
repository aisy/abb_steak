import 'package:flutter/cupertino.dart';

class OrderModel with ChangeNotifier {
  List orderValue = [];

  // List get orderList => orderValue.map((id) => null);

  int get countItem => orderValue.length;

  void addOrder(value) {
    orderValue.add(value);
    notifyListeners();
  }

  void removeOrder() {
    notifyListeners();
  }

  void removeAllOrder() {
    notifyListeners();
  }
}
