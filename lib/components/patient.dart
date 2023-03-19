import 'package:flutter/material.dart';

class Patient extends StatelessWidget {
  final Function()? onTap;
  final String patientName;
  final String patientId;
  final Color bckgColor;
  final Color buttonFontColor;

  const Patient(
      {super.key,
      required this.onTap,
      required this.patientName,
      required this.patientId,
      required this.bckgColor,
      required this.buttonFontColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          color: bckgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            patientName,
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
