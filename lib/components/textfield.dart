import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(),
      ),
    );
  }
}
