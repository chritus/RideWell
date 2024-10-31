import 'package:flutter/material.dart';
import 'package:ridewell/authentication/signup.dart';
import 'package:ridewell/components/widgets/buttons.dart';
import 'package:ridewell/components/widgets/iconbuttons.dart';
import 'package:ridewell/components/widgets/textfields.dart';
import 'package:ridewell/homescreen/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/Picture1.png"),
                ),
              ),
            ),
            // Semi-transparent overlay
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0x00d9d9d9).withOpacity(0.8),
              ),
            ),
            // App title
            Positioned(
            top: height * 0.12,
            left: width * 0.25,
              child: const Text(
                "RideWell",
                style: TextStyle(fontSize: 47, color: Colors.black),
              ),
            ),
            // Login title
            Positioned(
              top: height * 0.35, // Adjust proportionally
              left: width * 0.1,
              child: const Text(
                "Login to your account",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            // Email TextField
            Positioned(
              top: height * 0.42,
              left: width * 0.08,
              right: width * 0.08,
              child: Textfields(
                focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(color: Color.fromARGB(149, 255, 255, 255))),
                                  controller: emailTextController,
                hintText: 'Email',
                obscureText: false,
                suffixIcon: null,
              ),
            ),
            // Password TextField
            Positioned(
              top: height * 0.50,
              left: width * 0.08,
              right: width * 0.08,
              child: Textfields(
                focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(color: Color.fromARGB(149, 255, 255, 255))),
                controller: passwordTextController,
                hintText: 'Password',
                obscureText: true,
                suffixIcon: null,
              ),
            ),
            // Login Button
            Positioned(
              top: height * 0.62,
              left: width * 0.1,
              right: width * 0.1,
              child: Buttons(
                text: "Login",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Home()),
                  );
                },
              ),
            ),
            // Social Login Buttons
            Positioned(
              top: height * 0.80,
              left: width * 0.1,
              right: width * 0.1,
              child: Row(
                children: [
                  Iconbuttons(
                    name: 'assets/icons/google.png',
                    onTap: () {}, //googleSignin,
                    height: height * 0.08,
                    width: width * 0.2,
                  ),
                  const Spacer(),
                  Iconbuttons(
                    name: 'assets/icons/apple.png',
                    onTap: () {},
                    height: height * 0.08,
                    width: width * 0.2,
                  ),
                  const Spacer(),
                  Iconbuttons(
                    name: 'assets/icons/facebook.png',
                    onTap: () {},
                    height: height * 0.08,
                    width: width * 0.2,
                  ),
                ],
              ),
            ),
            // "Or login with" text
            Positioned(
              top: height * 0.75,
              left: width * 0.37,
              child: const Text(
                "-Or login with-",
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
            ),
            // Sign up section
            Positioned(
              top: height * 0.95,
              left: width * 0.25,
              child: Row(
                children: [
                  const Text(
                    "Don’t have an account?",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signup(),
                        ),
                      );
                    },
                    child: const Text(
                      "  Sign up",
                      style: TextStyle(fontSize: 13, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
