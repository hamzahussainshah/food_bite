import 'dart:async'; // Add this import for Timer
import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.locator.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/services/app_states_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/auth_service.dart';
import '../../widgets/snackbar.dart';

class VerifyEmailViewModel extends BaseViewModel {
  final AppStatesService _appStatesService = locator<AppStatesService>();
  TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String? email;
  Timer? _timer;
  int remainingSeconds = 60;
  bool get isTimerRunning => remainingSeconds > 0;

  VerifyEmailViewModel() {
    email = _appStatesService.email;
    startTimer(); // Start the timer when the view model is initialized
  }

  void startTimer() {
    remainingSeconds = 60;
    notifyListeners();

    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        notifyListeners();
      } else {
        timer.cancel();
        notifyListeners();
      }
    });
  }

  void onNext() {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      _authService
          .verifyEmail(
        email: email!,
        otp: otpController.text.trim(),
      )
          .then((response) {
        if (response.success) {
          setBusy(false);
          showSuccessSnackBar("Success", "OTP verified successfully");
          _navigationService.navigateToResetPasswordView();
          // Navigate to the next screen
        } else {
          setBusy(false);
          showErrorSnackBar("Error", response.message!);
        }
      });
    }
  }

  Future<void> resendOTP() async {
    setBusy(true);
    var response = await _authService.sendOTPForPasswordResetTOEmail(email!);
    if (response.success) {
      _appStatesService.email = email;
      setBusy(false);
      showSuccessSnackBar("Success", "Resent OTP to $email");
      startTimer(); // Restart the timer after a successful resend
    } else {
      setBusy(false);
      showErrorSnackBar("Error", response.message!);
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Clean up the timer when the view model is disposed
    super.dispose();
  }
}
