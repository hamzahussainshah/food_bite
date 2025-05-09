import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.bottomsheets.dart';
import 'package:food_bite/app/app.dialogs.dart';
import 'package:food_bite/app/app.locator.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/ui/common/app_strings.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final PageController pageController = PageController();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;
  int _currentPage = 0;
  int get currentPage => _currentPage;
  int _selectedButtonIndex = 0;
  int get selectedButtonIndex => _selectedButtonIndex;

  void selectButton(int index) {
    _selectedButtonIndex = index;
    notifyListeners();
  }

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  // List of button labels (you can adjust these as needed)
  final List<String> buttonLabels = [
    "All",
    "Burgers",
    "Pizza",
    "Desserts",
    "Drinks",
    "Snacks",
    "Salads",
  ];
  final List<Map<String, dynamic>> bestSellerItems = [
    {
      "name": "Margherita Pizza",
      "description": "Classic Italian pizza with fresh mozzarella.",
      "price": 12.99,
      "rating": 4.1,
      "imagePath": AppImages.burger, // Replace with actual image path
    },
    {
      "name": "Margherita Pizza",
      "description": "Classic Italian pizza with fresh mozzarella.",
      "price": 12.99,
      "rating": 4.1,
      "imagePath": AppImages.burger, // Replace with actual image path
    },
    {
      "name": "Margherita Pizza",
      "description": "Classic Italian pizza with fresh mozzarella.",
      "price": 12.99,
      "rating": 4.1,
      "imagePath": AppImages.burger, // Replace with actual image path
    },
    {
      "name": "Margherita Pizza",
      "description": "Classic Italian pizza with fresh mozzarella.",
      "price": 12.99,
      "rating": 4.1,
      "imagePath": AppImages.burger, // Replace with actual image path
    },
    // Add more items as needed
  ];

  void addToCart(String itemName) {
    // Implement your cart logic here
    print("Added $itemName to cart");
  }

  void navigateToDetailsView() {
    print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
    _navigationService.navigateToItemDetailsView();
  }
}
