import 'package:dio/dio.dart';

import '../app/app.locator.dart';
import '../core/config/config.dart';
import '../data_service/responses/base_response/base_response.dart';
import '../ui/widgets/custom_logger/custom_logger.dart';
import 'local_storage_service.dart';

class ApiService {
  final CustomLogger _logger = CustomLogger(className: 'ApiService');
  final Config _config = locator<Config>();

  Future<Dio> launchDio({bool? isMultiform = false}) async {
    String? accessToken = locator<LocalStorageService>().accessToken;
    Dio dio = Dio();

    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
    ));

    dio.options.headers['Content-Type'] =
        isMultiform == true ? 'multipart/form-data' : 'application/json';
    dio.options.headers["accept"] = 'application/json';

    if (accessToken != null) {
      dio.options.headers["Authorization"] = 'Bearer $accessToken';
    }

    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) {
      return status != null && status < 500;
    };

    // **Timeout settings**
    dio.options.connectTimeout = const Duration(seconds: 10); // 10 seconds
    dio.options.receiveTimeout = const Duration(seconds: 15);
    return dio;
  }

  Future<BaseResponse> get({required String endPoint, params}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.get('${_config.baseUrl}/$endPoint',
          queryParameters: params);
      return _processResponse(response);
    } catch (e) {
      return BaseResponse(false, message: e.toString());
    }
  }

  Future<BaseResponse> post({
    required String endPoint,
    dynamic data,
    bool? isMultiform = false,
    dynamic params,
  }) async {
    Dio dio = await launchDio(isMultiform: isMultiform);
    try {
      final response = await dio.post('${_config.baseUrl}/$endPoint',
          data: data, queryParameters: params);
      return _processResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return BaseResponse(false, message: "Unexpected error: ${e.toString()}");
    }
  }

  Future<BaseResponse> put({
    required String endPoint,
    dynamic data,
    bool? isMultiform = false,
    dynamic params,
  }) async {
    Dio dio = await launchDio(isMultiform: isMultiform);
    try {
      final response = await dio.put('${_config.baseUrl}/$endPoint',
          data: data, queryParameters: params);
      return _processResponse(response);
    } catch (e) {
      return BaseResponse(false, message: e.toString());
    }
  }

  Future<BaseResponse> delete({
    required String endPoint,
    dynamic params,
  }) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.delete('${_config.baseUrl}/$endPoint',
          queryParameters: params);
      return _processResponse(response);
    } catch (e) {
      return BaseResponse(false, message: e.toString());
    }
  }

  Future<BaseResponse> patch({
    required String endPoint,
    dynamic data,
    bool? isMultiform = false,
    dynamic params,
  }) async {
    Dio dio = await launchDio(isMultiform: isMultiform);
    try {
      final response = await dio.patch('${_config.baseUrl}/$endPoint',
          data: data, queryParameters: params);
      return _processResponse(response);
    } catch (e) {
      return BaseResponse(false, message: e.toString());
    }
  }

  BaseResponse _processResponse(Response response) {
    _logger.t('Response status code: ${response.statusCode}');
    _logger.t('Response headers: ${response.headers}');
    _logger.t('Response Text:');
    _logger.t(response.data);

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.data is List) {
        return BaseResponse(
          true,
          message: 'Success',
          data: response.data,
        );
      } else if (response.data is Map<String, dynamic>) {
        return BaseResponse(
          true,
          message: response.data['message'] ?? 'Success',
          data: response.data,
        );
      } else {
        return BaseResponse(
          false,
          message: 'Invalid response format',
          data: response.data,
        );
      }
    } else {
      return BaseResponse(
        false,
        message: response.data is Map<String, dynamic>
            ? response.data['message'] ?? 'An error occurred'
            : 'An error occurred',
        data: response.data,
      );
    }
  }

  BaseResponse _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return BaseResponse(false,
          message: "Connection timed out. Please check your network.");
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return BaseResponse(false,
          message: "Server took too long to respond. Try again later.");
    } else if (e.type == DioExceptionType.badResponse) {
      return BaseResponse(false,
          message: e.response?.data['message'] ?? "Server error occurred.");
    } else if (e.type == DioExceptionType.connectionError) {
      return BaseResponse(false,
          message: "No internet connection. Please check your network.");
    } else {
      return BaseResponse(false,
          message: "Something went wrong. Please try again.");
    }
  }
}
