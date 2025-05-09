class UpdateAddress {
  String? action;
  String street;
  String city;
  String postalCode;
  String country;
  String? addressId;

  UpdateAddress({
    this.addressId,
    this.action,
    required this.street,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  factory UpdateAddress.fromJson(Map<String, dynamic> json) {
    return UpdateAddress(
      addressId: json['addressId'] ?? '',
      action: json['action'] ?? '',
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      postalCode: json['postalCode'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addressId': addressId,
      'action': action,
      'street': street,
      'city': city,
      'postalCode': postalCode,
      'country': country,
    };
  }
}
