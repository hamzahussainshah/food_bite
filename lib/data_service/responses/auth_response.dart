import '../data_model/user_model.dart';
import 'base_response/base_response.dart';

class AuthResponse extends BaseResponse {
  String? accessToken;
  UserModel? profile;

  /// Default constructor
  AuthResponse(success, {message, this.accessToken})
      : super(success, message: message);

  /// Named Constructor
  AuthResponse.fromJson(json) : super.fromJson(json) {
    if (json != null) accessToken = json['access_token'];

    if (json != null && json['data'] != null) {
      profile = UserModel.fromMap(json['data']);
    }
  }
}
