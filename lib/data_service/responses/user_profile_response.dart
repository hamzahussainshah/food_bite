import 'package:food_bite/data_service/responses/user_model.dart';
import 'base_response/base_response.dart';

class UserProfileResponse extends BaseResponse {
  User? profile;

  UserProfileResponse(bool success, {String? message, this.profile})
      : super(success, message: message);

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      true, // Assume success since the API returned 200
      message: json['message'] ?? 'Success',
      profile: User.fromJson(json),
    );
  }
}
