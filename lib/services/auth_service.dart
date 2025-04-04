import '../app/app.locator.dart';
import '../core/end_points/api_end_points.dart';
import '../data_service/body/login_body.dart';
import '../data_service/responses/auth_response.dart';
import '../data_service/responses/base_response/base_response.dart';
import '../data_service/responses/request_response.dart';
import 'api_service.dart';
import 'local_storage_service.dart';

class AuthService {
  final ApiService _apiService = locator<ApiService>();
  final LocalStorageService _localStorageService = locator<LocalStorageService>();

  Future<AuthResponse> signInWithPhoneAndPassword(LoginBody body) async {
    final BaseResponse response = await _apiService.post(
      endPoint: ApiEndPoints.login,
      data: body.toJson(),
    );
    var authResponse = response.success
        ? AuthResponse.fromJson(response.data)
        : AuthResponse(
      false,
      message: response.message,
    );

    if (authResponse.success) {

      _localStorageService.isLogedIn = true;
      _localStorageService.currentUserID = response.data.uid;
      _localStorageService.accessToken = authResponse.accessToken;
    }
    return authResponse;
  }
}
