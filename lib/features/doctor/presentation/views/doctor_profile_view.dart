import 'package:flutter/material.dart';

class DoctorProfileSettingView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController clinicAddressController = TextEditingController();
  final TextEditingController sessionPriceController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  DoctorProfileSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Settings"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildField(label: "Full Name", controller: nameController),
            _buildField(
                label: "Specialization", controller: specializationController),
            _buildField(
                label: "Clinic Address", controller: clinicAddressController),
            _buildField(
                label: "Session Price",
                controller: sessionPriceController,
                keyboardType: TextInputType.number),
            _buildField(
                label: "Password",
                controller: passwordController,
                obscureText: true),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle update logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Update Profile",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                // Handle logout
              },
              child: const Text(
                "Logout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
