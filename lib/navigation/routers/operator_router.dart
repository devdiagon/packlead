import 'package:flutter/material.dart';
import 'package:packlead/core/widgets/screen_not_found.dart';
import 'package:packlead/features/operator/presentation/screens/operator_home_screen.dart';

class OperatorRouter {
  static const String initialRoute = '/operator/home';
  static const String home = '/operator/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => OperatorDashboardScreen());
      default:
        return MaterialPageRoute(builder: (_) => ScreenNotFound());
    }
  }
}