import 'package:flutter/material.dart';

import '../Screens/Login_Screen.dart';
import '../Screens/email_verification_screen.dart';
import '../Screens/home_screen.dart';
import '../Screens/intro_screen.dart';
import './route_constants.dart';

class Router {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case emailVerificationRoute:
        return MaterialPageRoute(builder: (_) => EmailVerificationScreen());

      case introductionRoute:
        return MaterialPageRoute(builder: (_) => Introduction());

      case homeRoute:
        final args = settings.arguments as bool;
        if (args != null) {
          return MaterialPageRoute(
            builder: (context) => HomeScreen(
              isFacebookSignIn: args,
            ),
          );
        }
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
