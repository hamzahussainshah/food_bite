import 'menu_model.dart';

class OrderItem {
  final MenuItem? menuItem; // Nullable to handle null cases
  final int quantity;
  final int price;
  final String id;

  OrderItem({
    required this.menuItem,
    required this.quantity,
    required this.price,
    required this.id,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      menuItem: json['menuItem'] != null
          ? MenuItem.fromJson(json['menuItem'] as Map<String, dynamic>)
          : null,
      quantity: json['quantity'] as int,
      price: json['price'] as int,
      id: json['_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuItem': menuItem?.toJson(),
      'quantity': quantity,
      'price': price,
      '_id': id,
    };
  }
}
