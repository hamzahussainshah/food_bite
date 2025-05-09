import 'package:food_bite/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HistoryViewModel extends BaseViewModel {
  final NavigationService _navigationService = NavigationService();

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  // Separate lists for Ongoing and History orders
  List<Map<String, dynamic>> _ongoingOrders = [
    {
      'id': 1,
      'name': 'Margherita Pizza',
      'price': 40,
      'items': 2,
      'status': 'Ongoing',
      'date': 'Tuesday, 03 March 2023',
    },
    {
      'id': 2,
      'name': 'Margherita Pizza',
      'price': 40,
      'items': 2,
      'status': "Ongoing",
      'date': 'Tuesday, 03 March 2023',
    },
  ];

  List<Map<String, dynamic>> _historyOrders = [
    {
      'id': 3,
      'name': 'Cheese Burger',
      'price': 25,
      'items': 1,
      'status': 'Delivered',
      'date': 'Monday, 02 March 2023',
    },
    {
      'id': 4,
      'name': 'Pepperoni Pizza',
      'price': 35,
      'items': 3,
      'status': 'Delivered',
      'date': 'Sunday, 01 March 2023',
    },
  ];

  // Expose the lists directly
  List<Map<String, dynamic>> get ongoingOrders => _ongoingOrders;
  List<Map<String, dynamic>> get historyOrders => _historyOrders;

  // Getter to return the appropriate list based on the tabIndex (for compatibility)
  List<Map<String, dynamic>> get orders =>
      _tabIndex == 0 ? _ongoingOrders : _historyOrders;

  void setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }

  void navigateToTrackOrder() {
    print('Navigating to TrackView...');
    // Example: _navigationService.navigateTo(TrackView());
  }

  void navigateToRateDriverView() {
    _navigationService.navigateToRateDriverView();
  }

  void cancelOrder(int orderId) {
    _ongoingOrders.removeWhere((order) => order['id'] == orderId);
    print('Cancelled ongoing order with ID $orderId...');
    notifyListeners();
  }
}
