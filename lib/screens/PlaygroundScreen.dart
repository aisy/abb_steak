import 'package:abuba_steak_app/widgets/common/OptionPriceWidget.dart';
import 'package:flutter/material.dart';

class PlaygroundScreen extends StatefulWidget {
  PlaygroundScreen({Key? key}) : super(key: key);

  @override
  _PlaygroundScreenState createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  List dataOption = [
    {'name': "Regular", "value": "18000"},
    {'name': "Spicy", "value": "20000"},
    {'name': "Manis", "value": "19000"},
    {'name': "Mayo", "value": "18000"},
  ];

  String priceValue = "";

  @override
  void initState() {
    super.initState();
    priceValue = dataOption[0]["value"];
  }

  void updatePriceValue(String newValue) {
    setState(() {
      priceValue = newValue;
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
            realValue: (String newValue) {
              updatePriceValue(newValue);
            },
          ),
          SizedBox(
            height: 30,
          ),
          Text(priceValue)
        ],
      )),
    );
  }
}
