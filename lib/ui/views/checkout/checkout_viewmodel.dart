import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../ui/views/add_payment/add_payment_view.dart'; // Assuming AddPaymentView is the renamed PaymentMethodsView

class CheckoutViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  // Sample address data
  List<Map<String, dynamic>> addresses = [
    {
      "address": "#6 Ground Flr-New Civil Lines, Islamabad, Punjab, Pakistan",
      "distance": "1.5 km",
    },
  ];

  // Sample payment options
  List<Map<String, dynamic>> paymentOptions = [
    {
      "name": "Credit/Debit Card",
      "icon": Icons.credit_card,
      "isSelected": true,
      "isAdd": false,
    },
    {
      "name": "Cash on Delivery",
      "icon": Icons.money,
      "isSelected": false,
      "isAdd": true,
    },
    {
      "name": "Wallet",
      "icon": Icons.account_balance_wallet,
      "isSelected": false,
      "isAdd": true,
    },
  ];

  // Form data
  String fullName = "";
  String phoneNumber = "";
  String deliveryAddress = "";
  String pincode = "";
  String cityAndState = "";

  // Selected payment option index
  int selectedPaymentOptionIndex = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  void selectPaymentOption(int index) {
    for (int i = 0; i < paymentOptions.length; i++) {
      paymentOptions[i]["isSelected"] = (i == index);
    }
    selectedPaymentOptionIndex = index;
    notifyListeners();
  }

  void updateFormField(String field, String value) {
    switch (field) {
      case "fullName":
        fullName = value;
        break;
      case "phoneNumber":
        phoneNumber = value;
        break;
      case "deliveryAddress":
        deliveryAddress = value;
        break;
      case "pincode":
        pincode = value;
        break;
      case "cityAndState":
        cityAndState = value;
        break;
    }
    notifyListeners();
  }

  void placeOrder() {
    // Implement order placement logic here
    print("Order placed with details:");
    print("Full Name: $fullName");
    print("Phone Number: $phoneNumber");
    print("Delivery Address: $deliveryAddress");
    print("Pincode: $pincode");
    print("City & State: $cityAndState");
    print(
        "Payment Option: ${paymentOptions[selectedPaymentOptionIndex]["name"]}");
  }

  void navigateBack() {
    _navigationService.back();
  }

  void navigateToAddPaymentView() {
    _navigationService.navigateToView(const AddPaymentView());
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    pinCodeController.dispose();
    cityController.dispose();
    super.dispose();
  }
}
