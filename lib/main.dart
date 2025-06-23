import 'package:booking_app/core/utils/App_Router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MediacalApp());
}

class MediacalApp extends StatelessWidget {
  const MediacalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Booking App',
    );
  }
}
