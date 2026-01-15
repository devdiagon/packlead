import 'package:flutter/material.dart';
import 'package:packlead/core/constants/user_roles.dart';
import 'package:packlead/services/mock_services/mock_auth_service.dart';
import 'package:packlead/navigation/routers/admin_router.dart';
import 'package:packlead/navigation/routers/operator_router.dart';
import 'package:packlead/navigation/routers/auth_router.dart';

class AppRouter {
  static String get initialRoute {
    final role = MockAuthService.currentRole;

    return switch(role) {
      UserRole.admin => AdminRouter.initialRoute,
      UserRole.operator => OperatorRouter.initialRoute,
      UserRole.none => AuthRouter.initialRoute,
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final role = MockAuthService.currentRole;

    Route<dynamic>? route;

    if (role == UserRole.admin) {
      route = AdminRouter.generateRoute(settings);
    }

    if (role == UserRole.operator) {
      route = OperatorRouter.generateRoute(settings);
    }

    return route ?? AuthRouter.generateRoute(settings);
  }
}