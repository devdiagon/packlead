import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:packlead/features/admin/presentation/screens/order_add_form_screen.dart';
import 'package:packlead/features/admin/presentation/widgets/order_item_list.dart';
import 'package:packlead/features/orders/presentation/providers/mock_order_provider.dart';

class AdminOrderScreen extends ConsumerWidget {
  const AdminOrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(mockOrdersProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderAddFormScreen(),
                  ),
                );
              },
              icon: Icon(Icons.add),
              label: const Text('Agregar pedido'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return OrderItemList(order: orders[index]);
            },
          ),
        ),
      ],
    );
  }
}
