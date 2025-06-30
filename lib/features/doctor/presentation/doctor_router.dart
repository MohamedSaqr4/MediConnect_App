import 'package:booking_app/features/doctor/presentation/views/doctor_appointment_view.dart';
import 'package:booking_app/features/doctor/presentation/views/doctor_chat_view.dart';
import 'package:booking_app/features/doctor/presentation/views/doctor_home_view.dart';
import 'package:booking_app/features/doctor/presentation/views/doctor_navbar.dart';
import 'package:booking_app/features/doctor/presentation/views/doctor_profile_view.dart';
import 'package:go_router/go_router.dart';

abstract class DoctorRouter {
  static const String kDoctorHomeView = '/DoctorHomeView';
  static const String kDoctorNavBar = '/DoctorNavBar';
  static const String kDoctorProfileView = '/DoctorProfileView';
  static const String kDoctorAppointmentView = '/DoctorAppointmentView';
  static const String kDoctorChatView = '/DoctorChatView';

  static final List<GoRoute> routes = [
    GoRoute(
      path: kDoctorHomeView,
      builder: (context, state) => const DoctorHomeView(),
    ),
    GoRoute(
      path: kDoctorNavBar,
      builder: (context, state) => const DoctorNavBar(),
    ),
    GoRoute(
      path: kDoctorProfileView,
      builder: (context, state) => DoctorProfileView(),
    ),
    GoRoute(
      path: kDoctorAppointmentView,
      builder: (context, state) => DoctorAppointmentView(),
    ),
    GoRoute(
      path: kDoctorChatView,
      builder: (context, state) => const DoctorChatView(
        nurseName: 'Sara Ahmed',
        nurseImage: 'assets/images/Doctor2.png',
      ),
    ),
  ];
}
