// Create a file for the order model
class Order {
  final String name;
  final String location;
  final String wasteType;
  final String wasteWeight;
  final String phoneNumber;

  Order({
    required this.name,
    required this.location,
    required this.wasteType,
    required this.wasteWeight,
    required this.phoneNumber,
  });
}

// Global list to store orders
List<Order> orderList = [];
