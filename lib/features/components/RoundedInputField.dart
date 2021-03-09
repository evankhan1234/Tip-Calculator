import 'package:flutter/material.dart';
import 'package:tip_calculator/features/components/TextFieldContainer.dart';

class RoundedInputField extends StatelessWidget {
  late String hintText;
  late IconData? icon;
  late ValueChanged<String> onChanged;
   RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: const Color(0xFF40B7A9),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: const Color(0xFF40B7A9),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}