class OrderRequestItem {
  String menuItem;
  int quantity;

  OrderRequestItem({
    required this.menuItem,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'menuItem': menuItem,
      'quantity': quantity,
    };
  }
}
