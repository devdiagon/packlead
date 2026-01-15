import 'package:flutter/material.dart';
import 'package:packlead/core/constants/user_roles.dart';
import 'package:packlead/services/mock_services/mock_auth_service.dart';
import 'package:packlead/navigation/routers/admin_router.dart';
import 'package:packlead/navigation/routers/dispatcher_router.dart';
import 'package:packlead/navigation/routers/auth_router.dart';

class AppRouter {
  static String get initialRoute {
    final role = MockAuthService.currentRole;

    return switch(role) {
      UserRole.admin => AdminRouter.initialRoute,
      UserRole.dispatcher => DispatcherRouter.initialRoute,
      UserRole.none => AuthRouter.initialRoute,
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final role = MockAuthService.currentRole;

    Route<dynamic>? route;

    if (role == UserRole.admin) {
      route = AdminRouter.generateRoute(settings);
    }

    if (role == UserRole.dispatcher) {
      route = DispatcherRouter.generateRoute(settings);
    }

    return route ?? AuthRouter.generateRoute(settings);
  }
}