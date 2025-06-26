import 'package:booking_app/features/doctor/presentation/view_model/doctor_appointmernt_model.dart';
import 'package:booking_app/features/doctor/presentation/views/widgets/Doctor_appointment_card.dart';
import 'package:flutter/material.dart';

class DoctorAppointmentView extends StatelessWidget {
  final List<String> daysOfWeek = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];

  // Example appointments (simulate from database)
  final List<AppointmentModel> allAppointments = [
    AppointmentModel(
      name: "Sophia Carter",
      time: "10:00 AM - 10:30 AM",
      status: "Online",
      imageUrl: "assets/images/doctorr.png",
      day: "Sunday",
    ),
    AppointmentModel(
      name: "Ethan Bennett",
      time: "11:00 AM - 11:30 AM",
      status: "Offline",
      imageUrl: "assets/images/doctorr.png",
      day: "Monday",
    ),
  ];

  DoctorAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weekly Appointments")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: daysOfWeek.map((day) {
            final dayAppointments =
                allAppointments.where((a) => a.day == day).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(day,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                if (dayAppointments.isNotEmpty)
                  ...dayAppointments.map((appointment) =>
                      AppointmentCard(appointment: appointment))
                else
                  const Text("No Appointments",
                      style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
