import 'dart:convert';
import 'package:abuba_steak_app/widgets/AppBarWidget.dart';
import 'package:abuba_steak_app/widgets/ResponsiveLayoutWidget.dart';
import 'package:abuba_steak_app/widgets/common/CardMenuWidget.dart';
import 'package:abuba_steak_app/widgets/common/LoadingWidget.dart';
import 'package:abuba_steak_app/widgets/maxWidthContainerWidget.dart';
import 'package:abuba_steak_app/widgets/modal-bottom/DialogMenuDetailModal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  CategoryScreen({Key? key, required this.title}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List menu = [];
  List filterResult = [];
  Map detailMenu = {};
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadDataMenu();
  }

  Future loadDataMenu() async {
    try {
      setState(() {
        loading = true;
      });
      var jsonText = await rootBundle.loadString('assets/data/menu.json');
      var result = await json.decode(jsonText);
      var menus = result["menus"];

      List temp = [];

      for (var item in menus) {
        if (item["category"] == widget.title.toLowerCase()) {
          temp.add(item);
        }
      }

      setState(() {
        filterResult = temp;
        loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Category - ${widget.title}",
        hideSearch: true,
      ),
      body: MaxWidthContainerWidget(
        child: ResponsiveLayoutWidget(
          mobileBody: mobileLayout(),
        ),
      ),
    );
  }

  Widget mobileLayout() {
    return Container(
      child: loading
          ? LoadingWidget()
          : GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: filterResult.length,
              itemBuilder: (context, index) {
                return CardMenuWidget(
                  title: filterResult[index]["menu_name"],
                  img: filterResult[index]["menu_img"],
                  onPress: () {
                    setState(() {
                      detailMenu = filterResult[index];
                    });
                    modalBottomSheetMenu(context, detailMenu);
                  },
                );
              },
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
