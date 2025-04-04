import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddCardViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void back() {
    _navigationService.back();
  }
}
