import 'package:food_bite/data_service/data_model/review.dart';

class MenuItem {
  final String id;
  final String name;
  final String description;
  final String category;
  final int price;
  final List<String> images;
  final bool availability;
  final List<String> ingredients;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? quantity;
  final List<Review>? reviews; // Already nullable
  final int v;

  MenuItem({
    this.quantity,
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.images,
    required this.availability,
    required this.ingredients,
    required this.createdAt,
    required this.updatedAt,
    this.reviews, // Made optional to allow null
    required this.v,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: json['price'] as int,
      quantity: json['quantity'] as int?,
      images: List<String>.from(json['images'] ?? []),
      availability: json['availability'] as bool,
      ingredients: List<String>.from(json['ingredients'] ?? []),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      reviews: json['reviews'] != null
          ? (json['reviews'] as List<dynamic>)
              .map((reviewJson) =>
                  Review.fromJson(reviewJson as Map<String, dynamic>))
              .toList()
          : null, // Changed to null instead of empty list
      v: json['__v'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'images': images,
      'availability': availability,
      'ingredients': ingredients,
      'quantity': quantity,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'reviews': reviews
          ?.map((review) => review.toJson())
          .toList(), // Null-aware operator
      '__v': v,
    };
  }
}
