import 'package:abuba_steak_app/router_const.dart';
import 'package:abuba_steak_app/screens/CategoryScreen.dart';
import 'package:abuba_steak_app/screens/PlaygroundScreen.dart';
import 'package:abuba_steak_app/screens/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:abuba_steak_app/screens/MainScreen.dart';

Route<dynamic> routeApp(RouteSettings settings) {
  switch (settings.name) {
    case MainView:
      return MaterialPageRoute(builder: (_) => MainScreen());

    case SearchView:
      return MaterialPageRoute(builder: (_) => SearchScreen());

    case CategoryView:
      var dataCategory = settings.arguments;

      return MaterialPageRoute(
        builder: (context) => CategoryScreen(
          title: dataCategory.toString(),
        ),
      );

    case PlaygroundView:
      return MaterialPageRoute(builder: (_) => PlaygroundScreen());

    default:
      return MaterialPageRoute(builder: (_) => MainScreen());
  }
}
