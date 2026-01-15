import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:packlead/features/admin/presentation/widgets/dispatcher_item_list.dart';
import 'package:packlead/features/dispatcher/presentation/providers/mock_dispatcher_provider.dart';

class AdminDispatcherScreen extends ConsumerWidget {
  const AdminDispatcherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dispatchers = ref.watch(mockDispatchersProvider);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dispatchers.length,
      itemBuilder: (context, index) {
        return DispatcherItemList(dispatcher: dispatchers[index]);
      },
    );
  }
}