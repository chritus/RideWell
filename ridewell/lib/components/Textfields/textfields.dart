import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final suffixIcon;
  final dynamic focusedBorder;
  const Textfields(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.suffixIcon,
      required this.focusedBorder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(147, 154, 154, 154)),
          ),
          focusedBorder: focusedBorder,
          fillColor: const Color.fromARGB(191, 217, 217, 217),
          filled: true,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Color.fromARGB(255, 121, 121, 121))),
    );
  }
}
