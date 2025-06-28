import 'package:booking_app/constants.dart';
import 'package:flutter/material.dart';

class PharmacistProfileView extends StatefulWidget {
  const PharmacistProfileView({Key? key}) : super(key: key);

  @override
  State<PharmacistProfileView> createState() => _PharmacistProfileViewState();
}

class _PharmacistProfileViewState extends State<PharmacistProfileView> {
  String pharmacyName = "Nile Pharmacy";
  String phoneNumber = "+20 123 456 7890";
  String email = "info@nilepharmacy.com";
  String address = "123 Tahrir Square, Downtown, Cairo";
  bool deliveryAvailable = true;
  String deliveryTime = "30-45 minutes";

  void _changePharmacyName() async {
    final controller = TextEditingController(text: pharmacyName);
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Pharmacy Name'),
        content: TextField(
          controller: controller,
          decoration:
              const InputDecoration(hintText: 'Enter new pharmacy name'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Save')),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() => pharmacyName = result.trim());
    }
  }

  void _changePhoneNumber() async {
    final controller = TextEditingController(text: phoneNumber);
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Phone Number'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter new phone number'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Save')),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() => phoneNumber = result.trim());
    }
  }

  void _changeEmail() async {
    final controller = TextEditingController(text: email);
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Email'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter new email'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Save')),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() => email = result.trim());
    }
  }

  void _changeAddress() async {
    final controller = TextEditingController(text: address);
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Address'),
        content: TextField(
          controller: controller,
          maxLines: 3,
          decoration: const InputDecoration(hintText: 'Enter new address'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Save')),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() => address = result.trim());
    }
  }

  void _changeDeliveryTime() async {
    final controller = TextEditingController(text: deliveryTime);
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Delivery Time'),
        content: TextField(
          controller: controller,
          decoration:
              const InputDecoration(hintText: 'Enter new delivery time'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Save')),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() => deliveryTime = result.trim());
    }
  }

  void _toggleDelivery() {
    setState(() {
      deliveryAvailable = !deliveryAvailable;
    });
  }

  Widget buildProfileAction({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onPressed,
    Color? color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          leading: Icon(icon, color: color ?? kPrimaryColor),
          title: Text(label,
              style: TextStyle(
                  color: color ?? kPrimaryColor, fontWeight: FontWeight.w500)),
          subtitle: Text(
            value,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onPressed,
        ),
      ),
    );
  }

  Widget buildToggleAction({
    required IconData icon,
    required String label,
    required bool value,
    required VoidCallback onPressed,
    Color? color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          leading: Icon(icon, color: color ?? kPrimaryColor),
          title: Text(label,
              style: TextStyle(
                  color: color ?? kPrimaryColor, fontWeight: FontWeight.w500)),
          subtitle: Text(
            value ? 'Available' : 'Not Available',
            style: TextStyle(
              color: value ? Colors.green : Colors.red,
              fontSize: 12,
            ),
          ),
          trailing: Switch(
            value: value,
            onChanged: (newValue) => onPressed(),
            activeColor: kPrimaryColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 32),
                const CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  radius: 57,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.local_pharmacy,
                      size: 50,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  pharmacyName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(height: 32),

                // Profile Options
                buildProfileAction(
                  icon: Icons.edit,
                  label: 'Pharmacy Name',
                  value: pharmacyName,
                  onPressed: _changePharmacyName,
                ),
                buildProfileAction(
                  icon: Icons.phone,
                  label: 'Phone Number',
                  value: phoneNumber,
                  onPressed: _changePhoneNumber,
                ),
                buildProfileAction(
                  icon: Icons.email,
                  label: 'Email',
                  value: email,
                  onPressed: _changeEmail,
                ),
                buildProfileAction(
                  icon: Icons.location_on,
                  label: 'Address',
                  value: address,
                  onPressed: _changeAddress,
                ),
                buildProfileAction(
                  icon: Icons.delivery_dining,
                  label: 'Delivery Time',
                  value: deliveryTime,
                  onPressed: _changeDeliveryTime,
                ),
                buildToggleAction(
                  icon: Icons.delivery_dining,
                  label: 'Delivery Service',
                  value: deliveryAvailable,
                  onPressed: _toggleDelivery,
                ),
                buildProfileAction(
                  icon: Icons.info_outline,
                  label: 'About App',
                  value: '',
                  onPressed: () {
                    showAboutDialog(
                      context: context,
                      applicationName: 'Booking App',
                      applicationVersion: '1.0.0',
                      applicationLegalese: '© 2024 Booking App',
                    );
                  },
                ),
                buildProfileAction(
                  icon: Icons.logout,
                  label: 'Logout',
                  value: '',
                  color: Colors.red,
                  onPressed: () =>
                      Navigator.of(context).popUntil((route) => route.isFirst),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
