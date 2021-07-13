import 'package:flutter/material.dart';

// set callback
typedef void ValueCallback(String name);

class OptionCategoryWidget extends StatefulWidget {
  final List dataOption;
  final ValueCallback realValue;

  OptionCategoryWidget({
    Key? key,
    required this.dataOption,
    required this.realValue,
  }) : super(key: key);

  @override
  _OptionCategoryWidgetState createState() => _OptionCategoryWidgetState();
}

class _OptionCategoryWidgetState extends State<OptionCategoryWidget> {
  List lst = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    lst = widget.dataOption;
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 30,
    //   margin: EdgeInsets.only(bottom: 20),
    //   width: double.infinity,
    //   child: ListView(
    //     scrollDirection: Axis.horizontal,
    //     children: List.generate(
    //       lst.length,
    //       (index) {
    //         var name = lst[index]["name"];
    //         var valurPrice = lst[index]["value"];

    //         return customRadio(name, valurPrice, index);
    //       },
    //     ),
    //   ),
    // );
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 30,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: List.generate(lst.length, (index) {
              var name = lst[index]["name"];
              var valurPrice = lst[index]["value"];

              return customRadio(name, valurPrice, index);
            }),
          ),
        ),
      ),
    );
  }

  void changeIndex(int index, String name) {
    setState(
      () {
        selectedIndex = index;

        // set value in callback
        widget.realValue(name);
      },
    );
  }

  Widget customRadio(String txt, String value, int index) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: OutlinedButton(
        onPressed: () => changeIndex(index, txt),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
      ),
    );
  }
}
