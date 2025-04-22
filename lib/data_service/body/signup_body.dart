import 'address_model.dart';

class SignUpBody {
  String name;
  String email;
  String password;
  String phone;
  List<Address> addresses;
  String role;

  SignUpBody({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.addresses,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'addresses': addresses.map((address) => address.toJson()).toList(),
      'role': role,
    };
  }

  factory SignUpBody.fromJson(Map<String, dynamic> json) {
    return SignUpBody(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone'] ?? '',
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((address) => Address.fromJson(address))
              .toList() ??
          [],
      role: json['role'] ?? '',
    );
  }
}
