import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:packlead/core/constants/order_state.dart';
import 'package:packlead/core/models/location.dart';
import 'package:packlead/core/models/order.dart';
import 'package:packlead/features/dispatcher/presentation/providers/dispatcher_home_provider.dart';
import 'package:packlead/features/orders/data/repositories/order_repository.dart';
import 'package:packlead/features/orders/presentation/providers/orders_provider.dart';

class MockOrderRepository extends Mock implements OrderRepository {}

void main() {
  group('DispatcherHomeNotifier - Unit Tests (AAA)', () {
    late MockOrderRepository mockOrderRepository;
    late ProviderContainer container;

    final shippedOrder = Order(
      id: 'ORD-1',
      dispatcherId: 'disp-1',
      clientName: 'Carlos',
      clientPhoneNumber: '0999999999',
      location: Location(lat: -0.18, lng: -78.48),
      address: 'Centro',
      state: OrderState.shipped,
      zone: 'Zona 1',
      deliveryDate: DateTime(2026, 2, 10),
      createdAt: DateTime(2026, 2, 1),
    );

    setUp(() {
      mockOrderRepository = MockOrderRepository();
      container = ProviderContainer(
        overrides: [
          orderRepositoryProvider.overrideWithValue(mockOrderRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test(
      'loadTodayOrders debe producir estado data con lista vacía cuando el dispatcher no tiene pedidos',
      () async {
        // ================= ARRANGE =================
        when(
          () => mockOrderRepository.getOrdersByDispatcher(any(), any()),
        ).thenAnswer((_) async => <Order>[]);

        final notifier = container.read(dispatcherHomeProvider.notifier);

        // ================= ACT =================
        await notifier.loadTodayOrders('disp-1');
        final state = container.read(dispatcherHomeProvider);

        // ================= ASSERT =================
        expect(state, isA<AsyncData<dynamic>>());
        expect(state.value!.todayOrders, isEmpty);
        expect(state.value!.activeShippedOrder, isNull);
        expect(state.value!.selectedOrder, isNull);
      },
    );

    test(
      'loadTodayOrders debe detectar la orden shipped activa cuando existe',
      () async {
        // ================= ARRANGE =================
        when(
          () => mockOrderRepository.getOrdersByDispatcher(any(), any()),
        ).thenAnswer((_) async => [shippedOrder]);

        final notifier = container.read(dispatcherHomeProvider.notifier);

        // ================= ACT =================
        await notifier.loadTodayOrders('disp-1');
        final state = container.read(dispatcherHomeProvider);

        // ================= ASSERT =================
        expect(state.value!.activeShippedOrder?.id, shippedOrder.id);
        expect(state.value!.selectedOrder?.id, shippedOrder.id);
      },
    );

    test(
      'loadTodayOrders debe producir estado error cuando el repositorio falla',
      () async {
        // ================= ARRANGE =================
        when(
          () => mockOrderRepository.getOrdersByDispatcher(any(), any()),
        ).thenThrow(Exception('Error de prueba'));

        final notifier = container.read(dispatcherHomeProvider.notifier);

        // ================= ACT =================
        await notifier.loadTodayOrders('disp-1');
        final state = container.read(dispatcherHomeProvider);

        // ================= ASSERT =================
        expect(state, isA<AsyncError<dynamic>>());
      },
    );
  });
}
