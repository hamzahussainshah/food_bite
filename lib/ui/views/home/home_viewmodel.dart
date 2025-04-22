import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.bottomsheets.dart';
import 'package:food_bite/app/app.dialogs.dart';
import 'package:food_bite/app/app.locator.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/data_service/data_model/menu_model.dart';
import 'package:food_bite/services/auth_service.dart';
import 'package:food_bite/services/database_service.dart';
import 'package:food_bite/services/local_storage_service.dart';
import 'package:food_bite/ui/common/app_strings.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();
  final PageController pageController = PageController();
  final LocalStorageService _storageService = locator<LocalStorageService>();
  final DialogService _dialogService = locator<DialogService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;
  int _currentPage = 0;
  int get currentPage => _currentPage;
  int _selectedButtonIndex = 0;
  int get selectedButtonIndex => _selectedButtonIndex;

  List<MenuItem> menuItems = [];

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

  void addItemToCart(MenuItem item) {
    _storageService.addToCart(item).then((value){
      print('VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV::::: $value');
      if (value) {
        _dialogService.showCustomDialog(
          variant: DialogType.alert,
          title: "Success",
          description: "${item.name} added to cart",
          data: value,
        );
      } else {
        _dialogService.showCustomDialog(
          variant: DialogType.alert,
          title: "Error",
          description: "Failed to add ${item.name} to cart. Item already in cart",
          data: value,
        );
      }
    });
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
  void fetchMenu() async {
    setBusy(true);
    var response = await _databaseService.getMenu();
    print("MMMMMMMMMMMMMMMMMMMMMMMMMMM Menu items: ${response.items.length}");
    print(
        "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS ${response.success}");
    if (response.success) {
      print("MMMMMMMMMMMMMMMMMMMMMMMMMMM Menu items: ${response.items.length}");
      menuItems = response.items;
      notifyListeners();
      print("MMMMMMMMMMMMMMMMMMMMMMMMMMM Menu items: ${menuItems.length}");
      setBusy(false);
    } else {
      setBusy(false);
      // Handle error
    }
  }

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

  void navigateToDetailsView() {
    print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
    _navigationService.navigateToItemDetailsView();
  }
}
