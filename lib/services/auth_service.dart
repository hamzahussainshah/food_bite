import 'package:food_bite/data_service/body/signup_body.dart';
import 'package:food_bite/data_service/responses/menu_response.dart';
import 'package:food_bite/data_service/responses/signup_response.dart';

import '../app/app.locator.dart';
import '../core/end_points/api_end_points.dart';
import '../data_service/body/login_body.dart';
import '../data_service/responses/auth_response.dart';
import '../data_service/responses/base_response/base_response.dart';
import '../data_service/responses/otp_verification_response.dart';
import 'api_service.dart';
import 'local_storage_service.dart';

class AuthService {
  final ApiService _apiService = locator<ApiService>();
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();

  Future<AuthResponse> signInWithPhoneAndPassword(LoginBody body) async {
    final BaseResponse response = await _apiService.post(
      endPoint: ApiEndPoints.login,
      data: body.toJson(),
    );
    print("MMMMMMMMMMMMMMMMMMMMMM${response.message}");
    var authResponse = response.success
        ? AuthResponse.fromJson(response.data) // Not response.toJson()
        : AuthResponse(false, message: response.message);

    if (authResponse.success) {
      _localStorageService.isLogedIn = true;
      _localStorageService.currentUserID = authResponse.profile!.id;
      _localStorageService.accessToken = authResponse.accessToken;
    }
    return authResponse;
  }

  Future<SignupResponse> signUpWithPhoneAndPassword(SignUpBody body) async {
    final BaseResponse response = await _apiService.post(
      endPoint: ApiEndPoints.signup,
      data: body.toJson(),
    );

    // print("MMMMMMMMMMMMMMMMMMMMMM${response.message}");

    // Create from full response map, not just response.data
    final signupResponse = SignupResponse.fromJson({
      'message': response.message,
      'user': response.data is Map<String, dynamic> &&
              response.data.containsKey('user')
          ? response.data['user']
          : response.data,
      'token': response.data is Map<String, dynamic> &&
              response.data.containsKey('token')
          ? response.data['token']
          : null,
    });

    // Explicitly set success based on expected fields
    signupResponse.success =
        signupResponse.accessToken != null && signupResponse.profile != null;
    signupResponse.message ??= response.message;

    return signupResponse;
  }

  Future<BaseResponse> sendOTPForPasswordResetTOEmail(String email) async {
    final BaseResponse response = await _apiService.post(
      endPoint: ApiEndPoints.sendPasswordResetOtp,
      data: {
        "email": email,
      },
    );
    var baseResponse = response.success
        ? BaseResponse.fromJson(response.data) // Not response.toJson()
        : BaseResponse(false, message: response.message);

    return baseResponse;
  }

  Future<bool> signOut() async {
    _localStorageService.isLogedIn = false;
    _localStorageService.currentUserID = null;
    _localStorageService.accessToken = null;
    return true;
  }

  Future<OtpVerificationResponse> verifyEmail({
    required String email,
    required String otp,
  }) async {
    final BaseResponse response = await _apiService.post(
      endPoint: ApiEndPoints.verifyOTP,
      data: {
        "email": email,
        "otp": otp,
      },
    );

    final otpResponse = OtpVerificationResponse.fromJson(response.toJson());
    return otpResponse;
  }

  Future<BaseResponse> resetPassword(
      {required String email, required String password}) async {
    final BaseResponse response = await _apiService.post(
      endPoint: ApiEndPoints.resetPassword,
      data: {
        "email": email,
        "newPassword": password,
      },
    );
    var baseResponse = response.success
        ? BaseResponse.fromJson(response.data) // Not response.toJson()
        : BaseResponse(false, message: response.message);

    return baseResponse;
  }
}
