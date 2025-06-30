import 'package:booking_app/features/authentication/presentation/views/ForgotPasswordView.dart';
import 'package:booking_app/features/authentication/presentation/views/SignUp.dart';
import 'package:booking_app/features/authentication/presentation/views/loginView.dart';
import 'package:go_router/go_router.dart';

abstract class AuthRouter {
  static const String kLoginView = '/LoginView';
  static const String kSignUpView = '/SignUpView';
  static const String kForgetPasswordView = '/ForgetPasswordView';

  static final List<GoRoute> routes = [
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kSignUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: kForgetPasswordView,
      builder: (context, state) => const ForgetPasswordView(),
    ),
  ];
}
