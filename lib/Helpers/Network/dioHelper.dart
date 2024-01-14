import 'package:dio/dio.dart';
import 'package:store_app_flutter/EndPoints/endpints.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(baseUrl: baseUrl, receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return await dio.get(url,
        queryParameters: query,
        data: data,
        options: Options(
            headers: {'Content-type': 'application/x-www-form-urlencoded'}));
  }

// post data to api
  static Future<Response> postData({
    Map<String, dynamic>? query,
    required String url,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json'
    };
    return await dio.post(url,
        data: data,
        queryParameters: query,
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json'
        }));
  }

  static Future<Response> putData({
    Map<String, dynamic>? query,
    required String url,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json'
    };
    return await dio.put(url,
        data: data,
        queryParameters: query,
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json'
        }));
  }
}
