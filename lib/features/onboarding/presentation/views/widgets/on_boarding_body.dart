import 'package:booking_app/constants.dart';
import 'package:booking_app/features/authentication/presentation/auth_router.dart';
import 'package:booking_app/features/onboarding/presentation/views/widgets/on_boarding_titles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return OnBoardingSlider(
      headerBackgroundColor: Colors.transparent,
      controllerColor: kPrimaryColor,
      finishButtonText: 'Let\'s Start',
      finishButtonStyle: FinishButtonStyle(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: kPrimaryColor,
      ),
      onFinish: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('hasSeenOnBoarding', true);
        context.pushReplacement(AuthRouter.kLoginView);
      },
      skipTextButton: const Text('Skip'),
      background: [
        Image.asset('assets/images/onboarding1.png',
            height: height * 0.5, width: width),
        Image.asset('assets/images/onboarding2.png',
            height: height * 0.5, width: width),
        Image.asset('assets/images/onboarding3.png',
            height: height * 0.5, width: width),
      ],
      totalPage: 3,
      speed: 1.5,
      pageBodies: [
        OnboardingTitles(
            height: height,
            title:
                'Welcome to MediConnect App \nlet’s book your appointment today'),
        OnboardingTitles(
          height: height,
          title:
              'Easily book doctor appointments and manage your health schedule',
        ),
        OnboardingTitles(
            height: height,
            title:
                ' Connect with top doctors and specialists at your convenience'),
      ],
    );
  }
}
