import 'package:flutter/material.dart';

// set callback
typedef void ValueCallback(int value, String name);

class OptionPriceWidget extends StatefulWidget {
  final List dataOption;
  final ValueCallback realValue;

  OptionPriceWidget({
    Key? key,
    required this.dataOption,
    required this.realValue,
  }) : super(key: key);

  @override
  _OptionPriceWidgetState createState() => _OptionPriceWidgetState();
}

class _OptionPriceWidgetState extends State<OptionPriceWidget> {
  List lst = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    lst = widget.dataOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children: List.generate(lst.length, (index) {
          var name = lst[index]["name"];
          var valurPrice = lst[index]["value"];

          return customRadio(name, valurPrice, index);
        }),
      ),
    );
  }

  void changeIndex(int index, int value, String name) {
    setState(() {
      selectedIndex = index;

      // set value in callback
      widget.realValue(value, name);
    });
  }

  Widget customRadio(String txt, int value, int index) {
    return OutlinedButton(
      onPressed: () => changeIndex(index, value, txt),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        backgroundColor: selectedIndex == index ? Colors.green : Colors.white,
      ),
      child: Text(
        "$txt",
        style: TextStyle(
          color: selectedIndex == index ? Colors.white : Colors.green,
        ),
      ),
    );
  }
}
