import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';

class CustomUserTypeDropdown extends StatelessWidget {
  final String? value;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;

  const CustomUserTypeDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: 'User Type',
        labelStyle: const TextStyle(fontSize: 16, color: kPrimaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      items: const [
        DropdownMenuItem(value: 'Patient', child: Text('Patient')),
        DropdownMenuItem(value: 'Doctor', child: Text('Doctor')),
        DropdownMenuItem(value: 'Pharmacist', child: Text('Pharmacist')),
      ],
      onChanged: onChanged,
      validator: validator,
    );
  }
}
