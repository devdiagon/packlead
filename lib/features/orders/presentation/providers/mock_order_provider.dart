import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:packlead/core/models/order.dart';
import 'package:packlead/features/orders/data/mocks/order_mock_data.dart';

final mockOrdersProvider = Provider<List<Order>>((ref) {
  return OrderMockData.orders;
});

final mockOrdersByStateProvider = Provider.family<List<Order>, String>((ref, state) {
  return OrderMockData.orders
      .where((order) => order.state == state)
      .toList();
});

final mockOrderStatsProvider = Provider<Map<String, int>>((ref) {
  final orders = ref.watch(mockOrdersProvider);
  final stats = <String, int>{};

  for (var order in orders) {
    stats.update(
      order.state,
          (value) => value + 1,
      ifAbsent: () => 1,
    );
  }

  return stats;
});