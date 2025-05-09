import '../body/address_model.dart';
import 'menu_model.dart';
import 'order_item.dart';

class Order {
  String user;
  List<OrderItem> items; // Updated to List<OrderItem>
  int totalAmount;
  String paymentStatus;
  String orderStatus;
  String deliveryType;
  Address deliveryAddress;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? deliveryPerson;

  Order({
    required this.user,
    required this.items,
    required this.totalAmount,
    required this.paymentStatus,
    required this.orderStatus,
    required this.deliveryType,
    required this.deliveryAddress,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.deliveryPerson,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      user: json['user'] ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((item) => OrderItem.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      totalAmount: json['totalAmount'] ?? 0,
      paymentStatus: json['paymentStatus'] ?? '',
      orderStatus: json['orderStatus'] ?? '',
      deliveryType: json['deliveryType'] ?? '',
      deliveryAddress: Address.fromJson(json['deliveryAddress'] ?? {}),
      id: json['_id'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      v: json['__v'] ?? 0,
      deliveryPerson: json['deliveryPerson'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'items': items.map((item) => item.toJson()).toList(),
      'totalAmount': totalAmount,
      'paymentStatus': paymentStatus,
      'orderStatus': orderStatus,
      'deliveryType': deliveryType,
      'deliveryAddress': deliveryAddress.toJson(),
      '_id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
      'deliveryPerson': deliveryPerson,
    };
  }
}
