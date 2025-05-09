class Reservation {
  final String? user; // Used in response
  final DateTime reservationDate;
  final String reservationTime;
  final int guestCount;
  final String? status; // Used in response
  final String notes;
  final String? id; // "_id" in response
  final DateTime? createdAt; // Used in response
  final DateTime? updatedAt; // Used in response
  final int? version; // "__v" in response

  Reservation({
    this.user,
    required this.reservationDate,
    required this.reservationTime,
    required this.guestCount,
    this.status,
    required this.notes,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  // Convert Reservation object to JSON (for request)
  Map<String, dynamic> toJson() {
    return {
      if (user != null) 'user': user,
      'reservationDate': reservationDate.toIso8601String(),
      'reservationTime': reservationTime,
      'guestCount': guestCount,
      if (status != null) 'status': status,
      'notes': notes,
      if (id != null) '_id': id,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
      if (version != null) '__v': version,
    };
  }

  // Create Reservation object from JSON (for response)
  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      user: json['user'] as String?,
      reservationDate: DateTime.parse(json['reservationDate'] as String),
      reservationTime: json['reservationTime'] as String,
      guestCount: json['guestCount'] as int,
      status: json['status'] as String?,
      notes: json['notes'] as String,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      version: json['__v'] as int?,
    );
  }
}
