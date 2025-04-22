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

  void changeTab(String name) {
    isSelected = name;
    notifyListeners();
  }

  void selectButton(int index) {
    _selectedButtonIndex = index;
    notifyListeners();
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
    "Best Sellers",
    "New Arrivals",
    "Top Rated",
    "Desserts",
    "Drinks",
    "Snacks",
    "Salads",
  ];

  void navigateBack() {
    _navigationService.back();
  }

  void fetchMenu() async {
    setBusy(true);
    var response = await _databaseService.getMenu();
    if (response.success) {
      menuItems = response.items;
      notifyListeners();
      setBusy(false);
    } else {
      setBusy(false);
      // Handle error
    }
  }
}
