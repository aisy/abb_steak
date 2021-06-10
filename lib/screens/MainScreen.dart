import 'package:abuba_steak_app/widgets/AppbarWidget.dart';
import 'package:abuba_steak_app/widgets/ResponsiveLayoutWidget.dart';
import 'package:abuba_steak_app/widgets/maxWidthContainerWidget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String menuFilter = "all items";

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

  void modalBottomSheetShow() {
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
          return DraggableScrollableSheet(
              initialChildSize: 0.8,
              minChildSize: 0.5,
              maxChildSize: 0.8,
              builder: (_, controller) {
                return Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    controller: controller,
                    children: <Widget>[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://googleflutter.com/sample_image.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: null,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Judul Konten",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                      ),
                      Text(
                          "Lorem enim aliquip veniam occaecat enim cillum quis laboris sunt aute consectetur do. Id sint do consectetur incididunt nostrud in laborum sunt pariatur mollit velit nisi aute. "),
                    ],
                  ),
                );
              });
        });
  }

  // Mobile Layout
  Widget mobileLayout() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Container(
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
                    child: GridView.count(
                      crossAxisCount: 2,
                      primary: false,
                      // padding: const EdgeInsets.all(20.0),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: <Widget>[
                        cardMenu(),
                        cardMenu(),
                        cardMenu(),
                        cardMenu(),
                        cardMenu(),
                        cardMenu(),
                        cardMenu(),
                        cardMenu(),
                        cardMenu(),
                      ],
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

  Widget cardMenu() {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () => modalBottomSheetShow(),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 98,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://googleflutter.com/sample_image.jpg'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Judul Konten",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

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

  Widget sauceMenuOption() {
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
