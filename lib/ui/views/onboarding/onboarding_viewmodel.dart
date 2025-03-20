import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class OnboardingViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PageController pageController = PageController();
  int _currentPage = 0; // Private variable to store the current page
  int get currentPage => _currentPage; // Public getter for the view to access

  // Method to update the current page and trigger a rebuild
  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void onNext() {
    if (_currentPage < 3) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void onSkip() {
    pageController.jumpToPage(3);
  }

  void navigateToSignUpView() {
    _navigationService.navigateToLoginView();
  }
}
