import 'package:flutter/material.dart';

class RoundedCornerTextField extends StatelessWidget {
  RoundedCornerTextField(
      {this.hintText,
      this.onChanged,
      this.obscureText = false,
      this.textInputType = null});
  final String hintText;
  final Function onChanged;
  final bool obscureText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obscureText,
      onChanged: onChanged,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
