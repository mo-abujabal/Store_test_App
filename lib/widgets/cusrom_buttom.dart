import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.nameButton, this.onTap})
      : super(key: key);
  String nameButton;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
            child: Text(
          nameButton,
          style: TextStyle(
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
