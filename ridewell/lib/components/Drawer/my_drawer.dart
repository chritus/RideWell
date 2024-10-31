import 'package:flutter/material.dart';
import 'package:ridewell/Settings/profile.dart';
import 'package:ridewell/components/widgets/mylist_tile.dart';
import 'package:ridewell/components/widgets/animated_icon.dart';
import 'package:ridewell/components/widgets/frostedglass.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400), // Adjust duration here
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation when the drawer is opened
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 247.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Positioned(
                      top: 70, left: 100, child: FrostedGlassCircle()),
                  Positioned(
                    top: 80,
                    left: 115,
                    child: Icon(
                      Icons.person,
                      size: 72.0,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              MylistTile(
                title: 'Profile',
                icon: Icons.person_outline,
                onTap: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
              ),
              MylistTile(
                title: 'Monetization',
                icon: Icons.monetization_on_outlined,
                onTap: () {},
              ),
              MylistTile(
                title: 'History',
                icon: Icons.history_outlined,
                onTap: () {},
              ),
              MylistTile(
                title: 'Settings',
                icon: Icons.settings_cell_outlined,
                onTap: () {},
              ),
              MylistTile(
                title: 'Support',
                icon: Icons.support_agent_outlined,
                onTap: () {},
              ),
              MylistTile(
                title: 'About',
                icon: Icons.info_outline,
                onTap: () {},
              ),
              const SizedBox(
                height: 290,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CustomAnimatedIcon(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
