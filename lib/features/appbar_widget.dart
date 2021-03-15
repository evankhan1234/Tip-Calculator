

import 'package:flutter/material.dart';
import 'package:tip_calculator/palette.dart';

AppBar appBarMain(BuildContext context, String titleText) {
  return AppBar(
    backgroundColor: Palette.primaryColor,
    title: Text(titleText),
    actions: [
      GestureDetector(
        onTap: () {
        //  Navigator.push(context, MaterialPageRoute(builder: (context) => NoticeScreen()));
        },
        child: Icon(Icons.notifications),
      ),
      SizedBox(width: 10),
    ],
  );
}

