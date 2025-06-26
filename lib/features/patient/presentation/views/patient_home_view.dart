import 'package:booking_app/constants.dart';
import 'package:booking_app/features/patient/presentation/views/widgets/search_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/features/patient/presentation/views/doctor_search_view.dart';
import 'package:booking_app/features/patient/presentation/views/pharmacy_search_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello Mohamed',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage('assets/images/1748632292669.jpg'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 16.0),
                child: Text(
                  'What are you looking for?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Column(
                children: [
                  // Search Doctors Card
                  SearchCardWidget(
                    title: 'Search Doctors',
                    subtitle: 'Find specialists',
                    icon: FontAwesomeIcons.userNurse,
                    primaryColor: kPrimaryColor,
                    secondaryColor: kPrimaryColor.withOpacity(0.9),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorSearchView(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // Search Pharmacies Card
                  SearchCardWidget(
                    title: 'Search Pharmacies',
                    subtitle: 'Find medicines',
                    icon: FontAwesomeIcons.mortarPestle,
                    primaryColor: Colors.grey.shade800,
                    secondaryColor: Colors.blueGrey.shade500,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PharmacySearchView(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              // Appointment options
              // You can add appointment-related widgets here
            ],
          ),
        ),
      ),
    );
  }
}
