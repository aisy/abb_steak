import 'dart:convert';
import 'package:abuba_steak_app/widgets/common/OptionCategoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String indexSearch = "";
  String nameOption = "";
  bool loading = false;
  List menu = [];

  List dataCategory = [
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
    var resultMenu = menu.where((element) {
      var menuTitle = element["menu_name"].toLowerCase();
      return menuTitle.contains(text);
    }).toList();
    // setState(() {
    //   indexSearch = text;
    // });

    print(resultMenu);
  }

  @override
  Widget build(BuildContext context) {
    void setCategory(String newOption) {
      setState(() {
        nameOption = newOption;
      });

      print(nameOption);
    }

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
              hintText: "Pencarian...",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // listCategory(),
          Container(
            padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20),
            child: OptionCategoryWidget(
              dataOption: dataCategory,
              realValue: (String newCategory) {
                setCategory(newCategory);
              },
            ),
          )
        ],
      ),
    );
  }
}
