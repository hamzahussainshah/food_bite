import 'package:flutter/material.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class RateDriverViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  double _rating = 5.0; // Initial rating
  double get rating => _rating;

  final List<String> _feedbackOptions = [
    'Good Service',
    'Clean',
    'Polite',
    'Work Hard',
    'On Time',
    'Careful',
  ];
  List<String> get feedbackOptions => _feedbackOptions;

  final List<String> _selectedFeedbacks = ['On Time', 'Carefull'];
  List<String> get selectedFeedbacks => _selectedFeedbacks;

  final TextEditingController _feedbackController = TextEditingController();
  TextEditingController get feedbackController => _feedbackController;

  void setRating(double rating) {
    _rating = rating;
    notifyListeners();
  }

  void toggleFeedback(String feedback) {
    if (_selectedFeedbacks.contains(feedback)) {
      _selectedFeedbacks.remove(feedback);
    } else {
      _selectedFeedbacks.add(feedback);
    }
    notifyListeners();
  }

  void submitRating() {
    // Handle submission logic here
    print('Rating: $_rating');
    print('Feedbacks: $_selectedFeedbacks');
    print('Additional Feedback: ${_feedbackController.text}');
    // Example: Navigate to the next screen or show a confirmation
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void navigateToRateYourFoodView() {
    _navigationService.navigateToRateYourFoodView();
  }

  void back() {
    _navigationService.back();
  }
}
