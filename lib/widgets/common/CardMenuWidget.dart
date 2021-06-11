import 'package:flutter/material.dart';

class CardMenuWidget extends StatefulWidget {
  final String img;
  final double? imgHeight;
  final String title;
  final VoidCallback onPress;

  CardMenuWidget(
      {Key? key,
      required this.title,
      required this.img,
      required this.onPress,
      this.imgHeight})
      : super(key: key);

  @override
  _CardMenuWidgetState createState() => _CardMenuWidgetState();
}

class _CardMenuWidgetState extends State<CardMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () => widget.onPress(),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 120.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(5.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.img),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${widget.title}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
