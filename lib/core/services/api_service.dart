import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final _baseURL = 'http://127.0.0.1:8000/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoints,
    var data,
  }) async {
    var response = await _dio.get('$_baseURL$endPoints', queryParameters: data);
    log('$_baseURL$endPoints');
    print(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    var data,
    Options? options,
  }) async {
    var response = await _dio.post('$_baseURL$endPoint', data: data);
    print(response.data);
    return response.data;
  }
}
