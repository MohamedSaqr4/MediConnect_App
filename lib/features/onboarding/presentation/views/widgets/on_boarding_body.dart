import 'package:booking_app/constants.dart';
import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/features/onboarding/presentation/views/widgets/custom_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});
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
      onFinish: () {
        GoRouter.of(context).push(AppRouter.kLoginView);
      },
      skipTextButton: const Text('Skip'),
      background: [
        Image.asset('assets/images/Medical prescription-bro.png',
            height: height * 0.5, width: width),
        Image.asset('assets/images/Cardiologist-bro.png',
            height: height * 0.5, width: width),
        Image.asset('assets/images/Online Doctor-amico.png',
            height: height * 0.5, width: width),
      ],
      totalPage: 3,
      speed: 1.5,
      pageBodies: [
        CustomPageBody(
            height: height,
            title:
                'Welcome to MediConnect App \nlet’s book your appointment today'),
        CustomPageBody(
          height: height,
          title:
              'Easily book doctor appointments and manage your health schedule',
        ),
        CustomPageBody(
            height: height,
            title:
                ' Connect with top doctors and specialists at your convenience'),
      ],
    );
  }
}
