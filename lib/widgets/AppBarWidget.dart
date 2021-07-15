import 'package:abuba_steak_app/models/orderModel.dart';
import 'package:abuba_steak_app/router_const.dart';
import 'package:abuba_steak_app/widgets/modal-bottom/DialogOrderModal.dart';
import 'package:abuba_steak_app/widgets/modalBottomSheetWidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool? hideSearch;

  AppBarWidget({Key? key, required this.title, this.hideSearch})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  ModalBottomSheetWidget modalBottom = new ModalBottomSheetWidget();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      // title: Text(widget.title),
      title: Text("${widget.title.isEmpty ? "logo" : widget.title}"),
      actions: [
        widget.hideSearch == true ? Container() : searchButton(),
        // IconButton(
        //   onPressed: () => {},
        //   icon: Icon(Icons.local_mall),
        //   splashRadius: 20.0,
        // ),
        ordersButton()
      ],
    );
  }

  Consumer ordersButton() {
    return Consumer<OrderModel>(
      builder: (context, order, child) {
        int counter = order.countItem;

        return Container(
          margin: EdgeInsets.only(right: counter > 0 ? 10 : 0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                iconSize: 30,
                tooltip: "Pesanan Anda",
                splashRadius: 20.0,
                icon: Icon(
                  Icons.local_mall,
                ),
                onPressed: () {
                  // modalBottom.modalBottomSheetOrder(context);
                  listOder(context);
                },
              ),
              counter != 0
                  ? Positioned(
                      right: 5,
                      top: 6,
                      child: new Container(
                        padding: EdgeInsets.all(4),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        constraints: BoxConstraints(
                          minWidth: 10,
                          minHeight: 10,
                        ),
                        child: Text(
                          '$counter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      },
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
                  "pencarian menu...",
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
