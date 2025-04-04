import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class DeliveryLocationsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityStateController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void saveAddress() {}

  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    cityStateController.dispose();
    super.dispose();
  }

  void back() {
    _navigationService.back();
  }
}
