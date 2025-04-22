import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/services/app_states_service.dart';
import 'package:food_bite/services/auth_service.dart';
import 'package:food_bite/ui/widgets/snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ResetPasswordViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AppStatesService _appStatesService = locator<AppStatesService>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? email;

  ResetPasswordViewModel() {
    email = _appStatesService.email;
  }

  bool isObscure = true;
  bool isObscureConfirm = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  togglePasswordVisibility() {
    isObscure = !isObscure;
    notifyListeners();
  }

  toggleConfirmPasswordVisibility() {
    isObscureConfirm = !isObscureConfirm;
    notifyListeners();
  }

  Future<void> onUpdate() async {
    setBusy(true);
    var response = await _authService.resetPassword(
      email: email!,
      password: passwordController.text.trim(),
    );
    if (response.success) {
      setBusy(false);
      _navigationService.navigateToLoginView();
      showSuccessSnackBar(
          "Success", "Password changed successfully please login");
    } else {
      setBusy(false);
      showErrorSnackBar("Error", response.message!);
      // Handle error
    }
  }
}
