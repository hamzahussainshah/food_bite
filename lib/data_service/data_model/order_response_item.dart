import 'menu_model.dart';

class OrderResponseItem {
  final String? menuItemId; // Changed to String to store the ID
  final int quantity;
  final int price;
  final String id;

  OrderResponseItem({
    required this.menuItemId,
    required this.quantity,
    required this.price,
    required this.id,
  });

  factory OrderResponseItem.fromJson(Map<String, dynamic> json) {
    return OrderResponseItem(
      menuItemId: json['menuItem'] as String?, // Expecting a String ID
      quantity: json['quantity'] as int,
      price: json['price'] as int,
      id: json['_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuItem': menuItemId, // Send the ID as a String
      'quantity': quantity,
      'price': price,
      '_id': id,
    };
  }
}
