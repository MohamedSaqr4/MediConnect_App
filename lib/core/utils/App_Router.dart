import 'package:booking_app/features/authentication/presentation/auth_router.dart';
import 'package:booking_app/features/doctor/presentation/doctor_router.dart';
import 'package:booking_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:booking_app/features/patient/presentation/patient_router.dart';
import 'package:booking_app/features/pharmacist/presentation/pharmcy_router.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter getRouter(bool showOnBoarding) {
    return GoRouter(
      initialLocation: showOnBoarding ? '/' : AuthRouter.kLoginView,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const OnBoardingView(),
        ),
        ...AuthRouter.routes,
        ...DoctorRouter.routes,
        ...PatientRouter.routes,
        ...PharmacyRouter.routes,
      ],
    );
  }
}
