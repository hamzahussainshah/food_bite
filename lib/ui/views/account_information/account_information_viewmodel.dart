import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountInformationViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AccountInformationViewModel() {
    // Fetch data from API or database
    phoneNumberController.text = '03228677555';
    emailController.text = 'addysongriffith@gmail.com';
    nameController.text = 'Addyson Griffith';
  }

  void back() {
    _navigationService.back();
  }
}
