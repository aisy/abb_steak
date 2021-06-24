import 'package:abuba_steak_app/context/counterContext.dart';
import 'package:flutter/material.dart';
import 'package:abuba_steak_app/router_const.dart';
import 'package:provider/provider.dart';

import 'router.dart' as router;

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CounterContext())],
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
      onGenerateRoute: router.routeApp,
      initialRoute: PlaygroundView,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: PlaygroundScreen(),
    );
  }
}
