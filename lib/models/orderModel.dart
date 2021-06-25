import 'package:flutter/cupertino.dart';

class OrderModel with ChangeNotifier {
  List orderValue = [];

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
