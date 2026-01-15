import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:packlead/core/models/dispatcher.dart';
import 'package:packlead/features/dispatcher/data/mocks/dispatcher_mock_data.dart';

final mockDispatchersProvider = Provider<List<Dispatcher>>((ref) {
  return DispatcherMockData.dispatchers;
});

final mockDispatchersByStateProvider = Provider.family<List<Dispatcher>, String>(
      (ref, state) {
    return DispatcherMockData.dispatchers
        .where((dispatcher) => dispatcher.state == state)
        .toList();
  },
);