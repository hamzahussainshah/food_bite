class OrderItem {
  String menuItem;
  int quantity;
  int price;
  String id;

  OrderItem({
    required this.menuItem,
    required this.quantity,
    required this.price,
    required this.id,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      menuItem: json['menuItem'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: json['price'] ?? 0,
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuItem': menuItem,
      'quantity': quantity,
      'price': price,
      '_id': id,
    };
  }
}
