import 'base_response/base_response.dart';

class OtpVerificationResponse extends BaseResponse {
  OtpVerificationResponse(bool success, {String? message})
      : super(success, message: message);

  OtpVerificationResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}
