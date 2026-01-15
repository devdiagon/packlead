import 'package:flutter/material.dart';
import 'package:packlead/core/widgets/screen_not_found.dart';
import 'package:packlead/features/auth/presentation/screens/login_screen.dart';

class AuthRouter {
  static const String initialRoute = '/login';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => ScreenNotFound());
    }
  }
}