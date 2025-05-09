import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.locator.dart';
import 'package:food_bite/services/database_service.dart';
import 'package:food_bite/services/local_storage_service.dart';
import 'package:food_bite/ui/widgets/snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountInformationViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final LocalStorageService storageService = locator<LocalStorageService>();
  final DatabaseService _databaseService = locator<DatabaseService>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AccountInformationViewModel() {
    // Fetch data from API or database
    phoneNumberController.text = storageService.phoneNumber! ?? '';
    emailController.text = storageService.email!.trim();
    nameController.text = storageService.userName!.trim();
  }

  void back() {
    _navigationService.back();
  }

  Future<void> saveChanges() async {
    final String phoneNumber = phoneNumberController.text.trim();
    final String name = nameController.text.trim();
    setBusy(true);
    var response = await _databaseService.updateUserProfile(
      userId: storageService.currentUserID!,
      phoneNumber: phoneNumber,
      name: name,
    );
    if (response.success) {
      storageService.userName = name;
      storageService.phoneNumber = phoneNumber;
      showSuccessSnackBar("Success", "Changes saved successfully");
    } else {
      // Handle error
      print("Error updating profile: ${response.message}");
    }
    setBusy(false);
  }
}
