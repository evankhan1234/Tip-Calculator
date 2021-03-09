import 'package:flutter/material.dart';
import 'package:tip_calculator/features/components/TextFieldContainer.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: const Color(0xFF40B7A9),
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: const Color(0xFF40B7A9),
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: const Color(0xFF40B7A9),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}