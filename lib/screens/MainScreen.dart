import 'dart:convert';
import 'package:abuba_steak_app/widgets/AppbarWidget.dart';
import 'package:abuba_steak_app/widgets/ModalBottomSheetWidget.dart';
import 'package:abuba_steak_app/widgets/ResponsiveLayoutWidget.dart';
import 'package:abuba_steak_app/widgets/common/CardMenuWidget.dart';
import 'package:abuba_steak_app/widgets/common/LoadingWidget.dart';
import 'package:abuba_steak_app/widgets/maxWidthContainerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ModalBottomSheetWidget modalBottom = new ModalBottomSheetWidget();
  String menuFilter = "all items";
  List menu = [];
  Map detailMenu = {};
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadDataMenu();
  }

  Future loadDataMenu() async {
    setState(() {
      loading = true;
    });
    var jsonText = await rootBundle.loadString('assets/data/menu.json');
    var result = await json.decode(jsonText);
    // print(result["menus"]);
    setState(() {
      menu = result["menus"];
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "logo"),
      body: MaxWidthContainerWidget(
        child: ResponsiveLayoutWidget(
          mobileBody: mobileLayout(),
        ),
      ),
    );
  }

  // Mobile Layout
  Widget mobileLayout() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: loading
                ? LoadingWidget()
                : Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: filterMenuOption(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Flexible(
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: menu.length,
                              itemBuilder: (context, index) {
                                return CardMenuWidget(
                                    title: menu[index]["menu_name"],
                                    img: menu[index]["menu_img"],
                                    onPress: () {
                                      setState(() {
                                        detailMenu = menu[index];
                                      });

                                      // print(detailMenu);
                                      modalBottom.modalBottomSheetMenu(
                                          context, detailMenu);
                                    });
                              }),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  // Widget dataMobile(){
  //   if()
  // }

  Widget filterMenuOption() {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
            value: menuFilter,
            items: [
              DropdownMenuItem(child: Text("All Items"), value: "all items"),
              DropdownMenuItem(child: Text("Steak"), value: "steak"),
              DropdownMenuItem(child: Text("Rice"), value: "rice"),
              DropdownMenuItem(child: Text("Side"), value: "side"),
              DropdownMenuItem(child: Text("Snack"), value: "snack"),
              DropdownMenuItem(child: Text("Drinks"), value: "drink"),
            ],
            onChanged: (value) {
              setState(() {
                menuFilter = value.toString();
              });
            },
          ),
        ),
      ),
    );
  }
}
