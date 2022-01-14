import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final double? containerHeight;
  final Widget? containerChild;
  const ReusableContainer({Key? key, this.containerChild, this.containerHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          borderRadius: BorderRadius.circular(15)),
      height: containerHeight,
      child: containerChild,
    );
  }
}
