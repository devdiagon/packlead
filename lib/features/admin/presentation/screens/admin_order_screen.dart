import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:packlead/features/admin/presentation/widgets/order_item_list.dart';
import 'package:packlead/features/orders/presentation/providers/mock_order_provider.dart';

class AdminOrderScreen extends ConsumerWidget {
  const AdminOrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(mockOrdersProvider);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderItemList(order: orders[index]);
      },
    );
  }
}
