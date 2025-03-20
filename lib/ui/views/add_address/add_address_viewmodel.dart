import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddAddressViewModel extends BaseViewModel {
  final TextEditingController addressController = TextEditingController();
  String? _address;

  String? get address => _address;

  set address(String? value) {
    _address = value;
    notifyListeners(); // Notify UI to rebuild when address changes
  }

  void useCurrentLocation() {
    // Implement logic to fetch current location
    print("Using current location");
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an address';
    }
    return null; // Return null if valid
  }

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }
}
