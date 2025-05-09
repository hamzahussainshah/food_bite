import '../data_model/menu_model.dart';
import 'base_response/base_response.dart';

class MenuResponse extends BaseResponse {
  List<MenuItem> items;

  MenuResponse(bool success, {String? message, List<MenuItem>? items})
      : items = items ?? [],
        super(success, message: message);

  factory MenuResponse.fromJson(dynamic json) {
    List<MenuItem> parsedItems = [];
    bool isSuccess = false;

    if (json is Map && json['data'] is List) {
      parsedItems =
          (json['data'] as List).map((e) => MenuItem.fromJson(e)).toList();
      isSuccess = true;
    } else if (json is List) {
      parsedItems = json.map((e) => MenuItem.fromJson(e)).toList();
      isSuccess = true;
    }

    return MenuResponse(isSuccess, items: parsedItems);
  }
}
