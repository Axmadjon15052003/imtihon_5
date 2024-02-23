import 'package:flutter/material.dart';

import '../../features/authentication/presentation/login_screen.dart';
import '../../features/authentication/presentation/pages/sign_up_page/sign_up.dart';
import '../pages/error.dart';
import '../pages/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(), //TODO
        );
      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case "/SignUp":
        return MaterialPageRoute(builder: (context) => const SignUp());
      default:
        return MaterialPageRoute(
          builder: (context) => const Error(),
        );
    }
  }
}