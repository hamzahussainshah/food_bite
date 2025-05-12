import 'package:flutter/material.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/data_service/body/address_model.dart';
import 'package:food_bite/ui/widgets/snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../data_service/body/order_request.dart';
import '../../../data_service/body/order_request_item.dart';
import '../../../data_service/data_model/menu_model.dart';
import '../../../data_service/data_model/update_address_model.dart';
import '../../../data_service/responses/order_confirmation_response.dart';
import '../../../data_service/responses/user_model.dart';
import '../../../services/app_states_service.dart';
import '../../../services/database_service.dart';
import '../../../services/local_storage_service.dart';
import '../../../services/order_service.dart';
import '../../../ui/views/add_payment/add_payment_view.dart';
import '../history/history_viewmodel.dart';
import 'package:provider/provider.dart';


class CheckoutViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();
  final LocalStorageService _storageService = locator<LocalStorageService>();
  final OrderService _ordersService = locator<OrderService>();
  final AppStatesService _appStatesService =
      locator<AppStatesService>();
  bool isLoading = false;

  User? userProfile;
  String? userId;
  List<Map<String, dynamic>> cartItems = []; // Now includes quantity
  int selectedAddressIndex = 0; // Track selected address

  CheckoutViewModel() {
    final rawItems = _storageService.getCartItemsRaw();
    cartItems = rawItems.map((entry) {
      return {
        'item': MenuItem.fromJson(entry['item']),
        'quantity':
            entry['quantity'] ?? 1, // Default to 1 if quantity isn't stored
      };
    }).toList();
    userId = _storageService.currentUserID;
    getUserProfile();
  }

  // Sample payment options
  List<Map<String, dynamic>> paymentOptions = [
    // {
    //   "name": "Credit/Debit Card",
    //   "icon": Icons.credit_card,
    //   "isSelected": true,
    //   "isAdd": false,
    // },
    {
      "name": "Cash on Delivery",
      "icon": Icons.money,
      "isSelected": true,
      "isAdd": false,
    },
    // {
    //   "name": "Wallet",
    //   "icon": Icons.account_balance_wallet,
    //   "isSelected": false,
    //   "isAdd": true,
    // },
  ];

  Future<void> getUserProfile() async {
    isLoading = true;
    notifyListeners();
    var response = await _databaseService.getUserProfile(userId!);
    if (response.success && response.profile != null) {
      userProfile = response.profile;
      if (userProfile!.addresses.isNotEmpty) {
        countryController.text = userProfile!.addresses.first.country;
        postalCodeController.text = userProfile!.addresses.first.postalCode;
        cityController.text = userProfile!.addresses.first.city;
        streetController.text = userProfile!.addresses.first.street;
      }
    }
    isLoading = false;
    notifyListeners();
  }

  // Address form controllers
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  // Selected payment option index
  int selectedPaymentOptionIndex = 0;

  void selectPaymentOption(int index) {
    for (int i = 0; i < paymentOptions.length; i++) {
      paymentOptions[i]["isSelected"] = (i == index);
    }
    selectedPaymentOptionIndex = index;
    notifyListeners();
  }

  void selectAddress(int index) {
    selectedAddressIndex = index;
    notifyListeners();
  }

  Future<void> placeOrder(BuildContext context) async {
    if (cartItems.isEmpty) {
      showErrorSnackBar(
          "Error", "Your cart is empty. Please add items to proceed.");
      return;
    }
    await confirmOrder(context);
  }

  void navigateBack() {
    _navigationService.back();
  }

  void navigateToAddPaymentView() {
    _navigationService.navigateToView(const AddPaymentView());
  }

  @override
  void dispose() {
    streetController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    countryController.dispose();
    super.dispose();
  }

  Future<void> updateAddress() async {
    isLoading = true;
    notifyListeners();

    var response = await _databaseService.updateAddress(
      UpdateAddress(
        street: streetController.text,
        city: cityController.text,
        postalCode: postalCodeController.text,
        country: countryController.text,
        addressId: userProfile!.addresses.first.id,
      ),
    );

    if (response.success) {
      userProfile!.addresses[0] = Address(
        street: streetController.text,
        city: cityController.text,
        postalCode: postalCodeController.text,
        country: countryController.text,
        id: userProfile!.addresses.first.id,
      );
    }

    streetController.clear();
    cityController.clear();
    postalCodeController.clear();
    countryController.clear();

    isLoading = false;
    notifyListeners();
  }

  Future<void> confirmOrder(BuildContext context) async {
    setBusy(true);
    notifyListeners();

    // Map cartItems to OrderRequestItem list, including quantity
    final orderItems = cartItems.map((entry) {
      final item = entry['item'] as MenuItem;
      final quantity = entry['quantity'] as int;
      return OrderRequestItem(
        menuItem: item.id,
        quantity: quantity,
      );
    }).toList();

    // Use the selected address for delivery
    Address deliveryAddress;
    if (userProfile!.addresses.isNotEmpty) {
      deliveryAddress = userProfile!.addresses[selectedAddressIndex];
    } else {
      // Fallback to form input if no addresses exist
      deliveryAddress = Address(
        street: streetController.text,
        city: cityController.text,
        postalCode: postalCodeController.text,
        country: countryController.text,
      );
    }

    // Create the OrderRequest
    final orderRequest = OrderRequest(
      items: orderItems,
      deliveryType: "Delivery",
      deliveryAddress: deliveryAddress,
    );

    // Make the API call
    var response = await _databaseService.confirmOrder(orderRequest);

    if (response.success) {
      cartItems.clear();
      await _storageService.clearCart();
      notifyListeners();
      _navigationService.clearStackAndShow(Routes.navigationView);
      showSuccessSnackBar("Success", "Order placed successfully");
    } else {
      showErrorSnackBar("Error", "Error placing order: ${response.message}");
    }
    setBusy(false);
    notifyListeners();
  }
}
