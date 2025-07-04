import 'package:booking_app/features/doctor/presentation/views/doctor_appointment_view.dart';
import 'package:booking_app/features/doctor/presentation/views/doctor_profile_view.dart';
import 'package:booking_app/features/doctor/presentation/views/widgets/chat_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';
import 'package:booking_app/features/doctor/presentation/views/doctor_home_view.dart';

class DoctorNavBar extends StatefulWidget {
  const DoctorNavBar({super.key});

  @override
  State<DoctorNavBar> createState() => _DoctorNavBarState();
}

class _DoctorNavBarState extends State<DoctorNavBar> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const DoctorHomeView(),
    DoctorAppointmentView(),
    ChatListScreen(),
    DoctorProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
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
