import 'package:booking_app/constants.dart';
import 'package:flutter/material.dart';
import 'widgets/doctor_home_view_body.dart';

class DoctorHomeView extends StatelessWidget {
  const DoctorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(child: DoctorHomeViewBody()),
    );
  }
}
