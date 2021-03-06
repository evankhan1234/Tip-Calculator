import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tip_calculator/GettingStartedScreen.dart';
import "package:tip_calculator/di/dependency_injection.dart" as di;
Future<void> main() async {
  await di.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => GettingStartedScreen())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: Stack(
            children: [ Container(
        child: Align(
        alignment: Alignment.center,
            child: Image.asset(
              "assets/images/animation_500_km1rucco.gif",
              fit: BoxFit.none,
            )

          ),

            ), Container(
              padding: new EdgeInsets.all(70.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Tip and Bill Calculator App',
                      style: TextStyle(
                         color: const Color(0xFF40B7A9),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center),

              ),

            ),
            ],
        )
    );

  }
}
