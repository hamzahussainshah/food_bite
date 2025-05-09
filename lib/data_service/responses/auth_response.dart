import 'package:food_bite/data_service/responses/user_model.dart';

import '../data_model/user_model.dart';
import 'base_response/base_response.dart';

class AuthResponse extends BaseResponse {
  String? accessToken;
  User? profile;

  AuthResponse(bool success, {String? message, this.accessToken})
      : super(success, message: message);

  AuthResponse.fromJson(dynamic json) : super.fromJson(json ?? {}) {
    if (json is Map<String, dynamic>) {
      accessToken = json['token'];
      if (json['user'] != null) {
        profile = User.fromMap(json['user']);
      }
    }
  }
}
