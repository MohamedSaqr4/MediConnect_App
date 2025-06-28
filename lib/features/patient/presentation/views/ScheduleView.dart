import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';
import 'package:booking_app/features/patient/presentation/views/ChatView.dart';
import 'package:booking_app/features/patient/presentation/views/widgets/schedule_card.dart';

class DoctorAppointment {
  final String doctorName;
  final String specialization;
  final String date;
  final String time;
  final String location;
  final String imagePath;
  final String appointmentType;
  final Map<String, dynamic> chatDoctor;
  final bool isPast;

  DoctorAppointment({
    required this.doctorName,
    required this.specialization,
    required this.date,
    required this.time,
    required this.location,
    required this.imagePath,
    required this.appointmentType,
    required this.chatDoctor,
    required this.isPast,
  });
}

class ScheduleView extends StatefulWidget {
  ScheduleView({Key? key}) : super(key: key);

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<DoctorAppointment> allSchedules = [
    DoctorAppointment(
      doctorName: 'Dr. Ahmed Ali',
      specialization: 'Cardiologist',
      date: '2025-06-01',
      time: '10:00 PM',
      location: 'Medical Center, Room 12',
      imagePath: 'assets/images/Hossam-Sakker-alhayani.jpg',
      appointmentType: 'Online',
      chatDoctor: {
        'name': 'Dr. Ahmed Ali',
        'specialization': 'Cardiologist',
        'image': 'assets/images/Hossam-Sakker-alhayani.jpg',
      },
      isPast: false,
    ),
    DoctorAppointment(
      doctorName: 'Dr. Sara Youssef',
      specialization: 'Dermatologist',
      date: '2025-06-03',
      time: '2:30 PM',
      location: 'City Clinic, Room 5',
      imagePath: 'assets/images/doctor3.png',
      appointmentType: 'Offline',
      chatDoctor: {
        'name': 'Dr. Sara Youssef',
        'specialization': 'Dermatologist',
        'image': 'assets/images/doctor3.png',
      },
      isPast: false,
    ),
    DoctorAppointment(
      doctorName: 'Dr. Omar Hassan',
      specialization: 'Orthopedic',
      date: '2025-06-05',
      time: '4:00 PM',
      location: 'Ortho Clinic, Room 8',
      imagePath: 'assets/images/Doctor2.png',
      appointmentType: 'Offline',
      chatDoctor: {
        'name': 'Dr. Omar Hassan',
        'specialization': 'Orthopedic',
        'image': 'assets/images/Doctor2.png',
      },
      isPast: false,
    ),
    DoctorAppointment(
      doctorName: 'Dr. Mona Hassan',
      specialization: 'Neurologist',
      date: '2024-05-01',
      time: '1:00 PM',
      location: 'Neuro Clinic, Room 2',
      imagePath: 'assets/images/Doctor1.png',
      appointmentType: 'Online',
      chatDoctor: {
        'name': 'Dr. Mona Hassan',
        'specialization': 'Neurologist',
        'image': 'assets/images/Doctor1.png',
      },
      isPast: true,
    ),
    DoctorAppointment(
      doctorName: 'Dr. Fatima Ali',
      specialization: 'Pediatrician',
      date: '2024-04-28',
      time: '11:00 AM',
      location: 'Children Hospital, Room 15',
      imagePath: 'assets/images/doctorr.png',
      appointmentType: 'Offline',
      chatDoctor: {
        'name': 'Dr. Fatima Ali',
        'specialization': 'Pediatrician',
        'image': 'assets/images/doctorr.png',
      },
      isPast: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final upcoming = allSchedules.where((a) => !a.isPast).toList();
    final past = allSchedules.where((a) => a.isPast).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Schedule'),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Upcoming Appointments
          ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: upcoming.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final appointment = upcoming[index];
              return ScheduleCard(
                doctorName: appointment.doctorName,
                specialization: appointment.specialization,
                date: appointment.date,
                time: appointment.time,
                location: appointment.location,
                imagePath: appointment.imagePath,
                appointmentType: appointment.appointmentType,
                onChatPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatView(
                        isDoctorChat: true,
                        doctor: appointment.chatDoctor,
                      ),
                    ),
                  );
                },
                chatButtonLabel: 'Chat',
              );
            },
          ),
          // Past Appointments
          ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: past.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final appointment = past[index];
              return ScheduleCard(
                doctorName: appointment.doctorName,
                specialization: appointment.specialization,
                date: appointment.date,
                time: appointment.time,
                location: appointment.location,
                imagePath: appointment.imagePath,
                appointmentType: appointment.appointmentType,
                onChatPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatView(
                        isDoctorChat: true,
                        doctor: appointment.chatDoctor,
                      ),
                    ),
                  );
                },
                chatButtonLabel: 'Review Chat',
              );
            },
          ),
        ],
      ),
    );
  }
}
