import 'package:abuba_steak_app/models/orderModel.dart';
import 'package:abuba_steak_app/widgets/common/CardOrderWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

final idrCurrencyFormat = new NumberFormat.simpleCurrency(locale: 'id_ID');

class DialogOrderModal extends StatefulWidget {
  DialogOrderModal({Key? key}) : super(key: key);

  @override
  _DialogOrderModalState createState() => _DialogOrderModalState();
}

class _DialogOrderModalState extends State<DialogOrderModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Consumer<OrderModel>(
        builder: (context, order, child) {
          var dataOrder = order.orderValue;
          var totalPrice = order.totalPrice;

          return Stack(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.3,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      )
                    ]),
                    width: double.infinity,
                    height: 56.0,
                    child: Center(
                      child: Text(
                        "Pesananku",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ), // Your desired title
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    top: 8.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ), // Your desired icon
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              Align(
                alignment: FractionalOffset.topCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(top: 70, bottom: 20),
                  child: dataOrder.isEmpty
                      ? Text("Anda belum melakukan order")
                      : ListView.builder(
                          itemCount: dataOrder.length,
                          itemBuilder: (context, index) {
                            return CardOrderWidget(
                              img: dataOrder[index]["menu_img"],
                              title: dataOrder[index]["menu_name"],
                              qty: dataOrder[index]["qty"],
                              option: dataOrder[index]["option"],
                              price: dataOrder[index]["price"],
                            );
                          },
                        ),
                ),
              ),
              Positioned(
                bottom: 0,
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 2,
                      offset: Offset(0, 7),
                    )
                  ]),
                  child: Text(
                    "${idrCurrencyFormat.format(totalPrice)}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
