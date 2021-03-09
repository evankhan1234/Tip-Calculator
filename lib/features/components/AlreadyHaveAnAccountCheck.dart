import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: const Color(0xFF40B7A9)),
        ),
        GestureDetector(
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: const Color(0xFF40B7A9),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}