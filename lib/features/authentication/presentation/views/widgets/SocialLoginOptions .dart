import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginOptions extends StatelessWidget {
  const SocialLoginOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Continue with social',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logging in with Facebook...'),
                  ),
                );
              },
              child: const CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xFF3B5998),
                child: Icon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 24),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logging in with Google...'),
                  ),
                );
              },
              child: const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  'assets/images/IOS_Google_icon.png',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
