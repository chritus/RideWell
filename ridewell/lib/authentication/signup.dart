import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ridewell/authentication/login_page.dart';
import 'package:ridewell/components/widgets/buttons.dart';
import 'package:ridewell/components/widgets/iconbuttons.dart';
import 'package:ridewell/components/widgets/textfields.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
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
          // Back button
          Positioned(
            top: height * 0.03,
            left: width * 0.03,
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              icon: const Icon(Iconsax.arrow_left_1,
              size: 5,),
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
          // Signup title
          Positioned(
            top: height * 0.30,
            left: width * 0.15,
            child: const Text(
              "Create an account",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          // Email textfield
          Positioned(
            top: height * 0.35,
            left: width * 0.1,
            right: width * 0.1,
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
          // Password textfield
          Positioned(
            top: height * 0.45,
            left: width * 0.1,
            right: width * 0.1,
            child: Textfields(
              focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(color: Color.fromARGB(149, 255, 255, 255))),
              controller: passwordTextController,
              hintText: 'Password',
              obscureText: !_isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
          ),
          // Confirm Password textfield
          Positioned(
            top: height * 0.6,
            left: width * 0.1,
            right: width * 0.1,
            child: Textfields(
              focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(color: Color.fromARGB(149, 255, 255, 255))),
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: !_isConfirmPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
              ),
            ),
          ),
          // Sign Up Button
          Positioned(
            top: height * 0.7,
            left: width * 0.1,
            right: width * 0.1,
            child: Buttons(
              text: "Sign Up",
              onTap: () {}, //register,
            ),
          ),
          // "-Or Sign Up with-" text
          Positioned(
            top: height * 0.8,
            left: width * 0.35,
            child: const Text(
              "-Or Sign Up with-",
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ),
          // Social Sign Up buttons
          Positioned(
            top: height * 0.85,
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
          // Already have an account? Login text
          Positioned(
            top: height * 0.95,
            left: width * 0.25,
            child: Row(
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: const Text(
                    "  Login",
                    style: TextStyle(fontSize: 13, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
