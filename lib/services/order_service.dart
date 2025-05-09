import 'package:food_bite/data_service/data_model/order_model.dart';
import 'package:food_bite/services/database_service.dart';
import 'package:stacked/stacked.dart';

class OrderService with ListenableServiceMixin {
  final DatabaseService _databaseService;

  OrderService(this._databaseService) {
    listenToReactiveValues([_ongoingOrders, _historyOrders]);
  }

  final ReactiveList<Order> _ongoingOrders = ReactiveList<Order>();
  final ReactiveList<Order> _historyOrders = ReactiveList<Order>();

  List<Order> get ongoingOrders => _ongoingOrders;
  List<Order> get historyOrders => _historyOrders;

  Future<void> fetchOrders() async {
    final response = await _databaseService.getUserOrders();
    if (response.success && response.orders != null) {
      _ongoingOrders
        ..clear()
        ..addAll(response.orders!.where((o) => o.orderStatus != "Delivered"));

      _historyOrders
        ..clear()
        ..addAll(response.orders!.where((o) => o.orderStatus == "Delivered"));

      notifyListeners();
    }
  }

  void addOrder(Order newOrder) {
    if (newOrder.orderStatus == "Delivered") {
      _historyOrders.insert(0, newOrder);
    } else {
      _ongoingOrders.insert(0, newOrder);
    }
    notifyListeners();
  }

  void removeOrder(String orderId) {
    _ongoingOrders.removeWhere((o) => o.id == orderId);
    _historyOrders.removeWhere((o) => o.id == orderId);
    notifyListeners();
  }

}
