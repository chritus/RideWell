import 'package:flutter/material.dart';

class Iconbuttons extends StatelessWidget {
  final double width;
  final double height;
  final String name;
  final VoidCallback onTap;
  const Iconbuttons(
      {super.key,
      required this.name,
      required this.onTap,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Image.asset(
          name,
          height: height,
          width: width,
        ));
  }
}
