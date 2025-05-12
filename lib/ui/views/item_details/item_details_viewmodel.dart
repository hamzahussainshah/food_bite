import 'package:food_bite/services/local_storage_service.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../data_service/data_model/menu_model.dart';
import '../../../data_service/data_model/review.dart';
import '../../../services/database_service.dart';

class ItemDetailsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();
  final DialogService _dialogService = locator<DialogService>();
  final LocalStorageService _storageService = locator<LocalStorageService>();
  final MenuItem menu; // Add menu to access its details and reviews

  String selectedSize = "M"; // Default size
  List<String> selectedAddOns = [
    "Mozzarella",
    "Pepperoni"
  ]; // Default selected add-ons
  bool isFavorite = false; // Favorite state
  bool showReviews = false; // Toggle for showing reviews

  // Track which reviews the user has liked (by index)
  List<int> userLikedReviews = [];

  ItemDetailsViewModel({required this.menu});

  void selectSize(String size) {
    selectedSize = size;
    notifyListeners();
  }

  void toggleAddOn(String addOn) {
    if (selectedAddOns.contains(addOn)) {
      selectedAddOns.remove(addOn);
    } else {
      selectedAddOns.add(addOn);
    }
    notifyListeners();
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void toggleReviews() {
    showReviews = !showReviews;
    notifyListeners();
  }

  void toggleLike(int reviewIndex) {
    if (userLikedReviews.contains(reviewIndex)) {
      // Unlike the review
      userLikedReviews.remove(reviewIndex);
      // Note: Review model doesn't have a likes field; if needed, add it to the Review model
    } else {
      // Like the review
      userLikedReviews.add(reviewIndex);
      // Note: Review model doesn't have a likes field; if needed, add it to the Review model
    }
    notifyListeners();
  }

  void addToCart() {
    // Handle add to cart logic
    print(
        "Added to cart: Item: ${menu.name}, Size: $selectedSize, Add-ons: $selectedAddOns");
  }

  void navigateBack() {
    _navigationService.back();
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
}
