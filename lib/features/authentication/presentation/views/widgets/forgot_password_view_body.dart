import 'package:booking_app/constants.dart';
import 'package:booking_app/core/utils/widgets/HeaderSection.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/TextWithButton.dart';
import 'package:booking_app/core/utils/widgets/customButton.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/customTextForm.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/core/utils/validators.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  _ForgotPasswordViewBodyState createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset link sent to your email')),
      );
      // After showing the message, navigate back after a delay
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
            flex: 1,
            child: HeaderSection(
                title: 'Forgot Password',
                subtitle: 'Enter Your EmailTo Reset Password')),
        Expanded(
          flex: 3,
          child: Container(
            decoration: boxDecoration,
            padding: const EdgeInsets.only(
                top: 30.0, left: 24.0, right: 24.0, bottom: 24.0),
            child: Form(
              key: _formKey,
              child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            controller: _emailController,
                            labelText: 'Email or phone number',
                            keyboardType: TextInputType.emailAddress,
                            validator: Validators.email,
                          ),
                          const SizedBox(height: 36),
                          CustomButton(
                            text: 'SEND RESET LINK',
                            onPressed: _resetPassword,
                            backgroundColor: kPrimaryColor,
                          ),
                          const Spacer(),
                          TextWithButton(
                            text: 'Remember your password?',
                            buttonText: 'Log in',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
