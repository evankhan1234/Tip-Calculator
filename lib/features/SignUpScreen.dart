
import 'package:flutter/material.dart';
import 'package:tip_calculator/HomeScreen.dart';
import 'package:tip_calculator/features/sign_up/LoginScreen.dart';
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpstate createState() => _SignUpstate();

  }

  class _SignUpstate extends State<SignUpScreen> {
    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      return Scaffold(
          body: Stack(
              children:[ Container(
                height: size.height,
                color: const Color(0xFFFAFAFA),
                width: double.infinity,
                // Here i can use size.width but use double.infinity because both work as a same
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset(
                        "assets/images/signup_top.png",
                        width: size.width * 0.35,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Image.asset(
                        "assets/images/main_bottom.png",
                        width: size.width * 0.25,
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/animation_500_km1yc506.gif",
                            height: size.height * 0.35,
                          ),
                          SizedBox(height: size.height * 0.03),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAFAFA),
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child:Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: TextField(
                                cursorColor: const Color(0xFF40B7A9),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: const Color(0xFF40B7A9),
                                  ),
                                  hintText: "Enter Your Name",
                                  border: InputBorder.none,
                                ),
                              ),

                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 2),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAFAFA),
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child:Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: TextField(
                                cursorColor: const Color(0xFF40B7A9),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.email,
                                    color: const Color(0xFF40B7A9),
                                  ),
                                  hintText: "Enter Your Email",
                                  border: InputBorder.none,
                                ),
                              ),

                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAFAFA),
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child:Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: TextField(
                                cursorColor: const Color(0xFF40B7A9),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.lock,
                                    color: const Color(0xFF40B7A9),
                                  ),
                                  hintText: "Enter Your Password",
                                  border: InputBorder.none,
                                ),
                              ),

                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            width: size.width * 0.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(29),
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                color: const Color(0xFF40B7A9),

                                onPressed: () {  Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (context) => HomeScreen())); },
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(color: const Color(0xFFFAFAFA),),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Already have an Account ? ",
                                style: TextStyle(color: const Color(0xFF40B7A9)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) => LoginScreen())) ;
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: const Color(0xFF40B7A9),
                                    fontWeight: FontWeight.bold,

                                  ),

                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )

                  ],
                ),
              )]
      ));
    }
  }

