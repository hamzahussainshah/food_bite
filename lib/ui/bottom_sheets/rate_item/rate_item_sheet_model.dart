import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RateItemSheetModel extends BaseViewModel {
  final TextEditingController commentController = TextEditingController();
  int _rating = 0; // Rating from 0 to 5
  int get rating => _rating;

  void setRating(int newRating) {
    _rating = newRating;
    notifyListeners();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}
