import 'package:dio/dio.dart';
import 'package:rental_app/utils/server_constants.dart';


class ApiServices {
  final Dio _dio = Dio();
  ApiServices() {
    _dio.options.baseUrl = ServerConstants.baseUrl;
  }

  Future<dynamic> getCall(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> postCall(String path, dynamic data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } catch (e) {
      return e;
    }
  }
}
