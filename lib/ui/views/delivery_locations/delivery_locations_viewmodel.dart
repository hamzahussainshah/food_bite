import 'package:flutter/cupertino.dart';
import 'package:food_bite/data_service/data_model/update_address_model.dart';
import 'package:food_bite/ui/widgets/snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../data_service/body/address_model.dart';
import '../../../services/database_service.dart';
import '../../../services/local_storage_service.dart';

class DeliveryLocationsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();
  final DatabaseService _databaseService = locator<DatabaseService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final DialogService _dialogService = locator<DialogService>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  List<Address> addressList = [];

  DeliveryLocationsViewModel() {
    initAddress();
  }

  initAddress() {
    addressList = _localStorageService.addressList;
    notifyListeners();
  }

  void saveAddress() async {
    print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSAAAAAAAAAAAAAAAAAAA");
    String action = "add";
    setBusy(true);
    Address newAddress = Address(
      action: action,
      street: streetController.text.trim(),
      city: cityController.text.trim(),
      postalCode: postalCodeController.text.trim(),
      country: countryController.text.trim(),
    );

    print("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");

    var response = await _databaseService.addAddress(newAddress);
    if (response.success) {
      _localStorageService.addressList.add(newAddress);
      addressList.add(newAddress);
      showSuccessSnackBar("Success", "Address added successfully");
    }
    setBusy(false);
    notifyListeners();

    // Clear fields after save
    streetController.clear();
    cityController.clear();
    postalCodeController.clear();
    countryController.clear();
  }

  Future<void> updateAddress(Address address) async {
    UpdateAddress updateAddress = UpdateAddress(
      action: "update",
      street: address.street,
      city: address.city,
      postalCode: address.postalCode,
      country: address.country,
      addressId: address.id,
    );
    setBusy(true);

    var response = await _databaseService.updateAddress(updateAddress);
    if (response.success) {
      _localStorageService.clearAddressList();
      _localStorageService.saveAddressList(response.addresses);
      final index = addressList.indexWhere((e) => e.id == address.id);
      if (index != -1) {
        addressList[index] = address;
      }
      showSuccessSnackBar("Success", "Address edited successfully");
    }
    setBusy(false);
    notifyListeners();
  }

  Future<void> editAddress(Address address) async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.editAddress,
      title: "Edit Address",
      barrierDismissible: true,
      data: {
        'address': address,
      },
    );
    if (response!.confirmed) {
      updateAddress(response.data as Address);
    }
  }

  void back() {
    _navigationService.back();
  }

  Future<void> deleteAddress(Address address) async {
    UpdateAddress updateAddress = UpdateAddress(
      action: "delete",
      street: address.street,
      city: address.city,
      postalCode: address.postalCode,
      country: address.country,
      addressId: address.id,
    );
    setBusy(true);

    var response = await _databaseService.updateAddress(updateAddress);
    if (response.success) {
      _localStorageService.clearAddressList();
      _localStorageService.saveAddressList(response.addresses);
      addressList.removeWhere((e) => e.id == address.id);
      showSuccessSnackBar("Success", "Address deleted successfully");
    }
    setBusy(false);
    notifyListeners();
  }

  Future<void> showDeleteDialog(Address address) async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: "Delete Address",
      description: "Are you sure you want to delete this address?",
      barrierDismissible: true,
    );
    if (response!.confirmed) {
      deleteAddress(address);
    }
  }
}
