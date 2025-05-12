import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/services/auth_service.dart';
import 'package:food_bite/services/database_service.dart';
import 'package:food_bite/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../data_service/data_model/menu_model.dart';

class MenuViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();
  final LocalStorageService _storageService = locator<LocalStorageService>();
  final DialogService _dialogService = locator<DialogService>();
  int _selectedButtonIndex = 0;
  int get selectedButtonIndex => _selectedButtonIndex;
  String isSelected = "Appetizers";
  List<MenuItem> menuItems = [];
  bool isLoading = false;

  List<MenuItem> filteredMenuItems = []; // Filtered list for Best Sellers

  void selectButton(int index) {
    _selectedButtonIndex = index;
    filterMenuItems(); // Filter items when a category is selected
    notifyListeners();
  }

  void changeTab(String name) {
    isSelected = name;
    notifyListeners();
  }

  void addItemToCart(MenuItem item) {
    _storageService.addToCart(item).then((value) {
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
          description:
              "Failed to add ${item.name} to cart. Item already in cart",
          data: value,
        );
      }
    });
  }

  // List of button labels (you can adjust these as needed)
  final List<String> buttonLabels = [
    "All",
    "Burger",
    "Pizza",
    "Dessert",
    "Drinks",
    "Pasta",
  ];

  void filterMenuItems() {
    final selectedCategory = buttonLabels[_selectedButtonIndex];
    if (selectedCategory == "All") {
      filteredMenuItems = menuItems; // Show all items
    } else {
      filteredMenuItems =
          menuItems.where((item) => item.category == selectedCategory).toList();
    }
  }

  void navigateBack() {
    _navigationService.back();
  }

  Future<void> fetchMenu() async {
    isLoading = true;
    var response = await _databaseService.getMenu();
    if (response.success) {
      menuItems = response.items;
      print("MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM${menuItems.first.id}");
      filterMenuItems();
      notifyListeners();
      isLoading = false;
    } else {
      isLoading = false;
      // Handle error
    }
  }

  void navigateToItemDetailsView(MenuItem item) {
    _navigationService.navigateToItemDetailsView(menu: item);
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
