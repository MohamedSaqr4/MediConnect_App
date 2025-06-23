import 'package:booking_app/constants.dart';
import 'package:flutter/material.dart';

class TextWithButton extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPressed;
  final Color textColor;
  final double fontSize;

  const TextWithButton({
    Key? key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
    this.textColor = Colors.black54,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
