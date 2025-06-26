import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/features/patient/presentation/views/patient_navbar.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';
import 'package:booking_app/core/utils/widgets/HeaderSection.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/SocialLoginOptions%20.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/TextWithButton.dart';
import 'package:booking_app/core/utils/widgets/customButton.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/login_form_fields.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailOrPhoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PatientNavBar(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logging in...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 1,
          child: HeaderSection(
              title: 'Log in', subtitle: "Welcome To Mediconnect App"),
        ),
        Expanded(
          flex: 3,
          child: Container(
            decoration: boxDecoration,
            padding: const EdgeInsets.only(
                top: 30.0, left: 24.0, right: 24.0, bottom: 24.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoginFormFields(
                    formKey: _formKey,
                    emailOrPhoneController: _emailOrPhoneController,
                    passwordController: _passwordController,
                    isPasswordVisible: _isPasswordVisible,
                    onPasswordVisibilityToggle: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () => GoRouter.of(context)
                            .push(AppRouter.kForgetPasswordView),
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: 'LOGIN',
                    onPressed: login,
                    backgroundColor: kPrimaryColor,
                  ),
                  const SizedBox(height: 24),
                  const SocialLoginOptions(),
                  const SizedBox(height: 8),
                  TextWithButton(
                    text: "Don't have an account?",
                    buttonText: "Sign Up",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kSignUpView);
                    },
                  ),
                  const SizedBox(height: 2),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
