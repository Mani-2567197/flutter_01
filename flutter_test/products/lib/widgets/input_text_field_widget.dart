import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  const InputTextFieldWidget(
      {
      required this.hintText, 
      required this.controller,
      this.suffixicon
      });

  final String hintText;
  final TextEditingController controller;
  final Widget? suffixicon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixicon,
            hintStyle: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(138, 144, 162, 1),
                ),
          ),
        ),
      ),
    );
  }
}
