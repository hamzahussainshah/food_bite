import 'package:food_bite/app/app.locator.dart';
import 'package:food_bite/data_service/body/address_model.dart';
import 'package:food_bite/data_service/body/order_request.dart';
import 'package:food_bite/data_service/responses/address_response.dart';
import 'package:food_bite/data_service/responses/order_response.dart';
import 'package:food_bite/data_service/responses/signup_response.dart';
import 'package:food_bite/data_service/responses/table_reservation_response.dart';

import '../core/end_points/api_end_points.dart';
import '../data_service/data_model/menu_model.dart';
import '../data_service/data_model/update_address_model.dart';
import '../data_service/responses/auth_response.dart';
import '../data_service/responses/base_response/base_response.dart';
import '../data_service/responses/menu_response.dart';
import '../data_service/responses/order_confirmation_response.dart';
import '../data_service/responses/order_status_response.dart';
import '../data_service/responses/review_response.dart';
import '../data_service/responses/user_profile_response.dart';
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

  Future<UserProfileResponse> getUserProfile(String userId) async {
    final BaseResponse response = await _apiService.get(
      endPoint: "${ApiEndPoints.userProfile}/$userId",
    );
    var userResponse = response.success
        ? UserProfileResponse.fromJson(response.data)
        : UserProfileResponse(false, message: response.message);

    return userResponse;
  }

  Future<OrderConfirmationResponse> confirmOrder(
      OrderRequest orderRequest) async {
    final BaseResponse response = await _apiService.post(
      endPoint: ApiEndPoints.order,
      data: orderRequest.toJson(),
    );
    var orderResponse = response.success
        ? OrderConfirmationResponse.fromJson(response.data)
        : OrderConfirmationResponse(false, message: response.message);
    return orderResponse;
  }

  Future<OrderStatusResponse> getUserOrders() async {
    final BaseResponse response = await _apiService.get(
      endPoint: ApiEndPoints.order,
    );
    var orderResponse = response.success
        ? OrderStatusResponse.fromJson(response.data)
        : OrderStatusResponse(false, message: response.message);
    return orderResponse;
  }

  Future<UserProfileResponse> updateUserProfile(
      {required String userId,
      required String phoneNumber,
      required String name}) async {
    final BaseResponse response = await _apiService.put(
      endPoint: "${ApiEndPoints.userProfile}/$userId",
      data: {
        "name": name,
        "phoneNumber": phoneNumber,
      },
    );
    var userResponse = response.success
        ? UserProfileResponse.fromJson(response.data)
        : UserProfileResponse(false, message: response.message);

    return userResponse;
  }

  Future<ReservationResponse> makeReservation(
      Map<String, dynamic> reservationData) async {
    final BaseResponse response = await _apiService.post(
        endPoint: ApiEndPoints.reservations, data: reservationData);
    var reservationResponse = response.success
        ? ReservationResponse.fromJson(response.data)
        : ReservationResponse(false, message: response.message);

    return reservationResponse;
  }

  Future<BaseResponse> submitRating(
      {required int rating,
      required String comment,
      required String orderId}) async {
    final BaseResponse response = await _apiService.post(
      endPoint: ApiEndPoints.reviews,
      data: {
        "dishId": orderId,
        "rating": rating,
        "comment": comment,
      },
    );

    return response;
  }

  Future<AddressResponse> addAddress(Address newAddress) async {
    try {
      final BaseResponse response = await _apiService.post(
        endPoint:
            "${ApiEndPoints.address}/${newAddress.id ?? "q2345frTG64D7RTG"}",
        data: newAddress.toJson(),
      );

      print('addAddress Response: ${response.toJson()}'); // Debug log

      if (response.success) {
        // Parse the response.data (Map<String, dynamic>) into AddressResponse
        return AddressResponse.fromJson({
          'success': true,
          'message': response.message,
          'addresses': response.data['addresses'], // Extract the addresses list
        });
      } else {
        return AddressResponse(
          false,
          addresses: [],
          message: response.message ?? 'Failed to add address',
        );
      }
    } catch (e) {
      print('addAddress Error: $e'); // Debug log
      return AddressResponse(
        false,
        addresses: [],
        message: 'Error adding address: $e',
      );
    }
  }

  Future<AddressResponse> updateAddress(UpdateAddress newAddress) async {
    try {
      final BaseResponse response = await _apiService.post(
        endPoint:
            "${ApiEndPoints.address}/${newAddress.addressId ?? "q2345frTG64D7RTG"}",
        data: newAddress.toJson(),
      );

      print('addAddress Response: ${response.toJson()}'); // Debug log

      if (response.success) {
        // Parse the response.data (Map<String, dynamic>) into AddressResponse
        return AddressResponse.fromJson({
          'success': true,
          'message': response.message,
          'addresses': response.data['addresses'], // Extract the addresses list
        });
      } else {
        return AddressResponse(
          false,
          addresses: [],
          message: response.message ?? 'Failed to add address',
        );
      }
    } catch (e) {
      print('addAddress Error: $e'); // Debug log
      return AddressResponse(
        false,
        addresses: [],
        message: 'Error adding address: $e',
      );
    }
  }

  Future<ReviewResponse> getReviewsOnItem(String id) async {
    final BaseResponse response = await _apiService.get(
      endPoint: "${ApiEndPoints.reservations}/$id",
    );
    var reviewResponse = response.success
        ? ReviewResponse.fromJson(response.data)
        : ReviewResponse(false, message: response.message);

    return reviewResponse;
  }

  cancelOrder(String orderId) {}
}
