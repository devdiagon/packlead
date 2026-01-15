import 'package:packlead/core/models/location.dart';

class Order {
  final String id;
  final String dispatcherId;
  final String client;
  final String phoneNumber;
  final Location location;
  final String state;
  final String zone;
  final String dispatcherName;

  Order({
    required this.id,
    required this.dispatcherId,
    required this.client,
    required this.phoneNumber,
    required this.location,
    required this.state,
    required this.zone,
    required this.dispatcherName,
  });
}