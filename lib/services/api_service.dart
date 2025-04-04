import 'package:dio/dio.dart';
import '../app/app.locator.dart';
import '../core/config/config.dart';
import '../data_service/responses/request_response.dart';
import '../ui/widgets/custom_logger/custom_logger.dart';
import 'local_storage_service.dart';

class ApiService {
  final CustomLogger _logger = CustomLogger(className: 'ApiService');
  final Config _config = locator<Config>(); // Use the registered Config class

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
    dio.options.validateStatus = (s) {
      return s != null && s < 500;
    };
    return dio;
  }

  // Dynamic GET request method using the config base URL
  get({required String endPoint, params}) async {
    Dio dio = await launchDio();
    final response =
    await dio.get('${_config.baseUrl}/$endPoint', queryParameters: params);
    return _processResponse(response);
  }

  // Dynamic POST request method using the config base URL
  post({
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
    } catch (e) {
      return RequestResponse(false, e.toString(), null);
    }
  }

  // Dynamic PUT request method using the config base URL
  put({
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
      return RequestResponse(false, e.toString(), null);
    }
  }

  // Remove the hardcoded postLocal, use the post method dynamically
  RequestResponse _processResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return RequestResponse(true, "Success", response.data);
    } else if (response.statusCode == 500) {
      return RequestResponse(
          false, response.data['message'] ?? 'Server Error', null);
    } else {
      return RequestResponse(
          false, response.data['message'] ?? 'Network Error', null);
    }
  }



}
