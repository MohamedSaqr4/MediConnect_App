import 'package:booking_app/features/patient/presentation/views/widgets/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';
import 'package:booking_app/features/patient/presentation/views/ChatView.dart';

class ScheduleView extends StatelessWidget {
  ScheduleView({Key? key}) : super(key: key);

  // Example schedule data
  final List<Map<String, dynamic>> schedules = [
    {
      'doctor': 'Dr. Ahmed Ali',
      'specialization': 'Cardiologist',
      'date': '2025-06-01',
      'time': '10:00 PM',
      'location': 'Medical Center, Room 12',
      'image': 'assets/images/Hossam-Sakker-alhayani.jpg',
      'appointmentType': 'Online',
      'chatDoctor': {
        'name': 'Dr. Ahmed Ali',
        'specialization': 'Cardiologist',
        'image': 'assets/images/Hossam-Sakker-alhayani.jpg',
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Schedule'),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          final schedule = schedules[index];

          return ScheduleCard(
            doctorName: schedule['doctor'],
            specialization: schedule['specialization'],
            date: schedule['date'],
            time: schedule['time'],
            location: schedule['location'],
            imagePath: schedule['image'],
            appointmentType: schedule['appointmentType'],
            onChatPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatView(
                    isDoctorChat: true,
                    doctor: schedule['chatDoctor'],
                  ),
                ),
              );
            },
            onMorePressed: () {
              // Future: Add reschedule, cancel, etc.
            },
          );
        },
      ),
    );
  }
}
