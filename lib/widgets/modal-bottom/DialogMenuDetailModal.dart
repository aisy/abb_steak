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
  int countItem = 1;
  int fixPrice = 0;
  Map order = {};

  @override
  void initState() {
    super.initState();
    priceValue = widget.dataMenu["price"][0]["value"] * countItem;
  }

  void updatePrice(int newValue) {
    setState(() {
      priceValue = newValue;
    });
  }

  void setOrder() {
    var resOrder = {};

    resOrder['id'] = widget.dataMenu["id"];
    resOrder['menu_name'] = widget.dataMenu["menu_name"];
    resOrder['menu_img'] = widget.dataMenu["menu_img"];
    // resOrder['option'] = widget.dataMenu["price"];
    resOrder['price'] = fixPrice == 0 ? priceValue : fixPrice;

    setState(() {
      order = resOrder;
    });

    print(order);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.8,
      builder: (_, controller) {
        return Container(
          padding: EdgeInsets.only(
            right: 20.0,
            left: 20.0,
            bottom: 20.0,
            top: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  child: null,
                  height: 4,
                  width: 30,
                  margin: EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Flexible(
                child: ListView(
                  controller: controller,
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
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.dataMenu["menu_name"],
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Text(widget.dataMenu["description"]),
                    ),
                    widget.dataMenu["price"].length > 1
                        ? Container(
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
                            realValue: (int newValue) {
                              updatePrice(newValue);
                            },
                          )
                        : SizedBox(
                            height: 20,
                          ),
                    // Container(
                    //   margin: EdgeInsets.only(bottom: 5),
                    //   child: Text(
                    //     "Jumlah",
                    //     style: TextStyle(fontWeight: FontWeight.w700),
                    //   ),
                    // ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (countItem <= 1) {
                                setState(() {
                                  countItem = 1;
                                });
                              } else {
                                setState(() {
                                  countItem = countItem - 1;
                                  fixPrice = priceValue * countItem;
                                });
                              }
                            },
                            child: Icon(Icons.remove, color: Colors.green),
                            style: ElevatedButton.styleFrom(
                              // shape: CircleBorder(),
                              side: BorderSide(color: Colors.grey, width: 2),
                              elevation: 0,
                              padding: EdgeInsets.all(15),
                              primary: Colors.white, // <-- Button color
                            ),
                          ),
                          Container(
                            width: 50,
                            child: Text(
                              "$countItem",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                countItem = countItem + 1;
                                fixPrice = priceValue * countItem;
                              });
                            },
                            child: Icon(Icons.add, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              // shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                              primary: Colors.green, // <-- Button color
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 20),
                    //   child: Text(
                    //     "${idrCurrencyFormat.format(priceValue)}",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.w700,
                    //       fontSize: 18,
                    //     ),
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () => {setOrder()},
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(20)),
                        ),
                        child: Text(
                          "Tambahkan ke pesanan - ${idrCurrencyFormat.format(fixPrice == 0 ? priceValue : fixPrice)}",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
