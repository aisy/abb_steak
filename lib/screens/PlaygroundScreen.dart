import 'package:abuba_steak_app/widgets/common/OptionPriceWidget.dart';
import 'package:flutter/material.dart';

class PlaygroundScreen extends StatefulWidget {
  PlaygroundScreen({Key? key}) : super(key: key);

  @override
  _PlaygroundScreenState createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  List dataOption = [
    {'name': "Regular", "value": 18000},
    {'name': "Spicy", "value": 20000},
    {'name': "Manis", "value": 19000},
    {'name': "Mayo", "value": 18000},
  ];

  int priceValue = 0;
  String priceName = "";

  @override
  void initState() {
    super.initState();
    priceValue = dataOption[0]["value"];
  }

  void updatePriceValue(int newValue, String newName) {
    setState(() {
      priceValue = newValue;
      priceName = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          OptionPriceWidget(
            dataOption: dataOption,
            realValue: (int newValue, String data) {
              updatePriceValue(newValue, data);
            },
          ),
          SizedBox(
            height: 30,
          ),
          Text("$priceValue")
        ],
      )),
    );
  }
}
