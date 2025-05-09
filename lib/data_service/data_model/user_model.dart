class UserModel {
  String id;
  String firstName;
  String email;
  String? phoneNumber;

  UserModel({
    required this.id,
    required this.firstName,
    required this.email,
    this.phoneNumber,
  });

  UserModel copyWith({
    String? id,
    String? firstName,
    String? email,
    String? phoneNumber,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': firstName,
      'email': email,
      'phone': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] ?? "",
      firstName: map['name'] ?? "",
      email: map['email'] ?? "",
      phoneNumber: map['phone'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => toMap();
}
