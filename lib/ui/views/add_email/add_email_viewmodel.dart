import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.locator.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/services/app_states_service.dart';
import 'package:food_bite/services/auth_service.dart';
import 'package:food_bite/ui/widgets/snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddEmailViewModel extends BaseViewModel {
  final AppStatesService _appStatesService = locator<AppStatesService>();
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController emailController = TextEditingController();
  final AuthService _authService = locator<AuthService>();

  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  Future<void> onContinue() async {
    setBusy(true);
    var response = await _authService
        .sendOTPForPasswordResetTOEmail(emailController.text.trim());
    if (response.success) {
      _appStatesService.email = emailController.text.trim();
      setBusy(false);
      showSuccessSnackBar(
          "Success", "We have sent OTP to ${emailController.text.trim()}");
      _navigationService.navigateToVerifyEmailView();
    } else {
      setBusy(false);
      showErrorSnackBar("Error", response.message!);
    }
  }
}
