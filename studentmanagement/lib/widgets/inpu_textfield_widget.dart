import 'package:flutter/material.dart';

class InpuTextfieldWidget extends StatelessWidget {
  const InpuTextfieldWidget(
      {required this.hintText,
      required this.controller,
      this.obsecuretext,
      this.validator,
      this.prefixicon,
      this.suffixicon});
  final String hintText;
  final Widget? prefixicon;
  final Widget? suffixicon;
  final TextEditingController controller;
  final bool? obsecuretext;
  final String? Function(String)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: TextField(
          controller: controller,
          obscureText: this.obsecuretext ?? false,
          decoration: InputDecoration(
              prefixIcon: prefixicon,
              suffixIcon: suffixicon,
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(138, 144, 162, 1)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.red)))),
    ));
  }
}
