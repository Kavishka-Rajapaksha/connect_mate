import 'package:connect_mate/screens/history_screen.dart';
import 'package:connect_mate/screens/show_qr_screen.dart';
import 'package:connect_mate/screens/sign_up_page.dart';
import 'package:connect_mate/screens/signin_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const String home = '/signIn';
  static const String signUp = '/signUp';
  static const String history = '/history';
  static const String showQR = '/showQR';
  static const String scanQR = '/scanQR';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return _createRoute(const SignInPage());
      case Routes.signUp:
        return _createRoute(const SignUpPage());
      case Routes.showQR:
        return _createRoute(const ShowQRScreen());
      case Routes.history:
        return _createRoute(const HistoryScreen());
      case Routes.scanQR:
        return _createRoute(
          const Scaffold(body: Center(child: Text('Scan QR Screen'))),
        );

      default:
        return _createRoute(const ShowQRScreen());
    }
  }

  static Route<dynamic> _createRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
