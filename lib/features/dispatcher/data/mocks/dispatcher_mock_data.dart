import 'package:packlead/core/models/dispatcher.dart';

class DispatcherMockData {
  static final List<Dispatcher> dispatchers = [
    Dispatcher(
      id: 'D001',
      name: 'Carlos Méndez',
      email: 'carlos.mendez@ejemplo.com',
      vehicle: 'Toyota Corolla',
      licensePlate: 'ABC-1234',
      state: 'Activo',
    ),
    Dispatcher(
      id: 'D002',
      name: 'Ana Torres',
      email: 'ana.torres@ejemplo.com',
      vehicle: 'Honda Civic',
      licensePlate: 'XYZ-5678',
      state: 'Activo',
    ),
    Dispatcher(
      id: 'D003',
      name: 'Luis Flores',
      email: 'luis.flores@ejemplo.com',
      vehicle: 'Chevrolet Sail',
      licensePlate: 'DEF-9012',
      state: 'Inactivo',
    ),
    Dispatcher(
      id: 'D004',
      name: 'María Sánchez',
      email: 'maria.sanchez@ejemplo.com',
      vehicle: 'Nissan Sentra',
      licensePlate: 'GHI-3456',
      state: 'En ruta',
    ),
    Dispatcher(
      id: 'D005',
      name: 'Pedro Jiménez',
      email: 'pedro.jimenez@ejemplo.com',
      vehicle: 'Mazda 3',
      licensePlate: 'JKL-7890',
      state: 'Activo',
    ),
  ];
}