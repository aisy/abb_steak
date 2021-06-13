import 'package:abuba_steak_app/widgets/AppbarWidget.dart';
import 'package:abuba_steak_app/widgets/ModalBottomSheetWidget.dart';
import 'package:abuba_steak_app/widgets/ResponsiveLayoutWidget.dart';
import 'package:abuba_steak_app/widgets/common/CardMenuWidget.dart';
import 'package:abuba_steak_app/widgets/maxWidthContainerWidget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String menuFilter = "all items";

  ModalBottomSheetWidget modalBottom = new ModalBottomSheetWidget();

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
                        CardMenuWidget(
                          title: "Destroy",
                          img: 'https://googleflutter.com/sample_image.jpg',
                          // onPress: () => modalBottomSheetMenu(context),
                          onPress: () =>
                              modalBottom.modalBottomSheetMenu(context),
                        ),
                        // cardMenu(),
                        // cardMenu(),
                        // cardMenu(),
                        // cardMenu(),
                        // cardMenu(),
                        // cardMenu(),
                        // cardMenu(),
                        // cardMenu(),
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
