import '../data_model/order_model.dart';
import 'base_response/base_response.dart';

class OrderResponse extends BaseResponse {
  Order? order;

  OrderResponse(bool success, {String? message, this.order})
      : super(success, message: message);

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      json['success'] ?? json['status'] ?? true,
      message: json['message'] ?? 'Success',
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
    );
  }
}
