import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'category_secreen.dart';
import 'favorite_mael.dart';

class TabsSecreen extends StatefulWidget {
  const TabsSecreen({super.key});

  @override
  State<TabsSecreen> createState() => _TabsSecreenState();
}

class _TabsSecreenState extends State<TabsSecreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [CategorySecreen(), FavoriteMael()],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        index: _currentIndex,
        items: const [
          Icon(Icons.food_bank_sharp, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
        ],
        color: Colors.white.withOpacity(0.3),
        backgroundColor: Colors.transparent,

        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
