class BaseResponse {
  late bool success;
  String? message;
  dynamic data;

  BaseResponse(this.success, {this.message, this.data});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? json['status'] ?? false;
    message = json['message'] ?? 'An error occurred';
    data = json['data'] ?? json['user'];
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }
}
