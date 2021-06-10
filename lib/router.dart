import 'package:abuba_steak_app/router_const.dart';
import 'package:flutter/material.dart';
import 'package:abuba_steak_app/screens/MainScreen.dart';

Route<dynamic> routeApp(RouteSettings settings) {
  switch (settings.name) {
    case MainView:
      return MaterialPageRoute(builder: (_) => MainScreen());

    default:
      return MaterialPageRoute(builder: (_) => MainScreen());
  }
}
