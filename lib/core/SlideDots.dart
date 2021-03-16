import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  double size;
  SlideDots(this.isActive, this.size);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? size : 8,
      width: isActive ? size : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.purple[400] : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}