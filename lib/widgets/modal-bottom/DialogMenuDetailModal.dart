import 'package:abuba_steak_app/widgets/common/OptionPriceWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final idrCurrencyFormat = new NumberFormat.simpleCurrency(locale: 'id_ID');

class DialogMenuDetailModal extends StatefulWidget {
  final Map dataMenu;

  DialogMenuDetailModal({Key? key, required this.dataMenu}) : super(key: key);

  @override
  _DialogMenuDetailModalState createState() => _DialogMenuDetailModalState();
}

class _DialogMenuDetailModalState extends State<DialogMenuDetailModal> {
  int priceValue = 0;

  @override
  void initState() {
    super.initState();
    priceValue = widget.dataMenu["price"][0]["value"];
  }

  void updatePrice(int newValue) {
    setState(() {
      priceValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.9,
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.dataMenu["menu_img"]),
                        fit: BoxFit.cover),
                  ),
                  child: null,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.dataMenu["menu_name"],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(widget.dataMenu["description"]),
                ),
                OptionPriceWidget(
                    dataOption: widget.dataMenu["price"],
                    realValue: (int newValue) {
                      updatePrice(newValue);
                    }),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "${idrCurrencyFormat.format(priceValue)}",
                        // "${dataMenu["price"][0]}",
                        // convertPrice(dataMenu["price"]),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
