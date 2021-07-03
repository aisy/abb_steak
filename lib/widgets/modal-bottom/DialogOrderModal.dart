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
        ],
      ),
    );
  }
}
