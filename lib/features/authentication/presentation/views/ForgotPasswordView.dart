import 'package:booking_app/constants.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: ForgotPasswordViewBody(),
      ),
    );
  }
}
