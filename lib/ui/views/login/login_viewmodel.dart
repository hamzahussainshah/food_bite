import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../data_service/body/login_body.dart';
import '../../../services/auth_service.dart';
import '../../widgets/snackbar.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginViewModel() {
    emailController.text = "hamza@gmail.com";
    passwordController.text = "12345678";
  }
  bool isObscure = true;
  togglePasswordVisibility() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void navigateToSignUpView() {
    _navigationService.navigateToSignupView();
  }

  void navigateToForgotPasswordView() {
    _navigationService.navigateToAddEmailView();
  }

  void navigateToAddAddressView() {
    _navigationService.navigateToAddAddressView();
  }

  void navigateToNavigationView() {
    _navigationService.navigateToNavigationView();
  }

  Future<void> signInWithPhoneAndPassword() async {
    setBusy(true);
    LoginBody loginBody = LoginBody(
      email: emailController.text,
      password: passwordController.text,
    );
    final response = await _authService.signInWithPhoneAndPassword(loginBody);

    if (response.success) {
      setBusy(false);
      _navigationService.replaceWithNavigationView();
    } else {
      setBusy(false);
      showErrorSnackBar("Login Error", response.message!);
      notifyListeners();
    }
  }
}
