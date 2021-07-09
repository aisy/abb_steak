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
                              id: dataOrder[index]["id"],
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
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 2,
                        offset: Offset(0, 7),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Pembayaran :"),
                              Text(
                                "${idrCurrencyFormat.format(totalPrice)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(flex: 2, child: Container()),
                      Expanded(
                        flex: 5,
                        child: ElevatedButton(
                          onPressed: () => {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.all(15),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Bayar",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
