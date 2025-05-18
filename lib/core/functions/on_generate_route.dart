import 'package:flutter/material.dart';
import 'package:graph/features/auth/presentation/views/login_view.dart';
import 'package:graph/features/auth/presentation/views/sign_up_view.dart';
import 'package:graph/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:graph/features/splash/presentation/views/splash_view.dart';

/// Returns a route based on [settings.name].
///
/// The supported routes are:
///
/// - [SplashView.name]
/// - [OnBoardingView.name]
/// - [LoginView.name]
///
/// If [settings.name] is not recognized, a default route is returned that
/// displays an empty [Scaffold].
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.name:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.name:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.name:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignUpView.name:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
