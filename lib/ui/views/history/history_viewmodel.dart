import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/ui/widgets/snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../../../data_service/data_model/menu_model.dart';
import '../../../data_service/data_model/order_model.dart';
import '../../../services/database_service.dart';
import '../../../services/local_storage_service.dart'; // Import LocalStorageService
import '../../../services/order_service.dart';
import '../../common/assets.dart';

class HistoryViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final OrderService _ordersService = locator<OrderService>();
  final LocalStorageService _storageService = locator<LocalStorageService>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Order> get ongoingOrders => _ordersService.ongoingOrders;
  List<Order> get historyOrders => _ordersService.historyOrders;

  @override
  List<ListenableServiceMixin> get reactiveServices => [_ordersService];

  Future<void> getUserOrders() async {
    _isLoading = true;
    await _ordersService.fetchOrders();
    _isLoading = false;
  }

  void cancelOrder(String orderId) async {
    // Call API to cancel
    final success = await _databaseService.cancelOrder(orderId);
    if (success) {
      _ordersService.removeOrder(orderId);
    }
  }

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  // Separate lists for Ongoing and History orders using Order
  List<Order> _ongoingOrders = [];
  List<Order> _historyOrders = [];

  // Expose the lists directly

  Map<String, MenuItem> _menuItemsMap = {};

  // Getter to return the appropriate list based on the tabIndex (for compatibility)
  List<Order> get orders => _tabIndex == 0 ? _ongoingOrders : _historyOrders;


  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  HistoryViewModel() {
    _fetchMenuItemsFromStorage();
    getUserOrders();
  }

  void setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }

  void navigateToTrackOrder() {
    print('Navigating to TrackView...');
    _navigationService.navigateTo(Routes.trackView);
  }

  void navigateToRateDriverView() {
    _navigationService.navigateTo(Routes.rateDriverView);
  }


  // Method to fetch menu items from local storage and populate _menuItemsMap
  Future<void> _fetchMenuItemsFromStorage() async {
    try {
      List<MenuItem> menuItems = _localStorageService.getMenuItems();
      _menuItemsMap = {
        for (var item in menuItems) item.id: item,
      };
      print("Fetched ${_menuItemsMap.length} menu items from local storage");
    } catch (e) {
      print("Error fetching menu items from local storage: $e");
    }
  }

  // Future<void> getUserOrders() async {
  //   _isLoading = true;
  //   _errorMessage = null;
  //   notifyListeners();
  //
  //   // Fetch menu items from local storage before processing orders
  //   await _fetchMenuItemsFromStorage();
  //
  //   var response = await _databaseService.getUserOrders();
  //   if (response.success && response.orders != null) {
  //     // Clear existing lists
  //     _ongoingOrders.clear();
  //     _historyOrders.clear();
  //
  //     // Categorize orders based on orderStatus
  //     for (var order in response.orders!) {
  //       if (order.orderStatus == "Delivered") {
  //         _historyOrders.add(order);
  //       } else {
  //         // Includes "Ready", "Received", "Out for Delivery", "Preparing"
  //         _ongoingOrders.add(order);
  //       }
  //     }
  //
  //     print("Ongoing Orders: ${_ongoingOrders.length}");
  //     print("History Orders: ${_historyOrders.length}");
  //   } else {
  //     _errorMessage = response.message ?? "Failed to fetch user orders";
  //     print(_errorMessage);
  //   }
  //
  //   _isLoading = false;
  //   notifyListeners();
  // }

  // Method to get the name of a menu item by its ID
  String getMenuItemName(String menuItemId) {
    return _menuItemsMap[menuItemId]?.name ??
        menuItemId; // Fallback to ID if name not found
  }

  // Method to get the image URL of a menu item by its ID
  String? getMenuItemImage(String menuItemId) {
    final menuItem = _menuItemsMap[menuItemId];
    if (menuItem != null &&
        menuItem.images != null &&
        menuItem.images!.isNotEmpty) {
      return menuItem.images!.first; // Return the first image if available
    }
    return AppImages.burger; // Fallback to default image
  }

  Future<void> rateItem(String orderId) async {

    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.rateItem,
      title: "Rate Item",
      barrierDismissible: true,
    );
    if (response!.confirmed) {
      submitRating(
          rating: response.data['rating'],
          comment: response.data['comment'],
          orderId: orderId);
    } else {
      print("Rating cancelled");
    }
  }

  Future<void> submitRating({
    required int rating,
    required String comment,
    required String orderId,
  }) async {
    setBusy(true);
    var response = await _databaseService.submitRating(
      rating: rating,
      comment: comment,
      orderId: orderId,
    );
    if (response.success) {
      showSuccessSnackBar("Success", "Review submitted successfully");
      getUserOrders();
      _navigationService.popUntil(
        (route) => route.settings.name == Routes.navigationView,
      );
    } else {
      showErrorSnackBar(
          "Error", "Failed to submit review: ${response.message}");
      // Handle error
      print("Error submitting rating: ${response.message}");
    }
    notifyListeners();
    setBusy(false);
  }

  void navigateToMenuView() {
    _navigationService.navigateToMenuView();
  }
}
