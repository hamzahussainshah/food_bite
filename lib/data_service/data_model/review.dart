import '../responses/user_model.dart';

class Review {
  final String? id; // Nullable
  final User user;
  final String? dish; // Nullable
  final int rating;
  final String comment;
  final DateTime createdAt;
  final DateTime? updatedAt; // Nullable
  final int? version; // Nullable

  Review({
    this.id,
    required this.user,
    this.dish,
    required this.rating,
    required this.comment,
    required this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['_id'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      dish: json['dish'] as String?,
      rating: json['rating'] as int,
      comment: json['comment'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      version: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = {
      'user': user.toJson(),
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
    };
    if (id != null) map['_id'] = id!;
    if (dish != null) map['dish'] = dish!;
    if (updatedAt != null) map['updatedAt'] = updatedAt!.toIso8601String();
    if (version != null) map['__v'] = version!;
    return map;
  }
}
