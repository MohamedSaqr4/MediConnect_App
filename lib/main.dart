import 'package:booking_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final hasSeenOnBoarding = prefs.getBool('hasSeenOnBoarding') ?? false;

//show on boarding view if user has not seen it
  runApp(MediConnect(
    showOnBoarding: !hasSeenOnBoarding,
  ));
}

class MediConnect extends StatelessWidget {
  const MediConnect({super.key, required this.showOnBoarding});
  final bool showOnBoarding;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.getRouter(showOnBoarding),
      debugShowCheckedModeBanner: false,
      title: 'MediConnect App',
    );
  }
}
