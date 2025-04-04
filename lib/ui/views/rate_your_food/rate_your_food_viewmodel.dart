import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/services/file_picker_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';

class RateYourFoodViewModel extends BaseViewModel {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final FilePickerService _filePickerService = locator<FilePickerService>();
  final NavigationService _navigationService = locator<NavigationService>();

  double _rating = 4.8; // Initial rating
  double get rating => _rating;
  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  final List<String> _feedbackOptions = [
    'Good Service',
    'Work Hard',
    'On Time',
    'Carefull',
    'Clean',
    'Polite',
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

  void uploadPhotos() {
    // Placeholder for photo upload logic
    print('Upload photos button tapped');
    // Example using image_picker (uncomment to use):
    /*
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        print('Image picked: ${image.path}');
        // Handle the picked image (e.g., store it in a list, upload to a server, etc.)
      }
    } catch (e) {
      print('Error picking image: $e');
    }
    */
  }

  // Method to pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    try {
      final File? pickedFile =
          await _filePickerService.pickImageWithCompression();

      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      // Handle errors here
    }
  }

  // Method to pick an image from the camera
  Future<void> pickImageFromCamera() async {
    try {
      final File? pickedFile =
          await _filePickerService.pickImageFromCameraWithCompression();

      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      // Handle errors here
    }
  }

  void chooseAndSelectPhoto() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.selectPhoto,
      title: 'Select Photo',
      barrierDismissible: false,
      data: {
        'pickImageFromGallery': () => pickImageFromGallery(),
        'pickImageFromCamera': () => pickImageFromCamera(),
      },
    );
  }

  void submitRating() {
    _navigationService.replaceWithConfirmFeedbackView();
  }

  void back() {
    // Handle back navigation
    print('Back button pressed');
    // Example: Navigate back using Stacked's NavigationService
    // _navigationService.back();
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}
