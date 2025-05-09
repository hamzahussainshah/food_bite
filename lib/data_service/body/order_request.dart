import 'address_model.dart';
import 'order_request_item.dart';

class OrderRequest {
  List<OrderRequestItem> items;
  String deliveryType;
  Address deliveryAddress;

  OrderRequest({
    required this.items,
    required this.deliveryType,
    required this.deliveryAddress,
  });

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'deliveryType': deliveryType,
      'deliveryAddress': deliveryAddress.toJson(),
    };
  }
}
