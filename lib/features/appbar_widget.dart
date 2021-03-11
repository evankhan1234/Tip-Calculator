

import 'package:flutter/material.dart';

AppBar appBarMain(BuildContext context, String titleText) {
  return AppBar(
    backgroundColor: const Color(0xFF40B7A9),
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

