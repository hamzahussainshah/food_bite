import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/data_service/body/address_model.dart';
import 'package:food_bite/services/auth_service.dart';
import 'package:food_bite/ui/widgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../data_service/body/signup_body.dart';

class SignupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  bool isObscure = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  Future<void> signUpWithPhoneAndPassword() async {
    setBusy(true);
    var response = await _authService.signUpWithPhoneAndPassword(
      SignUpBody(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phone: phoneController.text.trim(),
        addresses: [
          Address(
            country: countryController.text.trim(),
            postalCode: postalCodeController.text.trim(),
            city: cityController.text.trim(),
            street: streetController.text.trim(),
          )
        ],
        role: 'user',
      ),
    );
    // print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS ${response.success}");
    if (response.success) {
      setBusy(false);
      _navigationService.replaceWithLoginView();
    } else {
      setBusy(false);
      showErrorSnackBar("Error", response.message!);
      print(
          'Error RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR: ${response.message!.capitalizeFirst}');
    }
  }
}
