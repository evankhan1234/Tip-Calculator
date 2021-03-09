import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tip_calculator/GettingStartedScreen.dart';
import 'package:tip_calculator/features/LoginScreen.dart';
import 'package:tip_calculator/features/components/AlreadyHaveAnAccountCheck.dart';
import 'package:tip_calculator/features/components/Background.dart';
import 'package:tip_calculator/features/components/RoundedButton.dart';
import 'package:tip_calculator/features/components/RoundedInputField.dart';
import 'package:tip_calculator/features/components/RoundedPasswordField.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/animation_500_km1yc506.gif",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(

              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => GettingStartedScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}