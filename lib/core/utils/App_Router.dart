import 'package:booking_app/custom/widgets/navbar_roots.dart';
import 'package:booking_app/features/authentication/presentation/views/ForgotPasswordView.dart';
import 'package:booking_app/views/HomeView.dart';
import 'package:booking_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:booking_app/views/Profile_View.dart';
import 'package:booking_app/features/authentication/presentation/views/SignUp.dart';
import 'package:booking_app/features/authentication/presentation/views/loginView.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kLoginView = '/LoginView';
  static const String kSignUpView = '/SignUpView';
  static const String kForgetPasswordView = '/ForgetPasswordView';
  static const String kHomeView = '/HomeView';
  static const String kProfileView = '/ProfileView';
  static const String kNavBarRoots = '/NavBarRoots';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => HomeView(),
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
        path: kNavBarRoots, builder: (context, state) => const NavBarRoots())
  ]);
}
