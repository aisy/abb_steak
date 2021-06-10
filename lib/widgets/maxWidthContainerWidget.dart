import 'package:flutter/material.dart';
import '../breakpoint_const.dart';

class MaxWidthContainerWidget extends StatelessWidget {
  const MaxWidthContainerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kMaxWidth),
        child: child,
      ),
    );
  }
}
