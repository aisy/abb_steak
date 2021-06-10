import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      // title: Text(widget.title),
      title: Text("logo"),
      actions: [
        searchButton(),
        // IconButton(
        //   onPressed: () => {},
        //   icon: Icon(Icons.local_mall),
        //   splashRadius: 20.0,
        // ),
        ordersButton()
      ],
    );
  }

  Stack ordersButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
            tooltip: "Pesanan Anda",
            splashRadius: 20.0,
            icon: Icon(
              Icons.local_mall,
            ),
            onPressed: () {
              setState(() {
                counter = counter;
              });
            }),
        counter != 0
            ? new Positioned(
                right: 8,
                top: 10,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : new Container()
      ],
    );
  }

  // Widget searchButton() {
  //   return Container(
  //     margin: EdgeInsets.all(10),
  //     child: SizedBox(
  //       child: ElevatedButton.icon(
  //         icon: Icon(
  //           Icons.search,
  //           color: Colors.grey,
  //           size: 20,
  //         ),
  //         label: Text(
  //           'pencarian menu...',
  //           style: TextStyle(color: Colors.grey),
  //         ),
  //         onPressed: () => {},
  //         style: ButtonStyle(
  //           backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
  //           shape: MaterialStateProperty.all(
  //             RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(18.0),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget searchButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () => {print("Searchbar clicked")},
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            width: 180,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "pencarian...",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
