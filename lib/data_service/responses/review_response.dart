import '../data_model/review.dart';
import 'base_response/base_response.dart';

class ReviewResponse extends BaseResponse {
  List<Review>? reviews;

  ReviewResponse(bool success, {String? message, this.reviews})
      : super(success, message: message);

  factory ReviewResponse.fromJson(Map<String, dynamic> json) {
    return ReviewResponse(
      json['success'] ?? true,
      message: json['message'] ?? 'Success',
      reviews: json['reviews'] != null
          ? (json['reviews'] as List<dynamic>)
              .map((reviewJson) =>
                  Review.fromJson(reviewJson as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  // If the API returns a direct array of reviews (not wrapped in a "reviews" field)
  factory ReviewResponse.fromJsonArray(List<dynamic> jsonArray) {
    return ReviewResponse(
      true, // Assume success since the API returned data
      message: 'Reviews fetched successfully',
      reviews: jsonArray
          .map((reviewJson) =>
              Review.fromJson(reviewJson as Map<String, dynamic>))
          .toList(),
    );
  }
}
