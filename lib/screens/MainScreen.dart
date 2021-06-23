import 'dart:convert';
import 'package:abuba_steak_app/widgets/AppbarWidget.dart';
import 'package:abuba_steak_app/widgets/ButtonMenuWidget.dart';
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
      // padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: loading
                ? LoadingWidget()
                : Container(
                    child: Column(
                      children: [
                        listCategory(),
                        Container(
                          child: Flexible(
                            child: GridView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 20),
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

                                        modalBottom.modalBottomSheetMenu(
                                            context, detailMenu);
                                      });
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget listCategory() {
    return Container(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // filterMenuOption(),
          ButtonMenuWidget(
            icon: Icons.tune,
            iconColor: Colors.black,
            buttonColor: Colors.white,
            textColor: Colors.black,
            buttonText: "Filter",
            onTap: () => {},
          ),
          ButtonMenuWidget(
            buttonColor: Colors.amber[900],
            buttonText: "Steak",
            onTap: () => {},
          ),
          ButtonMenuWidget(
            buttonColor: Colors.red[900],
            buttonText: "Pasta",
            onTap: () => {},
          ),
          ButtonMenuWidget(
            buttonColor: Colors.amber[400],
            buttonText: "Appetizer",
            onTap: () => {},
          ),
          ButtonMenuWidget(
            buttonColor: Colors.red[200],
            buttonText: "Desert",
            onTap: () => {},
          ),
          ButtonMenuWidget(
            buttonColor: Colors.lightBlue[400],
            buttonText: "Drinks",
            onTap: () => {},
          ),
        ],
      ),
    );
  }

  Widget filterMenuOption() {
    return Container(
      // height: 30,
      margin: EdgeInsets.only(right: 5),
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
            DropdownMenuItem(child: Text("Pasta"), value: "pasta"),
            // DropdownMenuItem(child: Text("Rice"), value: "rice"),
            // DropdownMenuItem(child: Text("Side"), value: "side"),
            // DropdownMenuItem(child: Text("Snack"), value: "snack"),
            // DropdownMenuItem(child: Text("Drinks"), value: "drink"),
          ],
          onChanged: (value) {
            setState(() {
              menuFilter = value.toString();
            });
          },
        ),
      ),
    );
  }
}
