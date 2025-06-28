import 'package:booking_app/constants.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);
  static String routeName = "ProfileView";

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = "Mohamed Saqr";
  String userImage = 'assets/images/1748632292669.jpg';

  void _changeName() async {
    final controller = TextEditingController(text: userName);
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter new name'),
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
      setState(() => userName = result.trim());
    }
  }

  void _changePassword() async {
    final oldPassController = TextEditingController();
    final newPassController = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: oldPassController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Old Password'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: newPassController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'New Password'),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Save')),
        ],
      ),
    );
  }

  void _changePhoto() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Change photo tapped (implement picker)')),
    );
  }

  Widget buildProfileAction({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    Color? color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
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
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onPressed,
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
                CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  radius: 57,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage(userImage),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(height: 32),

                // Profile Options
                buildProfileAction(
                  icon: Icons.photo_camera,
                  label: 'Change Photo',
                  onPressed: _changePhoto,
                ),
                buildProfileAction(
                  icon: Icons.edit,
                  label: 'Change Name',
                  onPressed: _changeName,
                ),
                buildProfileAction(
                  icon: Icons.lock,
                  label: 'Change Password',
                  onPressed: _changePassword,
                ),
                buildProfileAction(
                  icon: Icons.info_outline,
                  label: 'About Us',
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
                  label: 'Log Out',
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
