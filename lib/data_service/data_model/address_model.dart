class Address {
  String? action;
  String street;
  String city;
  String postalCode;
  String country;
  String? id;

  Address({
    this.id,
    this.action,
    required this.street,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['_id'] ?? '',
      action: json['action'] ?? '',
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      postalCode: json['postalCode'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'action': action,
      'street': street,
      'city': city,
      'postalCode': postalCode,
      'country': country,
    };
  }
}
