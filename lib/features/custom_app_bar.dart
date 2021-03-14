import 'package:flutter/material.dart';
import 'package:tip_calculator/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String s;
  CustomAppBar(this.s);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(s),
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
