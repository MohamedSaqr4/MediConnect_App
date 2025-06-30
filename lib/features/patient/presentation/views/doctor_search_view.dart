import 'package:booking_app/features/patient/presentation/patient_router.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';
import 'package:booking_app/features/patient/domain/models/doctor.dart';
import 'package:booking_app/features/patient/presentation/widgets/doctor_card.dart';
import 'package:booking_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class DoctorSearchView extends StatefulWidget {
  const DoctorSearchView({super.key});

  @override
  State<DoctorSearchView> createState() => _DoctorSearchViewState();
}

class _DoctorSearchViewState extends State<DoctorSearchView> {
  final TextEditingController _specializationController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final List<Doctor> allDoctors = [
    Doctor(
      id: '1',
      name: 'Dr. Ahmed Ali',
      specialization: 'Cardiologist',
      about: 'Heart diseases specialist with over 15 years of experience.',
      image: 'assets/images/Hossam-Sakker-alhayani.jpg',
      location: 'Cairo Medical Center',
      consultationFee: '200 EGP',
      availableTimes: [
        AvailableTime(day: 'Sunday', startTime: '10:00 AM', endTime: '2:00 PM'),
        AvailableTime(day: 'Monday', startTime: '10:00 AM', endTime: '2:00 PM'),
        AvailableTime(
            day: 'Wednesday', startTime: '10:00 AM', endTime: '2:00 PM'),
      ],
    ),
    Doctor(
      id: '2',
      name: 'Dr. Fatima Mohamed',
      specialization: 'Pediatrician',
      about: 'Specialized in children\'s health and development.',
      image: 'assets/images/doctorr.png',
      location: 'Children\'s Hospital',
      consultationFee: '150 EGP',
      availableTimes: [
        AvailableTime(
            day: 'Saturday', startTime: '9:00 AM', endTime: '1:00 PM'),
        AvailableTime(day: 'Tuesday', startTime: '9:00 AM', endTime: '1:00 PM'),
      ],
    ),
    Doctor(
      id: '3',
      name: 'Dr. Omar Hassan',
      specialization: 'Dermatologist',
      about: 'Skin and hair specialist with advanced treatments.',
      image: 'assets/images/doctorr.png',
      location: 'Dermatology Clinic',
      consultationFee: '180 EGP',
      availableTimes: [
        AvailableTime(day: 'Monday', startTime: '2:00 PM', endTime: '6:00 PM'),
        AvailableTime(
            day: 'Thursday', startTime: '10:00 AM', endTime: '4:00 PM'),
        AvailableTime(day: 'Friday', startTime: '11:00 AM', endTime: '3:00 PM'),
      ],
    ),
    Doctor(
      id: '4',
      name: 'Dr. Sara Ahmed',
      specialization: 'Neurologist',
      about: 'Expert in neurological disorders and brain health.',
      image: 'assets/images/Hossam-Sakker-alhayani.jpg',
      location: 'Neurology Institute',
      consultationFee: '250 EGP',
      availableTimes: [
        AvailableTime(day: 'Tuesday', startTime: '1:00 PM', endTime: '5:00 PM'),
        AvailableTime(
            day: 'Wednesday', startTime: '2:00 PM', endTime: '6:00 PM'),
        AvailableTime(
            day: 'Saturday', startTime: '10:00 AM', endTime: '2:00 PM'),
      ],
    ),
  ];

  List<Doctor> get filteredDoctors {
    return allDoctors.where((doctor) {
      final specializationQuery = _specializationController.text.toLowerCase();
      final addressQuery = _addressController.text.toLowerCase();

      bool matchesSpecialization = specializationQuery.isEmpty ||
          doctor.specialization.toLowerCase().contains(specializationQuery);

      bool matchesAddress = addressQuery.isEmpty ||
          doctor.location.toLowerCase().contains(addressQuery);

      return matchesSpecialization && matchesAddress;
    }).toList();
  }

  void _handleOnlineBooking(Doctor doctor, AvailableTime selectedTime) {
    // Navigate to payment view
    context.push(
      PatientRouter.kPaymentView,
      extra: {
        'doctor': doctor,
        'selectedTime': selectedTime,
        'bookingType': 'online',
      },
    );
  }

  void _handleOfflineBooking(Doctor doctor, AvailableTime selectedTime) {
    // Show appointment confirmation
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Appointment Confirmed'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Doctor: ${doctor.name}'),
              Text('Specialization: ${doctor.specialization}'),
              Text('Date: ${selectedTime.day}'),
              Text('Time: ${selectedTime.startTime} - ${selectedTime.endTime}'),
              Text('Location: ${doctor.location}'),
              const SizedBox(height: 8),
              const Text(
                'Your offline appointment has been scheduled successfully!',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _specializationController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Doctors'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Specialization Search Field
                  TextField(
                    controller: _specializationController,
                    onChanged: (value) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: 'Search by specialization...',
                      prefixIcon: const Icon(Icons.medical_services),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Address Search Field
                  TextField(
                    controller: _addressController,
                    onChanged: (value) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: 'Search by address/location...',
                      prefixIcon: const Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                ],
              ),
            ),

            // Doctors List
            if (filteredDoctors.isEmpty)
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: Center(
                  child: Text(
                    'No doctors found',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: filteredDoctors
                      .map((doctor) => DoctorCard(
                            doctor: doctor,
                            onOnlineBooking: (selectedTime) =>
                                _handleOnlineBooking(doctor, selectedTime),
                            onOfflineBooking: (selectedTime) =>
                                _handleOfflineBooking(doctor, selectedTime),
                          ))
                      .toList(),
                ),
              ),

            // Bottom padding for better scrolling
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
