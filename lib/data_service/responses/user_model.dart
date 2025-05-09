import '../body/address_model.dart';

class User {
  String name;
  String email;
  String phone;
  String password;
  String resetOtp;
  int resetOtpExpireAt;
  bool otpVerified;
  String role;
  List<Address> addresses;
  List<dynamic> favorites;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.resetOtp,
    required this.resetOtpExpireAt,
    required this.otpVerified,
    required this.role,
    required this.addresses,
    required this.favorites,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
      resetOtp: json['resetOtp'] ?? '',
      resetOtpExpireAt: json['resetOtpExpireAt'] ?? 0,
      otpVerified: json['otpVerified'] ?? false,
      role: json['role'] ?? '',
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((address) => Address.fromJson(address))
              .toList() ??
          [],
      favorites: json['favorites'] as List<dynamic>? ?? [],
      id: json['_id'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'resetOtp': resetOtp,
      'resetOtpExpireAt': resetOtpExpireAt,
      'otpVerified': otpVerified,
      'role': role,
      'addresses': addresses.map((address) => address.toJson()).toList(),
      'favorites': favorites,
      '_id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? "",
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      phone: map['phone'] ?? "",
      password: map['password'] ?? "",
      resetOtp: map['resetOtp'] ?? "",
      resetOtpExpireAt: map['resetOtpExpireAt'] ?? 0,
      otpVerified: map['otpVerified'] ?? false,
      role: map['role'] ?? "",
      addresses: (map['addresses'] as List<dynamic>?)
              ?.map((address) => Address.fromJson(address))
              .toList() ??
          [],
      favorites: map['favorites'] as List<dynamic>? ?? [],
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(map['updatedAt'] ?? '') ?? DateTime.now(),
      v: map['__v'] ?? 0,
    );
  }
}
