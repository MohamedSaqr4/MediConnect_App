import 'package:booking_app/constants.dart';
import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/core/utils/widgets/HeaderSection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  static String routeName = "ProfileView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
                flex: 1,
                child: HeaderSection(
                    title: 'Profile',
                    subtitle: 'Manage Your Account Settings ')),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.only(
                    top: 30.0, left: 24.0, right: 24.0, bottom: 24.0),
                child: Column(
                  children: [
                    // Profile Info
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/1748632292669.jpg'),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mohamed Saqr",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            buildSettingsTile(
                              icon: FontAwesomeIcons.user,
                              text: "Profile",
                              onTap: () {},
                            ),
                            buildSettingsTile(
                              icon: FontAwesomeIcons.bell,
                              text: "Notifications",
                              onTap: () {},
                            ),
                            buildSettingsTile(
                              icon: FontAwesomeIcons.shieldHalved,
                              text: "Privacy",
                              onTap: () {},
                            ),
                            buildSettingsTile(
                              icon: FontAwesomeIcons.cogs,
                              text: "General",
                              onTap: () {},
                            ),
                            buildSettingsTile(
                              icon: FontAwesomeIcons.infoCircle,
                              text: "About Us",
                              onTap: () {},
                            ),
                            const Divider(),
                            buildSettingsTile(
                              icon: FontAwesomeIcons.signOutAlt,
                              text: "Log Out",
                              iconColor: Colors.red,
                              onTap: () {
                                GoRouter.of(context).push(AppRouter.kLoginView);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsTile({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color iconColor = kPrimaryColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
