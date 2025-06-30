import 'package:booking_app/features/pharmacist/presentation/views/pharmacist_home_view.dart';
import 'package:booking_app/features/pharmacist/presentation/views/pharmacist_profile_view.dart';
import 'package:booking_app/features/pharmacist/presentation/views/pharmcist_navbar.dart';
import 'package:go_router/go_router.dart';

abstract class PharmacyRouter {
  static const String kPharmacistHomeView = '/PharmacistHomeView';
  static const String kPharmacistNavBar = '/PharmacistNavBar';
  static const String kPharmacistProfileView = '/PharmacistProfileView';

  static final List<GoRoute> routes = [
    GoRoute(
      path: kPharmacistHomeView,
      builder: (context, state) => const PharmacyHomeView(),
    ),
    GoRoute(
      path: kPharmacistNavBar,
      builder: (context, state) => const PharmcyNavbar(),
    ),
    GoRoute(
      path: kPharmacistProfileView,
      builder: (context, state) => const PharmacistProfileView(),
    ),
  ];
}
