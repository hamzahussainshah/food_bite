import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../data_service/data_model/menu_model.dart';
import '../../../services/local_storage_service.dart';

class CartViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final LocalStorageService _storageService = locator<LocalStorageService>();

  List<MenuItem> cartItems = [];
  Map<String, int> quantityMap = {};

  CartViewModel() {
    loadCartItems();
  }

  void loadCartItems() {
    final rawItems = _storageService.getCartItemsRaw();

    cartItems =
        rawItems.map((entry) => MenuItem.fromJson(entry['item'])).toList();
    quantityMap = {
      for (var entry in rawItems)
        entry['item']['_id']: entry['quantity'] as int,
    };
  }

  double deliveryCharge = 5.30;
  double tax = 1.00;

  double get subtotal {
    double sum = 0;
    for (var item in cartItems) {
      sum += item.price * (quantityMap[item.id] ?? 1);
    }
    return sum;
  }

  double get total => subtotal + deliveryCharge + tax;

  TextEditingController promoCodeController = TextEditingController();

  void increaseQuantity(int index) {
    var id = cartItems[index].id;
    quantityMap[id] = (quantityMap[id] ?? 1) + 1;
    _saveCartToStorage();
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    var id = cartItems[index].id;
    if ((quantityMap[id] ?? 1) <= 1) {
      removeItem(index);
    } else {
      quantityMap[id] = (quantityMap[id] ?? 1) - 1;
      _saveCartToStorage();
    }
    notifyListeners();
  }

  void _saveCartToStorage() {
    List<Map<String, dynamic>> stored = cartItems.map((item) {
      return {
        "item": item.toJson(),
        "quantity": quantityMap[item.id] ?? 1,
      };
    }).toList();

    _storageService.updateCartItems(stored);
  }

  void removeItem(int index) {
    var id = cartItems[index].id;
    cartItems.removeAt(index);
    quantityMap.remove(id);
    _storageService.removeFromCart(id);
    notifyListeners();
  }

  void applyPromoCode(String code) {
    print("Promo code applied: $code");
  }

  void proceedToCheckout() {
    _navigationService.navigateToCheckoutView();
    print("Proceeding to checkout with total: \$${total.toStringAsFixed(2)}");
  }

  void navigateBack() {
    _navigationService.back();
  }

  void navigateToNavigationView() {
    _navigationService.popUntil(
      (route) => route.settings.name == Routes.navigationView,
    );
  }
}
