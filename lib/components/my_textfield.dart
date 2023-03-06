import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final Function(String value)? onChange;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    this.onChange,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        onChanged: onChange,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          contentPadding: EdgeInsets.all(8.0),
        ),
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
