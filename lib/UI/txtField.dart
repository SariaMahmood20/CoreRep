import 'package:flutter/material.dart';


// ignore: must_be_immutable
class TxtField extends StatelessWidget {
  final String hint;
  final String label;
  final bool obscureText;
  TextEditingController controller;
  TxtField(
      {super.key,
      required this.hint,
      required this.label,
      required this.obscureText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 20,right: 20),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
