import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(
      {Key? key,
      this.width,
      this.height,
      this.boxColor,
      this.circularSize,
      this.circularColor,
      this.labelLoading,
      this.textLabelColor})
      : super(key: key);

  final double? width;
  final double? height;
  final double? circularSize;
  final Color? boxColor;
  final Color? circularColor;
  final String? labelLoading;
  final Color? textLabelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                // color: Colors.white70,
                ),
            child: Container(
              decoration: BoxDecoration(
                  color: boxColor != null
                      ? boxColor
                      : Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(10.0)),
              width: width != null ? width : 150,
              height: height != null ? width : 150,
              alignment: AlignmentDirectional.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: circularSize != null ? circularSize : 50.0,
                      width: circularSize != null ? circularSize : 50.0,
                      child: CircularProgressIndicator(
                        value: null,
                        valueColor: AlwaysStoppedAnimation(circularColor != null
                            ? circularColor
                            : Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25.0),
                    child: Center(
                      child: Text(
                        labelLoading != null ? "$labelLoading" : "loading...",
                        style: TextStyle(
                          color: textLabelColor != null
                              ? textLabelColor
                              : Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
