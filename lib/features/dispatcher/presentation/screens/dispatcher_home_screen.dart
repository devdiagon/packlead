import 'package:flutter/material.dart';
import 'package:packlead/navigation/routers/auth_router.dart';
import 'package:packlead/services/mock_services/mock_auth_service.dart';


class DispatcherHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio de Repartidor')),
      body: Center(child: Text('Bienvenido Repartidor')),
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