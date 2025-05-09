import '../data_model/order_confirmation_model.dart';
import '../data_model/order_model.dart';
import 'base_response/base_response.dart';

class OrderConfirmationResponse extends BaseResponse {
  final OrderConfirmation? order;

  OrderConfirmationResponse(bool success, {String? message, this.order})
      : super(success, message: message);

  factory OrderConfirmationResponse.fromJson(Map<String, dynamic> json) {
    return OrderConfirmationResponse(
      json['success'] ?? true,
      message: json['message'] ?? 'Success',
      order: json['order'] != null
          ? OrderConfirmation.fromJson(json['order'])
          : null,
    );
  }
}
