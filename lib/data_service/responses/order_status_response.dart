import '../data_model/order_model.dart';
import 'base_response/base_response.dart';

class OrderStatusResponse extends BaseResponse {
  List<Order>? orders; // Changed from Order? to List<Order>?

  OrderStatusResponse(bool success, {String? message, this.orders})
      : super(success, message: message);

  factory OrderStatusResponse.fromJson(dynamic json) {
    List<Order>? orders;
    if (json is List) {
      // If the API returns a list directly (e.g., [{...}, {...}])
      orders = json.map((item) => Order.fromJson(item)).toList();
    } else if (json is Map<String, dynamic>) {
      // If the API returns a map with an "orders" or "order" key
      if (json['orders'] != null) {
        orders = (json['orders'] as List)
            .map((item) => Order.fromJson(item))
            .toList();
      } else if (json['order'] != null) {
        orders = [Order.fromJson(json['order'])];
      }
    }
    return OrderStatusResponse(
      json is Map<String, dynamic> ? (json['success'] ?? true) : true,
      message: json is Map<String, dynamic>
          ? (json['message'] ?? 'Success')
          : 'Success',
      orders: orders,
    );
  }
}
