import 'package:abuba_steak_app/models/orderModel.dart';
import 'package:abuba_steak_app/widgets/common/OptionPriceWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final idrCurrencyFormat = new NumberFormat.simpleCurrency(locale: 'id_ID');

class DialogMenuDetailModal extends StatefulWidget {
  final Map dataMenu;

  DialogMenuDetailModal({Key? key, required this.dataMenu}) : super(key: key);

  @override
  _DialogMenuDetailModalState createState() => _DialogMenuDetailModalState();
}

class _DialogMenuDetailModalState extends State<DialogMenuDetailModal> {
  int priceValue = 0;
  String nameValue = "";

  int qtyItem = 1;
  int fixPrice = 0;
  Map order = {};

  late TextEditingController qty;

  @override
  void initState() {
    qty = TextEditingController()..text = qtyItem.toString();
    super.initState();

    priceValue = widget.dataMenu["price"][0]["value"] * qtyItem;
    nameValue = widget.dataMenu["price"][0]["name"];
  }

  @override
  Widget build(BuildContext context) {
    void updatePrice(int newValue, String newName) {
      if (qtyItem > 1) {
        setState(() {
          priceValue = newValue;
          nameValue = newName;
          fixPrice = priceValue * qtyItem;
        });
      } else if (qtyItem == 1) {
        setState(() {
          priceValue = newValue;
          nameValue = newName;
          fixPrice = priceValue * qtyItem;
        });
      } else {
        setState(() {
          priceValue = newValue;
          nameValue = newName;
        });
      }
    }

    void setOrder() {
      var resOrder = {};

      resOrder['id'] = widget.dataMenu["id"];
      resOrder['menu_name'] = widget.dataMenu["menu_name"];
      resOrder['menu_img'] = widget.dataMenu["menu_img"];
      resOrder['qty'] = qtyItem;
      resOrder['option'] = widget.dataMenu["price"].length > 1 ? nameValue : "";
      resOrder['price'] = fixPrice == 0 ? priceValue : fixPrice;
      resOrder['qty_price'] = fixPrice == 0 ? priceValue : fixPrice;

      setState(() {
        order = resOrder;
      });

      var setOrderProvider = context.read<OrderModel>();
      setOrderProvider.addOrder(order);

      Navigator.of(context).pop();
    }

    void changeQtyValue(text) {
      if (text == "") {
        setState(() {
          qtyItem = 1;
          fixPrice = priceValue * qtyItem;
        });
      } else {
        var qtyValue = int.parse(text);
        if (qtyValue > 1) {
          setState(() {
            qtyItem = qtyValue;
            fixPrice = priceValue * qtyValue;
          });
        }
      }
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 1,
      builder: (_, controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            toolbarHeight: 30,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            centerTitle: true,
            title: Container(
              child: null,
              height: 4,
              width: 30,
              // margin: EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            height: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(
              right: 20.0,
              left: 20.0,
              bottom: 20.0,
              top: 10.0,
            ),
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.dataMenu["menu_img"]),
                          fit: BoxFit.cover),
                    ),
                    child: null,
                  ),
                  // Menu Name
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.dataMenu["menu_name"],
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                  // Menu Desc
                  Container(
                    child: Text(widget.dataMenu["description"]),
                  ),
                  // Check Option
                  widget.dataMenu["price"].length > 1
                      ? Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 20, bottom: 5),
                          child: Text(
                            "Pilihan",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        )
                      : SizedBox(),
                  widget.dataMenu["price"].length > 1
                      ? OptionPriceWidget(
                          dataOption: widget.dataMenu["price"],
                          realValue: (int newValue, String newName) {
                            updatePrice(newValue, newName);
                          },
                        )
                      : SizedBox(
                          height: 20,
                        ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.green,
                                )),
                            child: Icon(Icons.remove, color: Colors.green),
                          ),
                          onTap: () {
                            if (qtyItem <= 1) {
                              setState(() {
                                qtyItem = 1;
                                qty.text = qtyItem.toString();
                              });
                            } else {
                              setState(() {
                                qtyItem = qtyItem - 1;
                                qty.text = qtyItem.toString();
                                fixPrice = priceValue * qtyItem;
                              });
                            }
                          },
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                              controller: qty,
                              onChanged: (text) {
                                changeQtyValue(qty.text);
                              },
                            )),
                        InkWell(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.green,
                                )),
                            child: Icon(Icons.add, color: Colors.green),
                          ),
                          onTap: () {
                            setState(() {
                              qtyItem = qtyItem + 1;
                              qty.text = qtyItem.toString();
                              fixPrice = priceValue * qtyItem;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () => {setOrder()},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                      ),
                      child: Text(
                        "Tambahkan ke pesanan - ${idrCurrencyFormat.format(fixPrice == 0 ? priceValue : fixPrice)}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
