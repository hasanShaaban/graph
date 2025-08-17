import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

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
    log(response.data);
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    var data,
    Options? options,
  }) async {
    final token = Hive.box('authBox').get('token');

    final headers = {
      //if (token != null) 'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...?options?.headers,
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    final mergedOptions = Options(headers: headers);
    var response = await _dio.post(
      '$_baseURL$endPoint',
      data: data,
      options: mergedOptions,
    );
    print(response.data);

    //return response.data;
    if (response.data is Map<String, dynamic>) {
      return response.data;
    } else if (response.data is String) {
      return {'message': response.data}; // نغلفها بـ Map
    } else {
      return {'error': 'Unexpected response type'};
    }
  }

  Future<File> getAssetAsFile(String assetPath) async {
    // 1. نقرأ الصورة من مجلد assets
    final byteData = await rootBundle.load(assetPath);

    // 2. نحصل على مجلد مؤقت داخل جهاز المستخدم
    final tempDir = await getTemporaryDirectory();

    // 3. ننشئ ملف بنفس اسم الصورة داخل المجلد المؤقت
    final file = File('${tempDir.path}/${assetPath.split('/').last}');

    // 4. نكتب محتوى الصورة فيه
    await file.writeAsBytes(byteData.buffer.asUint8List());

    return file; // ✅ هذا الملف صار جاهز للإرسال
  }
}
