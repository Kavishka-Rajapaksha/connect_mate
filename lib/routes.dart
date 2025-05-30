import 'package:connect_mate/screens/sign_up_page.dart';
import 'package:connect_mate/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:connect_mate/screens/testscreen.dart';

abstract class Routes {
  static const String home = '/';
  static const String testScreen = '/testScreen';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return _createRoute(const SignInPage());

      default:
        // If no matching route is found, go to SplashScreen
        return _createRoute(const SignInPage());
    }
  }

  /// Simple helper to wrap any widget in a MaterialPageRoute.
  static Route<dynamic> _createRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
