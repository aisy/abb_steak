import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CounterModel with ChangeNotifier {
  int count = 0;

  void increment() {
    count += 1;
    notifyListeners();
  }
}
