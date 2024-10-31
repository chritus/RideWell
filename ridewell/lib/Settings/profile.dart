import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ridewell/components/widgets/mylist_tile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                    color: Colors.white, shape: BoxShape.circle),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: height * 0.05,
        ),
        Container(
          height: height * 0.6,
          width: width * 0.9,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              _buildListTileWithArrow(
                title: 'Profile',
                icon: Iconsax.user,
                onTap: () {},
              ),
              _buildDivider(width),
              _buildListTileWithArrow(
                title: 'Privacy',
                icon: Iconsax.security,
                onTap: () {},
              ),
              _buildDivider(width),
              _buildListTileWithArrow(
                title: 'App Preferences',
                icon: Iconsax.magicpen,
                onTap: () {},
              ),
              _buildDivider(width),
              _buildListTileWithArrow(
                title: 'Share',
                icon: Iconsax.share,
                onTap: () {},
              ),
              _buildDivider(width),
              _buildListTileWithArrow(
                title: 'Log Out',
                icon: Iconsax.logout,
                onTap: () {},
              ),
            ],
          ),
        )
      ])),
    );
  }

  Widget _buildListTileWithArrow(
      {required String title, required IconData icon, required VoidCallback onTap}) {
    return Row(
      children: [
        Expanded(
          child: MylistTile(
            title: '      $title',
            icon: icon,
            onTap: onTap,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(Iconsax.arrow_right_3),
        ),
      ],
    );
  }

  Widget _buildDivider(double width) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      child: Divider(
        color: const Color.fromARGB(131, 116, 116, 116),
      ),
    );
  }
}
