import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/customTextForm.dart';
import 'package:booking_app/core/utils/validators.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/customDropdown.dart';

class SignUpFormFields extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final TextEditingController? usernameController;
  final TextEditingController? emailController;
  final TextEditingController? phoneController;
  final TextEditingController? passwordController;
  final TextEditingController? addressController;
  final String? selectedUserType;
  final void Function(String?)? onUserTypeChanged;
  final bool? isPasswordVisible;
  final void Function()? onPasswordVisibilityToggle;

  const SignUpFormFields({
    Key? key,
    this.formKey,
    this.usernameController,
    this.emailController,
    this.phoneController,
    this.passwordController,
    this.addressController,
    this.selectedUserType,
    this.onUserTypeChanged,
    this.isPasswordVisible,
    this.onPasswordVisibilityToggle,
  }) : super(key: key);

  @override
  State<SignUpFormFields> createState() => _SignUpFormFieldsState();
}

class _SignUpFormFieldsState extends State<SignUpFormFields> {
  late final GlobalKey<FormState> _formKey =
      widget.formKey ?? GlobalKey<FormState>();
  late final TextEditingController _usernameController =
      widget.usernameController ?? TextEditingController();
  late final TextEditingController _emailController =
      widget.emailController ?? TextEditingController();
  late final TextEditingController _phoneController =
      widget.phoneController ?? TextEditingController();
  late final TextEditingController _passwordController =
      widget.passwordController ?? TextEditingController();
  late final TextEditingController _addressController =
      widget.addressController ?? TextEditingController();
  bool _isPasswordVisible = false;
  String? _selectedUserType;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = widget.isPasswordVisible ?? false;
    _selectedUserType = widget.selectedUserType;
  }

  @override
  void dispose() {
    if (widget.usernameController == null) _usernameController.dispose();
    if (widget.emailController == null) _emailController.dispose();
    if (widget.phoneController == null) _phoneController.dispose();
    if (widget.passwordController == null) _passwordController.dispose();
    if (widget.addressController == null) _addressController.dispose();
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
            controller: _usernameController,
            labelText: 'Full Name',
            keyboardType: TextInputType.text,
            validator: Validators.username,
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            controller: _emailController,
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: Validators.email,
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            controller: _phoneController,
            labelText: 'Phone Number',
            keyboardType: TextInputType.phone,
            validator: Validators.phone,
          ),
          const SizedBox(height: 12),
          CustomUserTypeDropdown(
            value: _selectedUserType,
            onChanged: (value) {
              setState(() {
                _selectedUserType = value;
              });
              if (widget.onUserTypeChanged != null) {
                widget.onUserTypeChanged!(value);
              }
            },
            validator: Validators.userType,
          ),
          const SizedBox(height: 12),
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
          const SizedBox(height: 12),
          CustomTextFormField(
            controller: _addressController,
            labelText: 'Address',
            keyboardType: TextInputType.text,
            validator: Validators.address,
            suffixIcon: const Icon(
              Icons.location_on,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
