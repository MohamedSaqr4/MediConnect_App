import 'package:booking_app/features/authentication/presentation/views/ForgotPasswordView.dart';
import 'package:booking_app/features/patient/presentation/views/patient_home_view.dart';
import 'package:booking_app/features/patient/presentation/views/Profile_View.dart';
import 'package:booking_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:booking_app/features/authentication/presentation/views/SignUp.dart';
import 'package:booking_app/features/authentication/presentation/views/loginView.dart';
import 'package:booking_app/features/patient/presentation/views/patient_navbar.dart';
import 'package:booking_app/features/patient/presentation/views/payment_view.dart';
import 'package:booking_app/features/patient/presentation/views/ChatView.dart';
import 'package:booking_app/features/patient/domain/models/doctor.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kLoginView = '/LoginView';
  static const String kSignUpView = '/SignUpView';
  static const String kForgetPasswordView = '/ForgetPasswordView';
  static const String kHomeView = '/HomeView';
  static const String kProfileView = '/ProfileView';
  static const String kPatientNavBar = '/PatientNavBar';
  static const String kPaymentView = '/PaymentView';
  static const String kChatView = '/chat';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => PatientHomeView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kForgetPasswordView,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: kProfileView,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: kSignUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
        path: kPatientNavBar,
        builder: (context, state) => const PatientNavBar()),
    GoRoute(
      path: kPaymentView,
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;
        return PaymentView(
          doctor: args['doctor'] as Doctor,
          selectedTime: args['selectedTime'] as AvailableTime,
          bookingType: args['bookingType'] as String,
        );
      },
    ),
    GoRoute(
      path: kChatView,
      builder: (context, state) {
        try {
          final args = state.extra as Map<String, dynamic>?;
          final doctorData = args?['doctor'] as Map<String, dynamic>?;

          print('Router: Received doctor data: $doctorData');

          return ChatView(
            isDoctorChat: true,
            doctor: doctorData ??
                {
                  'name': 'Doctor',
                  'specialization': 'Specialist',
                  'image': 'assets/images/Doctor2.png',
                },
          );
        } catch (e) {
          print('Router error: $e');
          // Fallback to default chat view
          return const ChatView(
            isDoctorChat: true,
            doctor: {
              'name': 'Doctor',
              'specialization': 'Specialist',
              'image': 'assets/images/Doctor2.png',
            },
          );
        }
      },
    ),
  ]);
}
