import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedGlassCircle extends StatelessWidget {
  const FrostedGlassCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 161, 161, 161)
              .withOpacity(0.2), // Background color with transparency
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: const Color.fromARGB(255, 202, 202, 202)
                .withOpacity(0.5), // Optional border
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
        ),
      ),
    );
  }
}
