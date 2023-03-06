import 'package:flutter/material.dart';

class MySmallButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonTitle;
  final Color bckgColor;
  final Color buttonFontColor;

  const MySmallButton(
      {super.key,
      required this.onTap,
      required this.buttonTitle,
      required this.bckgColor,
      required this.buttonFontColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          color: bckgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: buttonFontColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
