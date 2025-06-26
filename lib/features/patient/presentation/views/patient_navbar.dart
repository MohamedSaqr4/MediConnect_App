import 'package:booking_app/constants.dart';
import 'package:booking_app/features/patient/presentation/views/ChatSelectionView.dart';
import 'package:booking_app/features/patient/presentation/views/patient_home_view.dart';
import 'package:booking_app/features/patient/presentation/views/Profile_View.dart';
import 'package:booking_app/features/patient/presentation/views/ScheduleView.dart';
import 'package:flutter/material.dart';

class PatientNavBar extends StatefulWidget {
  const PatientNavBar({super.key});

  @override
  State<PatientNavBar> createState() => _PatientNavBarState();
}

class _PatientNavBarState extends State<PatientNavBar> {
  int currentIndex = 0;

  final List<Widget> pages = [
    PatientHomeView(),    ScheduleView(),

    const ChatSelectionView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.black26,
        currentIndex: currentIndex,
        onTap: (index) {
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
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
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
