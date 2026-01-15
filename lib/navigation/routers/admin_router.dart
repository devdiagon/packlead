import 'package:flutter/material.dart';
import 'package:packlead/core/widgets/screen_not_found.dart';
import 'package:packlead/features/admin/presentation/screens/admin_home_screen.dart';

class AdminRouter {
  static const String initialRoute = '/admin/home';
  static const String home = '/admin/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => AdminHomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => ScreenNotFound());
    }
  }
}