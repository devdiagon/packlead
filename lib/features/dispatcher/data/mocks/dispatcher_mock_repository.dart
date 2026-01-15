
import 'package:packlead/core/models/dispatcher.dart';
import 'package:packlead/features/dispatcher/data/mocks/dispatcher_mock_data.dart';

class DispatcherMockRepository {
  List<Dispatcher> getAllDispatchers() {
    return DispatcherMockData.dispatchers;
  }
}