import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OnboardingTitles extends StatelessWidget {
  const OnboardingTitles({
    super.key,
    required this.height,
    required this.title,
  });

  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.55,
          ),
          Text(title,
              textAlign: TextAlign.center, style: Styles.onBoardingStyle),
        ],
      ),
    );
  }
}
