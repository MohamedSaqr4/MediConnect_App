import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';
import 'package:booking_app/core/widgets/HeaderSection.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/signup_form_fields.dart';
import 'package:booking_app/custom/widgets/customButton.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/SocialLoginOptions%20.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/TextWithButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  bool _isPasswordVisible = false;
  String? _selectedUserType;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userType', _selectedUserType ?? '');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signing up...')),
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
          child:
              HeaderSection(title: 'Sign Up', subtitle: 'Create Your Account'),
        ),
        Expanded(
          flex: 3,
          child: Container(
            decoration: boxDecoration,
            padding: const EdgeInsets.only(
                top: 20.0, left: 24.0, right: 24.0, bottom: 20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SignUpFormFields(
                    formKey: _formKey,
                    usernameController: _usernameController,
                    emailController: _emailController,
                    phoneController: _phoneController,
                    passwordController: _passwordController,
                    addressController: _addressController,
                    selectedUserType: _selectedUserType,
                    isPasswordVisible: _isPasswordVisible,
                    onUserTypeChanged: (value) {
                      setState(() {
                        _selectedUserType = value;
                      });
                    },
                    onPasswordVisibilityToggle: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: 'SIGN UP',
                    onPressed: _signUp,
                    backgroundColor: kPrimaryColor,
                  ),
                  const SizedBox(height: 20),
                  const SocialLoginOptions(),
                  const SizedBox(height: 8),
                  TextWithButton(
                    text: "Already have an account?",
                    buttonText: "Log in",
                    onPressed: () {
                      Navigator.pop(context);
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
