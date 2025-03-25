import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  togglePasswordVisibility() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void navigateToSignUpView() {
    _navigationService.navigateToSignupView();
  }

  void navigateToForgotPasswordView() {
    _navigationService.navigateToAddPhoneView();
  }

  void navigateToAddAddressView() {
    _navigationService.navigateToAddAddressView();
  }

  void navigateToNavigationView() {
    _navigationService.navigateToNavigationView();
  }
}
