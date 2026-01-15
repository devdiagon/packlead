import 'package:flutter/material.dart';
import 'package:packlead/core/widgets/screen_not_found.dart';
import 'package:packlead/features/admin/presentation/layouts/admin_bottom_nav_layout.dart';

class AdminRouter {
  static const String initialRoute = '/admin/home';
  static const String home = '/admin/home';
  static const String orders = '/admin/orders';
  static const String dispatchers = '/admin/dispatchers';
  static const String map = '/admin/map';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => AdminBottomNavLayout());
      default:
        return MaterialPageRoute(builder: (_) => ScreenNotFound());
    }
  }
}