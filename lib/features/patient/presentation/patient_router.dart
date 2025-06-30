import 'package:booking_app/features/patient/domain/models/doctor.dart';
import 'package:booking_app/features/patient/presentation/views/ChatView.dart';
import 'package:booking_app/features/patient/presentation/views/DoctorDetailsView.dart';
import 'package:booking_app/features/patient/presentation/views/Profile_View.dart';
import 'package:booking_app/features/patient/presentation/views/ScheduleView.dart';
import 'package:booking_app/features/patient/presentation/views/ai_chat_boot.dart';
import 'package:booking_app/features/patient/presentation/views/doctor_search_view.dart';
import 'package:booking_app/features/patient/presentation/views/make_order_view.dart';
import 'package:booking_app/features/patient/presentation/views/patient_home_view.dart';
import 'package:booking_app/features/patient/presentation/views/patient_navbar.dart';
import 'package:booking_app/features/patient/presentation/views/payment_view.dart';
import 'package:booking_app/features/patient/presentation/views/pharmacy_search_view.dart';
import 'package:go_router/go_router.dart';

abstract class PatientRouter {
  static const String kPatientHomeView = '/PatientHomeView';
  static const String kPatientNavBar = '/PatientNavBar';
  static const String kPatientProfileView = '/PatientProfileView';
  static const String kDoctorSearchView = '/DoctorSearchView';
  static const String kDoctorDetailsView = '/DoctorDetailsView';
  static const String kScheduleView = '/ScheduleView';
  static const String kPaymentView = '/PaymentView';
  static const String kChatView = '/ChatView';
  static const String kAiChatBoot = '/AiChatBoot';
  static const String kPharmacySearchView = '/PharmacySearchView';
  static const String kMakeOrderView = '/MakeOrderView';

  static final List<GoRoute> routes = [
    GoRoute(
      path: kPatientHomeView,
      builder: (context, state) => const PatientHomeView(),
    ),
    GoRoute(
      path: kPatientNavBar,
      builder: (context, state) => const PatientNavBar(),
    ),
    GoRoute(
      path: kPatientProfileView,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: kDoctorSearchView,
      builder: (context, state) => const DoctorSearchView(),
    ),
    GoRoute(
      path: kDoctorDetailsView,
      builder: (context, state) => const DoctorDetailsView(
        doctor: {
          'name': 'Dr. Ahmed Ali',
          'specialization': 'Cardiologist',
          'about': 'Experienced cardiologist with 15 years of practice',
          'rating': 4.9,
        },
      ),
    ),
    GoRoute(
      path: kScheduleView,
      builder: (context, state) => ScheduleView(),
    ),
    GoRoute(
      path: kPaymentView,
      builder: (context, state) => PaymentView(
        doctor: Doctor(
          id: '1',
          name: 'Dr. Ahmed Ali',
          specialization: 'Cardiologist',
          about: 'Experienced cardiologist',
          image: 'assets/images/Doctor2.png',
          location: 'Cairo',
          consultationFee: '200 EGP',
          availableTimes: [
            AvailableTime(day: 'Monday', startTime: '09:00', endTime: '17:00'),
          ],
        ),
        selectedTime:
            AvailableTime(day: 'Monday', startTime: '10:00', endTime: '10:30'),
        bookingType: 'Online',
      ),
    ),
    GoRoute(
      path: kChatView,
      builder: (context, state) => const ChatView(
        isDoctorChat: true,
        doctor: {
          'name': 'Dr. Ahmed Ali',
          'specialization': 'Cardiologist',
          'image': 'assets/images/Doctor2.png',
        },
      ),
    ),
    GoRoute(
      path: kAiChatBoot,
      builder: (context, state) => const ChatBoot(),
    ),
    GoRoute(
      path: kPharmacySearchView,
      builder: (context, state) => const PharmacySearchView(),
    ),
    GoRoute(
      path: kMakeOrderView,
      builder: (context, state) => const MakeOrderView(
        pharmacyName: 'Nile Pharmacy',
        pharmacyImage: 'assets/images/Doctor2.png',
      ),
    ),
  ];
}
