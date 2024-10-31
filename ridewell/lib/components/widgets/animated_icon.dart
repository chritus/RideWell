import 'package:flutter/material.dart';

class CustomAnimatedIcon extends StatefulWidget {
  const CustomAnimatedIcon({super.key});

  @override
  _CustomAnimatedIconState createState() => _CustomAnimatedIconState();
}

class _CustomAnimatedIconState extends State<CustomAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Calculate the opacity for sun and moon
          double sunOpacity = _controller.value; // 0.0 to 1.0
          double moonOpacity = 1 - _controller.value; // 1.0 to 0.0

          return Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: moonOpacity,
                child: Icon(
                  Icons.nights_stay_outlined, // Moon icon
                  size: 42.0,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Opacity(
                opacity: sunOpacity,
                child: Icon(
                  Icons.wb_sunny_outlined, // Sun icon
                  size: 42.0,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
