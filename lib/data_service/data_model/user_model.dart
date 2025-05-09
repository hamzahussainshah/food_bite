class UserModel {
  String id;

  String firstName;

  String email;

  UserModel(
      {required this.id,
        required this.firstName,
        required this.email,
      });

  // CopyWith method for cloning the object with new values
  UserModel copyWith({
    String? id,
    String? phone,
    String? firstName,
    String? surname,
    String? email,
    String? dateOfBirth,
    String? gender,
    String? photo,
    String? country,
    String? fcm,
    String? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
    );
  }

  // Convert to a map, excluding photo as it will be sent as a File
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? "",
      firstName: map['firstName'] ?? "",
      email: map['email'] ?? "",
    );
  }
  Map<String, dynamic> toJson() => toMap();
}
