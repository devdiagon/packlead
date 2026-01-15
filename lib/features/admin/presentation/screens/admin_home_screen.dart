import 'package:flutter/material.dart';
import 'package:packlead/navigation/routers/auth_router.dart';
import 'package:packlead/services/mock_services/mock_auth_service.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Panel de Administrador')),
      body: Center(child: Text('Bienvenido Admin')),
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