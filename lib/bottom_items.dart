import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart'; // ✅ for custom SVG icons

class BottomNavController extends StatefulWidget {
  const BottomNavController({super.key});

  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  int _selectedIndex = 0;

  // Empty pages (no placeholder text)
  final List<Widget> _pages = [
    Container(color: Colors.transparent),
    Container(color: Colors.transparent),
    Container(color: Colors.transparent),
    Container(color: Colors.transparent),
    Container(color: Colors.transparent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27), // Deep Midnight Blue background

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: animation, child: child),
          );
        },
        child: _pages[_selectedIndex],
      ),

      // Curved Navigation Bar with Soft White accents
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            // Subtle dark shadow for depth
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: CurvedNavigationBar(
          index: _selectedIndex,
          height: 75, // 🔆 taller nav bar
          backgroundColor: Colors.transparent,
          color: const Color(0xFF0A0E27), // ✅ same deep Midnight Blue as background
          buttonBackgroundColor: const Color(0xFFF5F5F5), // Soft White accent circle
          animationDuration: const Duration(milliseconds: 400),
          animationCurve: Curves.easeInOut,
          items: [
            SvgPicture.asset(
              'assets/icons/home-alt.svg',
              height: 30,
              color: _selectedIndex == 0 ? Colors.black : const Color(0xFFF5F5F5),
            ),
            SvgPicture.asset(
              'assets/icons/stats-up-square.svg',
              height: 30,
              color: _selectedIndex == 1 ? Colors.black : const Color(0xFFF5F5F5),
            ),
            SvgPicture.asset(
              'assets/icons/sparks-solid.svg', // replaces star
              height: 30,
              color: _selectedIndex == 2 ? Colors.black : const Color(0xFFF5F5F5),
            ),
            SvgPicture.asset(
              'assets/icons/settings.svg',
              height: 30,
              color: _selectedIndex == 3 ? Colors.black : const Color(0xFFF5F5F5),
            ),
            SvgPicture.asset(
              'assets/icons/user.svg',
              height: 30,
              color: _selectedIndex == 4 ? Colors.black : const Color(0xFFF5F5F5),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}