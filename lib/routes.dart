import 'package:connect_mate/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:connect_mate/screens/testscreen.dart';

abstract class Routes {
  static const String home = '/';
  static const String verifyEmail = '/verifyemail';
  static const String booking = '/booking';
  static const String session = '/Session';
  static const String earning = '/Earning';
  static const String notifications = '/Notifications';
  static const String splash = '/splashScreen';
  static const String welcome = '/welcomeScreen';
  static const String welcomeEmail = '/welcomeScreenEmailPage';
  static const String enterBranchDetails = '/enterBranchDetailsScreen';
  static const String branchManagement = '/branchManagementScreen';
  static const String mainApp = '/mainApp';
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
