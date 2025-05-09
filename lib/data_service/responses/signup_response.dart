import 'package:food_bite/data_service/responses/user_model.dart';
import 'base_response/base_response.dart';

class SignupResponse extends BaseResponse {
  String? accessToken;
  User? profile;

  SignupResponse(bool success, {String? message, this.accessToken})
      : super(success, message: message);

  SignupResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json != null) {
      accessToken = json['token'];
    }

    if (json != null && (json['user'] != null)) {
      profile = User.fromJson(json['user']);
    }
  }
}
