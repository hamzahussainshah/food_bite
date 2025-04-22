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
    required this.v,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      quantity: json['quantity'],
      images: List<String>.from(json['images']),
      availability: json['availability'],
      ingredients: List<String>.from(json['ingredients']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
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
      '__v': v,
    };
  }
}
