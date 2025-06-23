import 'package:booking_app/constants.dart';
import 'package:booking_app/views/ChatSelectionView.dart';
import 'package:booking_app/views/HomeView.dart';
import 'package:booking_app/views/Profile_View.dart';
import 'package:booking_app/views/ScheduleView.dart';
import 'package:flutter/material.dart';

class NavBarRoots extends StatefulWidget {
  const NavBarRoots({super.key});
  static String routeName = "NavBarRoots";

  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _views = [
    HomeView(),
    const ChatSelectionView(),
    ScheduleView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _views[_selectedIndex],
      bottomNavigationBar: Container(
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.black26,
          selectedLabelStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
