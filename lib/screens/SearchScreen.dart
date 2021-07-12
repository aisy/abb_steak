import 'package:abuba_steak_app/widgets/ButtonCategoryWidget.dart';
import 'package:abuba_steak_app/widgets/common/OptionCategoryWidget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String nameOption = "";
  List dataCategory = [
    {"id": 1, "name": "beef steak", "value": "beef steak"},
    {"id": 2, "name": "fish steak", "value": "fish steak"},
    {"id": 3, "name": "poultry steak", "value": "poultry steak"},
    {"id": 4, "name": "pasta", "value": "pasta"},
  ];

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
