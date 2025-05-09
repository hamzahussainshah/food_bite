import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class MenuViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  int _selectedButtonIndex = 0;
  int get selectedButtonIndex => _selectedButtonIndex;

  void selectButton(int index) {
    _selectedButtonIndex = index;
    notifyListeners();
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
}
