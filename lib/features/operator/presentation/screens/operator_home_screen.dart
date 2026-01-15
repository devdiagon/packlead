import 'package:flutter/material.dart';
import 'package:packlead/navigation/routers/auth_router.dart';
import 'package:packlead/services/mock_services/mock_auth_service.dart';


class OperatorDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Panel de Operador')),
      body: Center(child: Text('Bienvenido Operador')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MockAuthService.logout();
          Navigator.pushReplacementNamed(context, AuthRouter.login);
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}