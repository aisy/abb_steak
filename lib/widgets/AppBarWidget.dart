import 'package:abuba_steak_app/router_const.dart';
import 'package:abuba_steak_app/widgets/modal-bottom/DialogOrderModal.dart';
import 'package:abuba_steak_app/widgets/modalBottomSheetWidget.dart';
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

  ModalBottomSheetWidget modalBottom = new ModalBottomSheetWidget();

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
            setState(
              () {
                counter = counter + 1;
              },
            );
            // modalBottom.modalBottomSheetOrder(context);
            listOder(context);
          },
        ),
        counter != 0
            ? Positioned(
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
            : Container(),
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
  void listOder(BuildContext context) {
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
        return DialogOrderModal();
      },
    );
  }

  Widget searchButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () => {Navigator.pushNamed(context, SearchView)},
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
        ),
      ),
    );
  }
}
