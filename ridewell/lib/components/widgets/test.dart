import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Positioned(
        left: width * 0.05, // Responsive left margin (5% of the screen width)
        right: width * 0.05, // Responsive right margin (5% of the screen width)
        bottom: height * 0.015, // Responsive bottom margin (1.5% of the screen height)
        child: ClipRRect(
          borderRadius: BorderRadius.circular(width * 0.05), // Curved edges relative to screen width
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
            child: Container(
              height: height * 0.08, // Height based on screen height (8%)
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3), // Semi-transparent background
                borderRadius: BorderRadius.circular(width * 0.05), // Curved edges
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent, // Disable ripple effect
                  highlightColor: Colors.transparent, // Disable highlight effect
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent, // Make the navbar itself transparent
                  elevation: 0, // Remove shadow
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(
                        Iconsax.home,
                        size: 18, // Reduced icon size
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Iconsax.search_normal,
                        size: 18, // Reduced icon size
                      ),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Iconsax.driving,
                        size: 18, // Reduced icon size
                      ),
                      label: 'Route',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Iconsax.path,
                        size: 18, // Reduced icon size
                      ),
                      label: 'Flow',
                    ),
                  ],
                  onTap: onItemTapped,
                  currentIndex: selectedIndex,
                  selectedItemColor: const Color.fromARGB(255, 0, 0, 0), // Color when selected
                  unselectedItemColor: const Color.fromARGB(255, 105, 102, 102), // Color when unselected
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedIconTheme: IconThemeData(
                    size: width * 0.05, // Responsive selected icon size
                  ),
                  unselectedIconTheme: IconThemeData(
                    size: width * 0.05, // Responsive unselected icon size
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
