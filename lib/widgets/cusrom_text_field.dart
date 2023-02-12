import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hintText,this.inpotTybe ,this.onchanged, this.obscureText = false});
  String? hintText;
  Function(String)? onchanged;
  bool? obscureText;
  TextInputType? inpotTybe;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inpotTybe,
      obscureText: obscureText!,
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
