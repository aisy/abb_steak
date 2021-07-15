import 'package:flutter/material.dart';

class CardCategoryWidget extends StatelessWidget {
  const CardCategoryWidget(
      {Key? key,
      this.cardColor,
      required this.title,
      this.total,
      required this.onTap})
      : super(key: key);

  final Color? cardColor;
  final String title;
  final int? total;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;

    return Container(
      margin: EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () => {onTap()},
        child: Ink(
          width: 150,
          height: categoryHeight,
          decoration: BoxDecoration(
            color: cardColor != null ? cardColor : Colors.orange.shade400,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title != null ? "$title" : "Most\nFavorites",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  total != null ? '$total Menu pilihan' : "20 Items",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
