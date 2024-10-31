import 'package:flutter/material.dart';

class MylistTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const MylistTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 82, 82, 82),
          ),
        ),
        leading: Icon(icon),
        onTap: onTap,
      ),
    );
  }
}
