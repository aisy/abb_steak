import 'dart:convert';
import 'package:abuba_steak_app/widgets/AppbarWidget.dart';
import 'package:abuba_steak_app/widgets/CardCategoryWidget.dart';
import 'package:abuba_steak_app/widgets/ModalBottomSheetWidget.dart';
import 'package:abuba_steak_app/widgets/ResponsiveLayoutWidget.dart';
import 'package:abuba_steak_app/widgets/common/CardMenuWidget.dart';
import 'package:abuba_steak_app/widgets/common/LoadingWidget.dart';
import 'package:abuba_steak_app/widgets/maxWidthContainerWidget.dart';
import 'package:abuba_steak_app/widgets/modal-bottom/DialogMenuDetailModal.dart';
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
                        // listCategory(),
                        cardCategory(),
                        Container(
                          child: Flexible(
                            child: GridView.builder(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
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
                                    setState(
                                      () {
                                        detailMenu = menu[index];
                                      },
                                    );
                                    modalBottomSheetMenu(context, detailMenu);
                                  },
                                );
                              },
                            ),
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

  Widget cardCategory() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              CardCategoryWidget(
                title: "Paling\nFavorit",
                total: 5,
              ),
              // CardCategoryWidget(
              //   title: "Baru",
              //   cardColor: Colors.lightBlue[400],
              // ),
              CardCategoryWidget(
                title: "Beef Steak",
                cardColor: Colors.amber[900],
                total: 6,
              ),
              CardCategoryWidget(
                title: "Fish Steak",
                cardColor: Colors.blue[900],
                total: 3,
              ),
              CardCategoryWidget(
                title: "Poultry Steak",
                cardColor: Colors.amber[300],
                total: 3,
              ),
              CardCategoryWidget(
                title: "Pasta",
                cardColor: Colors.red[900],
                total: 3,
              ),
              // CardCategoryWidget(
              //   title: "Appetizer",
              //   cardColor: Colors.amber[400],
              //   total: 4,
              // ),
              // CardCategoryWidget(
              //   title: "Desert",
              //   cardColor: Colors.orange[900],
              //   total: 9,
              // ),
              // CardCategoryWidget(
              //   title: "Kids Meal",
              //   cardColor: Colors.red[200],
              //   total: 3,
              // ),
              // CardCategoryWidget(
              //   title: "Salad",
              //   cardColor: Colors.green[200],
              //   total: 2,
              // ),
              // CardCategoryWidget(
              //   title: "Baverage",
              //   cardColor: Colors.lightBlue[400],
              //   total: 25,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void modalBottomSheetMenu(BuildContext context, dataMenu) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return DialogMenuDetailModal(
            dataMenu: dataMenu,
          );
        });
  }
}
