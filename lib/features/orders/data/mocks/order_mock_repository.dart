import 'package:packlead/core/models/order.dart';
import 'package:packlead/features/orders/data/mocks/order_mock_data.dart';

class OrderMockRepository {
  List<Order> getAllOrders() {
    return OrderMockData.orders;
  }

  List<Order> getOrdersByState(String state) {
    return OrderMockData.orders
        .where((order) => order.state == state)
        .toList();
  }

  Stream<List<Order>> getOrdersStream() {
    return Stream.periodic(
      const Duration(seconds: 5),
          (count) => OrderMockData.getOrdersWithUpdates(count),
    );
  }
}