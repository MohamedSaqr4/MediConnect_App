import 'package:booking_app/constants.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(child: SignUpViewBody()),
    );
  }
}
