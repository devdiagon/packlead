import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:packlead/features/admin/presentation/screens/dispatcher_add_form_screen.dart';
import 'package:packlead/features/admin/presentation/widgets/dispatcher_item_list.dart';
import 'package:packlead/features/dispatcher/presentation/providers/mock_dispatcher_provider.dart';

class AdminDispatcherScreen extends ConsumerWidget {
  const AdminDispatcherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dispatchers = ref.watch(mockDispatchersProvider);

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
                    builder: (context) => const DispatcherAddFormScreen(),
                  ),
                );
              },
              icon: Icon(Icons.add),
              label: const Text('Agregar repartidor'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: dispatchers.length,
            itemBuilder: (context, index) {
              return DispatcherItemList(dispatcher: dispatchers[index]);
            },
          ),
        ),
      ],
    );
  }
}