import 'package:food_bite/app/app.locator.dart';

import '../core/end_points/api_end_points.dart';
import '../data_service/data_model/menu_model.dart';
import '../data_service/responses/base_response/base_response.dart';
import '../data_service/responses/menu_response.dart';
import 'api_service.dart';

class DatabaseService {
  final ApiService _apiService = locator<ApiService>();

  Future<MenuResponse> getMenu() async {
    final BaseResponse response = await _apiService.get(
      endPoint: ApiEndPoints.getMenu,
    );

    if (response.success && response.data is List) {
      List<MenuItem> items = (response.data as List)
          .map((item) => MenuItem.fromJson(item))
          .toList();

      return MenuResponse(true, items: items);
    } else {
      return MenuResponse(false, message: response.message);
    }
  }
}
