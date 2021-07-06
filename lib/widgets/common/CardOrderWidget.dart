import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final idrCurrencyFormat = new NumberFormat.simpleCurrency(locale: 'id_ID');

class CardOrderWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Image.network("$img"),
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
                      "$title ${option != "" ? "- $option" : ""}",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${idrCurrencyFormat.format(price)}",
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
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 30, height: 30),
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
                          "$qty",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 30, height: 30),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
