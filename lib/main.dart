import 'package:abuba_steak_app/models/counterModel.dart';
import 'package:abuba_steak_app/models/menuModel.dart';
import 'package:abuba_steak_app/models/orderModel.dart';
import 'package:flutter/material.dart';
import 'package:abuba_steak_app/router_const.dart';
import 'package:provider/provider.dart';

import 'router.dart' as router;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => MenuModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abuba Steak',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.routeApp,
      initialRoute: MainView,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: PlaygroundScreen(),
    );
  }
}
