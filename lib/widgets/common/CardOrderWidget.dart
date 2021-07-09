import 'package:abuba_steak_app/models/orderModel.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final idrCurrencyFormat = new NumberFormat.simpleCurrency(locale: 'id_ID');

class CardOrderWidget extends StatefulWidget {
  final int? id;
  final String img;
  final String title;
  final String? option;
  final int price;
  final int qty;

  const CardOrderWidget(
      {Key? key,
      required this.img,
      required this.title,
      this.option,
      required this.qty,
      required this.price,
      this.id})
      : super(key: key);

  @override
  _CardOrderWidgetState createState() => _CardOrderWidgetState();
}

class _CardOrderWidgetState extends State<CardOrderWidget> {
  @override
  Widget build(BuildContext context) {
    void removeItemOrder(id) {
      var setOrderProvider = context.read<OrderModel>();
      setOrderProvider.removeOrder(id);
    }

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Image.network("${widget.img}"),
            ),
            Expanded(
              flex: 5,
              child: Container(
                // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.title} ${widget.option != "" ? "- ${widget.option}" : ""}",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${idrCurrencyFormat.format(widget.price)}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                // padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    qtyDisplay(),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton.icon(
                      onPressed: () => {removeItemOrder(widget.id)},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      icon: Icon(Icons.delete),
                      label: Text("hapus"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget qtyDisplay() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 30, height: 30),
            child: ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 12,
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.green, // <-- Button color
              ),
            ),
          ),
          Container(
            width: 40,
            child: Text(
              "${widget.qty}",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 30, height: 30),
            child: ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 12,
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.green, // <-- Button color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
