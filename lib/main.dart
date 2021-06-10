import 'package:flutter/material.dart';
import 'package:abuba_steak_app/router_const.dart';

import 'router.dart' as router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abuba Steak',
      onGenerateRoute: router.routeApp,
      initialRoute: MainView,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: MainScreen(),
    );
  }
}
