import 'package:booking_app/constants.dart';
import 'package:booking_app/features/pharmacist/presentation/views/pharmacist_home_view.dart';
import 'package:booking_app/features/pharmacist/presentation/views/pharmacist_profile_view.dart';
import 'package:flutter/material.dart';

class PharmcyNavbar extends StatefulWidget {
  const PharmcyNavbar({super.key});

  @override
  State<PharmcyNavbar> createState() => _PharmcyNavbarState();
}

class _PharmcyNavbarState extends State<PharmcyNavbar> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const PharmacyHomeView(),
    const PharmacistProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.black26,
        currentIndex: currentIndex, // Set the initial index
        onTap: (index) {
          currentIndex =
              index; // Update the current index when an item is tapped
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
