import 'package:flutter/material.dart';

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
      child: Column(
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              children: [
                cardOrderList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget cardOrderList() {
  return Card(
    child: Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
                "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png"),
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
                    "Wagyu Sirloin - Prime United State tenderloin",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Rp. 120000",
                    style: TextStyle(fontWeight: FontWeight.w500),
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
                        "1",
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
