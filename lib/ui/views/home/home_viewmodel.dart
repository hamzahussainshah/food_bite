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
  bool isLoading = false;

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;
  int _currentPage = 0;
  int get currentPage => _currentPage;
  int _selectedButtonIndex = 0;
  int get selectedButtonIndex => _selectedButtonIndex;

  List<MenuItem> menuItems = [];
  List<MenuItem> filteredMenuItems = []; // Filtered list for Best Sellers

  void selectButton(int index) {
    _selectedButtonIndex = index;
    filterMenuItems(); // Filter items when a category is selected
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
    _storageService.addToCart(item).then((value) {
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
          description:
              "Failed to add ${item.name} to cart. Item already in cart",
          data: value,
        );
      }
    });
  }

  // List of button labels (categories)
  final List<String> buttonLabels = [
    "All",
    "Burger",
    "Pizza",
    "Dessert",
    "Drinks",
    "Pasta",
  ];

  void fetchMenu() async {
    isLoading = true;
    notifyListeners();

    var response = await _databaseService.getMenu();
    if (response.success) {
      menuItems = response.items;
      filterMenuItems(); // Initial filtering (default to "All")

      isLoading = false;
      notifyListeners();
      await _storageService.deleteMenuItems();
      // Save to local storage
      await _storageService.saveMenuItems(menuItems);
    } else {
      isLoading = false;
      notifyListeners();
    }
  }

  void filterMenuItems() {
    final selectedCategory = buttonLabels[_selectedButtonIndex];
    if (selectedCategory == "All") {
      filteredMenuItems = menuItems; // Show all items
    } else {
      filteredMenuItems =
          menuItems.where((item) => item.category == selectedCategory).toList();
    }
  }

  void navigateToDetailsView(MenuItem item) {
    print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
    _navigationService.navigateToItemDetailsView(menu: item);
  }

  navigateToMenuView() {
    _navigationService.navigateTo(Routes.menuView);
  }

  navigateToBookTableView() {
    _navigationService.navigateTo(Routes.tableReservationView);
  }

  double getAverageRating(MenuItem item) {
    if (item.reviews == null || item.reviews!.isEmpty) {
      return 0.0;
    }
    double sum = 0.0;
    for (var review in item.reviews!) {
      sum += review.rating.toDouble(); // Convert int to double since API shows ratings as integers
    }
    return sum / item.reviews!.length;
  }
}
