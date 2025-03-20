import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SignupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isObscure = true;
  togglePasswordVisibility() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void navigateToLoginView() {
    _navigationService.navigateToLoginView();
  }

  void navigateToLogInView() {
    _navigationService.navigateToLoginView();
  }
}
