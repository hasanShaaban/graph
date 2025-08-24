import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:graph/features/auth/data/repos/auth_local_data_source.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

final _baseURL = 'http://127.0.0.1:8000/api/';

class PublicApiService {
  final Dio _dio;

  PublicApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoints,
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
    var response = await _dio.get(
      '$_baseURL$endPoints',
      queryParameters: data,
      options: mergedOptions,
    );
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
      return {'message': response.data};
    } else {
      return {'error': 'Unexpected response type'};
    }
  }

  Future<dynamic> put({
    required String endPoint,
    var data,
    Options? options,
  }) async {
    final token = Hive.box('authBox').get('token');

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...?options?.headers,
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    final mergedOptions = Options(headers: headers);
    var response = await _dio.put(
      '$_baseURL$endPoint',
      data: data,
      options: mergedOptions,
    );
    print(response.data);

    //return response.data;
    if (response.data is List<dynamic>) {
      return response.data;
    } else if (response.data is String) {
      return {'message': response.data};
    } else {
      return {'error': 'Unexpected response type'};
    }
  }

  Future<dynamic> delete({required String endPoint, Options? options}) async {
    final token = Hive.box('authBox').get('token');

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...?options?.headers,
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    final mergedOptions = Options(headers: headers);
    var response = await _dio.delete(
      '$_baseURL$endPoint',

      options: mergedOptions,
    );
    print(response.data);

    if (response.data is Map<String, dynamic>) {
      return response.data;
    } else if (response.data is String) {
      return {'message': response.data};
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

// class SecureApiService {
//   final Dio _dio;
//   final AuthLocalDataSource authLocalDataSource;
//   SecureApiService(this._dio, this.authLocalDataSource) {
    
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           final token = await authLocalDataSource.getToken();
//           if (token != null) {
//             options.queryParameters['token'] = token;
//           }
//           return handler.next(options);
//         },
//       ),
//     );
//   }
//   Future<Map<String, dynamic>> get({
//     required String endPoints,
//     var data,
//   }) async {
//     var response = await _dio.get('$_baseURL$endPoints', queryParameters: data);
//     log('$_baseURL$endPoints');
//     log('SECURE API SERVICE: get response ================ \n${response.data}');
//     return response.data;
//   }
// }

class SecureApiService {
  final Dio _dio;
  final AuthLocalDataSource authLocalDataSource;

  SecureApiService(this._dio, this.authLocalDataSource) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await authLocalDataSource.getToken();
          if (token != null) {
            options.queryParameters['token'] = token;
          }
          return handler.next(options);
        },
      ),
    );
  }

  final String _baseURL = 'http://127.0.0.1:8000/api/';

  Future<dynamic> get({
    required String endPoints,
    var data,
  }) async {
    var response = await _dio.get('$_baseURL$endPoints', queryParameters: data);
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    var data,
    Options? options,
  }) async {
    final token = await authLocalDataSource.getToken();

    final headers = {
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

    if (response.data is Map<String, dynamic>) {
      return response.data;
    } else if (response.data is String) {
      return {'message': response.data};
    } else {
      return {'error': 'Unexpected response type'};
    }
  }

  Future<dynamic> put({
    required String endPoint,
    var data,
    Options? options,
  }) async {
    final token = await authLocalDataSource.getToken();

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...?options?.headers,
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    final mergedOptions = Options(headers: headers);
    var response = await _dio.put(
      '$_baseURL$endPoint',
      data: data,
      options: mergedOptions,
    );

    if (response.data is Map<String, dynamic>) {
      return response.data;
    } else if (response.data is String) {
      return {'message': response.data};
    } else {
      return {'error': 'Unexpected response type'};
    }
  }

  Future<dynamic> delete({required String endPoint, Options? options}) async {
    final token = await authLocalDataSource.getToken();

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...?options?.headers,
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    final mergedOptions = Options(headers: headers);
    var response = await _dio.delete(
      '$_baseURL$endPoint',
      options: mergedOptions,
    );

    if (response.data is Map<String, dynamic>) {
      return response.data;
    } else if (response.data is String) {
      return {'message': response.data};
    } else {
      return {'error': 'Unexpected response type'};
    }
  }
}
