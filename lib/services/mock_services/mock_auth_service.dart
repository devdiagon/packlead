import 'package:packlead/core/constants/user_roles.dart';

class MockAuthService {
  static UserRole currentRole = UserRole.none;

  static void loginAsAdmin() => currentRole = UserRole.admin;
  static void loginAsOperator() => currentRole = UserRole.dispatcher;
  static void logout() => currentRole = UserRole.none;
}