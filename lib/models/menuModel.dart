import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

class MenuModel with ChangeNotifier {
  List menuValue = [];

  Future<void> getMenu() async {
    var getJson = await rootBundle.loadString("asssets/data/menu.json");
    var result = await json.decode(getJson);

    menuValue.add(result);

    notifyListeners();
  }

  void findMenuName(name) {
    var checkName = menuValue.where((element) => element["menu_name"] == name);
  }
}
