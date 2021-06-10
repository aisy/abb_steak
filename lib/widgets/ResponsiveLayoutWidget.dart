import 'package:flutter/material.dart';
import '../breakpoint_const.dart';

class ResponsiveLayoutWidget extends StatelessWidget {
  // set body each device
  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  const ResponsiveLayoutWidget(
      {Key? key, required this.mobileBody, this.tabletBody, this.desktopBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // membentuk layar dengan LayoutBuilder
    return LayoutBuilder(builder: (context, dimens) {
      if (dimens.maxWidth < kTabletBreakpoint) {
        return mobileBody;
      } else if (dimens.maxWidth >= kTabletBreakpoint &&
          dimens.maxWidth < kDesktopBreakpoint) {
        return tabletBody ?? mobileBody;
      } else {
        return desktopBody ?? mobileBody;
      }
    });
  }
}
