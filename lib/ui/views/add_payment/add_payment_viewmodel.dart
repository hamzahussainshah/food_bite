import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class AddPaymentViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  // Text controllers for form fields
  final TextEditingController cardholderNameController =
      TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();

  void placeOrder() {
    _navigationService.navigateToConfirmationView();
  }

  void navigateBack() {
    _navigationService.back();
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    cardholderNameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvcController.dispose();
    super.dispose();
  }
}
