import 'package:flutter/material.dart';

class ButtonMenuWidget extends StatefulWidget {
  ButtonMenuWidget(
      {Key? key,
      this.buttonColor,
      this.iconColor,
      required this.buttonText,
      this.textColor,
      this.icon,
      this.elevation,
      required this.onTap})
      : super(key: key);

  final Color? buttonColor;
  final IconData? icon;
  final Color? iconColor;
  final String buttonText;
  final Color? textColor;
  final double? elevation;
  final VoidCallback onTap;

  @override
  _ButtonMenuWidgetState createState() => _ButtonMenuWidgetState();
}

class _ButtonMenuWidgetState extends State<ButtonMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () => {},
        borderRadius: BorderRadius.circular(20.0),
        child: Ink(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(20.0),
            color: widget.buttonColor != null
                ? widget.buttonColor
                : Theme.of(context).primaryColor,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    widget.icon != null ? widget.icon : Icons.outbond,
                    size: 20,
                    color: widget.iconColor != null
                        ? widget.iconColor
                        : Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.buttonText != "" ? "${widget.buttonText}" : "button",
                    style: TextStyle(
                      color: widget.textColor != null
                          ? widget.textColor
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
