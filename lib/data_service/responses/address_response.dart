import 'package:food_bite/data_service/body/address_model.dart';

import './base_response/base_response.dart';

class AddressResponse extends BaseResponse {
  List<Address> addresses;

  AddressResponse(bool success, {String? message, List<Address>? addresses})
      : addresses = addresses ?? [], // Default to empty list if null
        super(success, message: message);

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      json['success'] ?? true,
      message: json['message'] ?? 'Success',
      addresses: json['addresses'] != null
          ? (json['addresses'] as List<dynamic>)
              .map((addressJson) =>
                  Address.fromJson(addressJson as Map<String, dynamic>))
              .toList()
          : [],
    );
  }
}
