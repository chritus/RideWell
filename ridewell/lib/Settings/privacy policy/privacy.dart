import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 221, 221, 221),
        body: SafeArea(
          child: Column(children: [
            Stack(children: [
              Container(
                height: height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.arrow_left_1, size: 35),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.05),
                  child: Container(
                    height: height * 0.2,
                    decoration: const BoxDecoration(
                        color: Colors.white
                        ),
                  ),
                ),
              ),
            ]),
          ]),
        ));
  }
}
