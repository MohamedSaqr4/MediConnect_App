import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/customTextForm.dart';
import 'package:booking_app/core/utils/validators.dart';

class LoginFormFields extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final TextEditingController? emailOrPhoneController;
  final TextEditingController? passwordController;
  final bool? isPasswordVisible;
  final void Function()? onPasswordVisibilityToggle;

  const LoginFormFields({
    Key? key,
    this.formKey,
    this.emailOrPhoneController,
    this.passwordController,
    this.isPasswordVisible,
    this.onPasswordVisibilityToggle,
  }) : super(key: key);

  @override
  State<LoginFormFields> createState() => _LoginFormFieldsState();
}

class _LoginFormFieldsState extends State<LoginFormFields> {
  late final GlobalKey<FormState> _formKey =
      widget.formKey ?? GlobalKey<FormState>();
  late final TextEditingController _emailOrPhoneController =
      widget.emailOrPhoneController ?? TextEditingController();
  late final TextEditingController _passwordController =
      widget.passwordController ?? TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = widget.isPasswordVisible ?? false;
  }

  @override
  void dispose() {
    if (widget.emailOrPhoneController == null)
      _emailOrPhoneController.dispose();
    if (widget.passwordController == null) _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 2),
          CustomTextFormField(
            controller: _emailOrPhoneController,
            labelText: 'Email or Phone number',
            keyboardType: TextInputType.emailAddress,
            validator: Validators.emailOrPhone,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: _passwordController,
            labelText: 'Password',
            obscureText: widget.isPasswordVisible ?? _isPasswordVisible,
            validator: Validators.password,
            suffixIcon: IconButton(
              icon: Icon(
                (widget.isPasswordVisible ?? _isPasswordVisible)
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: kPrimaryColor,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
                if (widget.onPasswordVisibilityToggle != null) {
                  widget.onPasswordVisibilityToggle!();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
