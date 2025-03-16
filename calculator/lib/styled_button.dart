import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton(
      {required this.bgColor,
      required this.textColor,
      required this.text,
      required this.func,
      super.key});

  final Color bgColor;
  final Color textColor;
  final String text;
  final func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: bgColor,
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: 26, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
