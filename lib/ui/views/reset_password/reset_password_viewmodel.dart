import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordViewModel extends BaseViewModel {
  void onUpdate() {}
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isObscure = true;
  bool isObscureConfirm = true;
  togglePasswordVisibility() {
    isObscure = !isObscure;
    notifyListeners();
  }

  toggleConfirmPasswordVisibility() {
    isObscureConfirm = !isObscureConfirm;
    notifyListeners();
  }
}
