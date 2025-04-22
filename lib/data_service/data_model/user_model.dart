class UserModel {
  String id;
  String firstName;
  String email;

  UserModel({
    required this.id,
    required this.firstName,
    required this.email,
  });

  UserModel copyWith({
    String? id,
    String? firstName,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': firstName,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? "",
      firstName: map['name'] ?? "",
      email: map['email'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => toMap();
}
