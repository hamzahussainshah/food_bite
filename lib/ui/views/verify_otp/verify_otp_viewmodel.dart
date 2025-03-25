import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class VerifyOtpViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController otpController = TextEditingController();
  void onNext() {
    _navigationService.navigateToAddEmailView();
  }
}
