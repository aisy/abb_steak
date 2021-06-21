import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final idrCurrencyFormat = new NumberFormat.simpleCurrency(locale: 'id_ID');

class ModalBottomSheetWidget {
  // ScrollController _controller = ScrollController();

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
          return DraggableScrollableSheet(
              initialChildSize: 0.8,
              minChildSize: 0.5,
              maxChildSize: 0.8,
              builder: (_, controller) {
                return Container(
                  padding: EdgeInsets.only(
                      right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    controller: controller,
                    children: <Widget>[
                      Center(
                        child: Container(
                          child: null,
                          height: 4,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(dataMenu["menu_img"]),
                              fit: BoxFit.cover),
                        ),
                        child: null,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          dataMenu != null
                              ? dataMenu["menu_name"]
                              : "Judul Konten",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                      ),
                      Text(dataMenu != null
                          ? dataMenu["description"]
                          : "description"),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Text(
                              "${idrCurrencyFormat.format(10000)}",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }

  void modalBottomSheetOrder(BuildContext context) {
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
              initialChildSize: 0.5,
              minChildSize: 0.5,
              maxChildSize: 0.9,
              builder: (_, controller) {
                return Container(
                  padding: EdgeInsets.only(
                      right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    controller: controller,
                    children: <Widget>[
                      Center(
                        child: Container(
                          child: null,
                          height: 4,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
