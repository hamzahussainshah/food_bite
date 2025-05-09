class LoginBody {
  String? email;
  String? password;
  // String? fcm;

  LoginBody({
    this.email,
    this.password,
    // this.fcm,
  });

  toJson() => {
    'email': email,
    'password': password,
    // 'fcm': fcm,
  };
}
