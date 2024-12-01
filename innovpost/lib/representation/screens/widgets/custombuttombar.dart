import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

// ignore: must_be_immutable
class custombottombar extends StatelessWidget {
  custombottombar(
      {super.key, required this.selectedIndex, required this.onselect});
  int selectedIndex;
  void Function(int) onselect;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      right: 10,
      left: 10,
      child: CustomNavigationBar(
        backgroundColor: const Color(0xff2185D5).withOpacity(0.9),
        borderRadius: const Radius.circular(30),
        currentIndex: selectedIndex,
        onTap: onselect,
        items: [
          CustomNavigationBarItem(
              icon: const Icon(
                IconlyLight.home,
                color: Colors.white,
              ),
              selectedIcon: const Icon(
                IconlyBold.home,
                color: Colors.white,
              ),
              selectedTitle: const Text(
                'Home',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              )),
          CustomNavigationBarItem(
              icon: const Icon(
                IconlyLight.chart,
                color: Colors.white,
              ),
              selectedIcon: const Icon(
                IconlyBold.chart,
                color: Colors.white,
              ),
              selectedTitle: const Text(
                'chart',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              )),
          CustomNavigationBarItem(
              icon: const Icon(
                IconlyLight.bag,
                color: Colors.white,
              ),
              selectedIcon: const Icon(
                IconlyBold.bag,
                color: Colors.white,
              ),
              selectedTitle: const Text(
                'carte',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              )),
          CustomNavigationBarItem(
              icon: const Icon(
                IconlyLight.document,
                color: Colors.white,
              ),
              selectedIcon: const Icon(
                IconlyBold.document,
                color: Colors.white,
              ),
              selectedTitle: const Text(
                'Orders',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              )),
        ],
      ),
    );
  }
}
