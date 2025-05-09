import 'package:flutter/cupertino.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class CartViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Margherita Pizza",
      "addOns": "Mozzarella, Pepperoni",
      "price": 12.99,
      "quantity": 1,
      "imagePath": AppImages.burger,
    },
    {
      "name": "Margherita Pizza",
      "addOns": "Mozzarella, Pepperoni",
      "price": 12.99,
      "quantity": 1,
      "imagePath": AppImages.burger,
    },
  ];

  // Charges
  double deliveryCharge = 5.30;
  double tax = 1.00;

  // Calculate subtotal
  double get subtotal {
    return cartItems.fold(
        0.0,
        (sum, item) =>
            sum + (item["price"] as double) * (item["quantity"] as int));
  }

  // Calculate total
  double get total {
    return subtotal + deliveryCharge + tax;
  }

  TextEditingController promoCodeController = TextEditingController();

  void increaseQuantity(int index) {
    cartItems[index]["quantity"] = (cartItems[index]["quantity"] as int) + 1;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (cartItems[index]["quantity"] == 1) {
      removeItem(index);
    } else {
      cartItems[index]["quantity"] = (cartItems[index]["quantity"] as int) - 1;
    }
    notifyListeners();
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  void applyPromoCode(String code) {
    // Implement promo code logic here (e.g., apply discount)
    print("Promo code applied: $code");
  }

  void proceedToCheckout() {
    _navigationService.navigateToCheckoutView();
    print("Proceeding to checkout with total: \$${total.toStringAsFixed(2)}");
  }

  void navigateBack() {
    _navigationService.back();
  }
}
