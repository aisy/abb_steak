import 'dart:convert';
import 'package:abuba_steak_app/widgets/ResponsiveLayoutWidget.dart';
import 'package:abuba_steak_app/widgets/common/CardMenuWidget.dart';
// import 'package:abuba_steak_app/widgets/common/OptionCategoryWidget.dart';
import 'package:abuba_steak_app/widgets/maxWidthContainerWidget.dart';
import 'package:abuba_steak_app/widgets/modal-bottom/DialogMenuDetailModal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String nameOption = "";
  bool loading = false;
  List menu = [];
  List resultMenuSearch = [];
  Map detailMenu = {};

  List dataCategory = [
    {"id": 0, "name": "semua menu", "value": "semua menu"},
    {"id": 1, "name": "beef steak", "value": "beef steak"},
    {"id": 2, "name": "fish steak", "value": "fish steak"},
    {"id": 3, "name": "poultry steak", "value": "poultry steak"},
    {"id": 4, "name": "pasta", "value": "pasta"},
  ];

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

  void searchData(text) {
    text = text.toLowerCase();

    if (text == "") {
      setState(() {
        resultMenuSearch = [];
      });
    } else {
      setState(() {
        resultMenuSearch = menu.where((element) {
          var menuTitle = element["menu_name"].toLowerCase();
          return menuTitle.contains(text);
        }).toList();
      });
    }
  }

  void setCategory(String newOption) {
    setState(() {
      nameOption = newOption;
    });

    print(nameOption);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 35,
          child: TextField(
            autofocus: true,
            onChanged: (text) {
              searchData(text);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "pencarian menu...",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[400],
              ),
              contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
      ),
      body: MaxWidthContainerWidget(
        child: ResponsiveLayoutWidget(mobileBody: mobileLayout()),
      ),
    );
  }

  Widget mobileLayout() {
    return Column(
      children: [
        // List Category,
        // Container(
        //   // padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20),
        //   child: OptionCategoryWidget(
        //     dataOption: dataCategory,
        //     realValue: (String newCategory) {
        //       setCategory(newCategory);
        //     },
        //   ),
        // ),
        resultMenuSearch.isEmpty
            ? Container()
            : Container(
                child: Flexible(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: resultMenuSearch.length,
                    itemBuilder: (context, index) {
                      return CardMenuWidget(
                        title: resultMenuSearch[index]["menu_name"],
                        img: resultMenuSearch[index]["menu_img"],
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
              )
      ],
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
      },
    );
  }
}
