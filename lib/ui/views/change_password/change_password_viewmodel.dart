import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangePasswordViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureCurrentPassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  void toggleCurrentPasswordVisibility() {
    obscureCurrentPassword = !obscureCurrentPassword;
    notifyListeners();
  }

  void toggleNewPasswordVisibility() {
    obscureNewPassword = !obscureNewPassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  void changePassword() {
    // Implement your password change logic here
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void back() {
    _navigationService.back();
  }
}
