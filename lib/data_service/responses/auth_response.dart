import '../data_model/user_model.dart';
import 'base_response/base_response.dart';

class AuthResponse extends BaseResponse {
  String? accessToken;
  UserModel? profile;

  AuthResponse(success, {message, this.accessToken})
      : super(success, message: message);

  AuthResponse.fromJson(json) : super.fromJson(json) {
    if (json != null) {
      accessToken = json['token'];
    }

    if (json != null && (json['user'] != null)) {
      profile = UserModel.fromMap(json['user']);
    }
  }
}
