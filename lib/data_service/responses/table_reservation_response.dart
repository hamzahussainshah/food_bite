import '../data_model/reservation.dart';
import 'base_response/base_response.dart';

class ReservationResponse extends BaseResponse {
  Reservation? reservation;

  ReservationResponse(bool success, {String? message, this.reservation})
      : super(success, message: message);

  factory ReservationResponse.fromJson(Map<String, dynamic> json) {
    return ReservationResponse(
      json['success'] ?? true, // Default to true since API indicates success
      message: json['message'] ?? 'Success',
      reservation: json['reservation'] != null
          ? Reservation.fromJson(json['reservation'] as Map<String, dynamic>)
          : null,
    );
  }
}
