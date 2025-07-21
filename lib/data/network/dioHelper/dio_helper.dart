import 'package:dio/dio.dart';
import '../../../core/utils/print/custom_print.dart';
import '../apiRoutes/api_routes.dart';
import '../handelError/handel_error.dart';
import '../networkHeaders/network_headers.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiRoutes.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<dynamic> getData({required String url, Map<String, dynamic>? query, String? token, data}) async {
    return await _handleRequest(
      request: () async => dio?.get(url, queryParameters: query, data: data, options: Options(headers: networkHeaders())),
      requestType: 'GET',
      url: url,
    );
  }

  static Future<dynamic> postData({required String url, Map<String, dynamic>? query, String? token, data}) async {
    return await _handleRequest(
      request: () async => dio?.post(url, queryParameters: query, data: data, options: Options(headers: networkHeaders())),
      requestType: 'POST',
      url: url,
    );
  }

  static Future<Response?> putData({required String url, data, String? token}) async {
    return await _handleRequest(
      request: () async => dio?.put(url, data: data, options: Options(headers: networkHeaders())),
      requestType: 'PUT',
      url: url,
    );
  }

  static Future<Response?> deleteData({required String url, String? token}) async {
    return await _handleRequest(
      request: () async => dio?.delete(url, options: Options(headers: networkHeaders())),
      requestType: 'DELETE',
      url: url,
    );
  }

  static Future<dynamic> _handleRequest({required Future<Response<dynamic>?> Function() request, required String requestType, required String url}) async {
    try {
      init();
      customPrint("$requestType URL: ${ApiRoutes.baseUrl}$url");
      return await request();
    } on DioException catch (e) {
      return handleDioError(e);
    }
  }
}