import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../core/constants/countries.dart';

class AddPhoneViewModel extends BaseViewModel {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final NavigationService _navigationService = locator<NavigationService>();

  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode phoneFocus = FocusNode();
  bool _hasFocused = false;
  String? errorMessage;

  LogInViewModel() {
    // Listen to changes in the FocusNode
    phoneFocus.addListener(_focusListener);
  }

  void _focusListener() {
    if (phoneFocus.hasFocus && !_hasFocused) {
      _hasFocused = true;
    }
  }

  // Variables to hold validation state
  bool isPhoneNumberValid = false;
  bool isPasswordValid = false;
  bool isEnabled = false;
  int minLength = 10;
  int maxLength = 10;
  Map country = {
    "name": "United States",
    "dial_code": "+1",
    "code": "US",
  };

  void onPhoneChanged() {
    if (phoneController.text.length >= 5) {
      isPhoneNumberValid = true;
    } else if (phoneController.text.length < 5) {
      isPhoneNumberValid = false;
    }

    notifyListeners();
  }

  showCountrySelector() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.selectCountryCode,
      isScrollControlled: true,
      title: 'Select Country Code',
      data: {
        'dial_code': true,
        'buttonOneText': "Select",
        'buttonTwoText': "Back",
      },
    ).then((value) {
      if (value != null && value.confirmed) {
        _hasFocused = true;
        country = value.data;
        updateMinAndMaxLength();
        notifyListeners();
      }
    });
  }

  updateMinAndMaxLength() {
    Country selectedCountry =
        getCountryByDialCode(country['dial_code'].replaceAll('+', ''));
    minLength = selectedCountry.minLength;
    maxLength = selectedCountry.maxLength;
    onPhoneChanged();
  }

  void onContinue() {}
}
