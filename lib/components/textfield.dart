import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final Icon? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.obscureText = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(
          labelText,
          style: TextStyle(fontSize: 20, color: Color(0xffF4ECF7)),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
