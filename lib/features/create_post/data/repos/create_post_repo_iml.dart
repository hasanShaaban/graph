import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/api_service.dart';
import '../../../auth/data/repos/auth_local_data_source.dart';
import '../models/new_post_model.dart';
import '../../domain/repos/create_post_repo.dart';

class CreatePostRepoIml implements CreatePostRepo {
  final SecureApiService apiService;
  final AuthLocalDataSource authLocalDataSource;

  CreatePostRepoIml(this.apiService, this.authLocalDataSource);

  @override
  Future<Either<Failures, Map<String, dynamic>>> postNewPost({
    required NewPostModel newPostModel,
  }) async {
    try {
      List<MultipartFile>? files;
      if (newPostModel.image != null && newPostModel.image!.isNotEmpty) {
        files = [];
        for (var file in newPostModel.image!) {
          files.add(
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          );
        }
      }

      // بناء FormData
      FormData formData = FormData.fromMap({
        'description': newPostModel.description,
        if (newPostModel.title != null) 'title': newPostModel.title,
        if (newPostModel.projectId != null)
          'project_id': newPostModel.projectId,
        'privacy': newPostModel.privacy,
        if (newPostModel.mentionIds != null) 
        'ids[]': newPostModel.mentionIds,
          if (newPostModel.newHashtags != null && newPostModel.newHashtags!.isNotEmpty)
    'new_hashtags[]': newPostModel.newHashtags,
  if (newPostModel.hashIds != null && newPostModel.hashIds!.isNotEmpty)
    'hash_id[]': newPostModel.hashIds,
        if (files != null) 'files[]': files,
      });
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'posts/make',
        data: formData, 
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Accept': 'application/json',
          },
        ),
      );

      print('Response from post new post: $response');
      log(
        'Response from postNewPost: $response',
        name: 'CreatePostRepoImpl.postNewPost',
      );

      return right(response);
    } catch (e) {
      if (e is DioException) {
        print("Dio exception: ${e.message}");
        print("Status code: ${e.response?.statusCode}");

        print('Dio exception: ${e.response?.data}');
        return left(ServerFailure.fromDioError(e));
      }
      print('Unexpected error: $e');
      log(
        'Unexpected error in postNewPost',
        name: 'CreatePostRepoImpl.postNewPost',
        error: e,
        stackTrace: StackTrace.current,
      );

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> getAllProject() async {
    try {
      Map<String, dynamic> response = await apiService.get(
        endPoints: 'get_all_projects',
      );

      print('Response for get all projects : $response');

      return right(response);
    } catch (e) {
      if (e is DioException) {
        print('Dio exception: ${e.response?.data}');
        return left(ServerFailure.fromDioError(e));
      }
      print('Unexpected error: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> postSearch({
    required String name,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'student/find',
        data: {'name': name},

        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      log('Response from search: $response');

      return right(response);
    } catch (e) {
      if (e is DioException) {
        log('Dio exception: ${e.response?.data}');
        return left(ServerFailure.fromDioError(e));
      }
      log('Unexpected error: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> postHashtagSearch({
    required String name,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'search/Hashtags',
        data: {'query': name},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      log('Response from postHashtagSearch: $response');

      return right(response);
    } catch (e) {
      if (e is DioException) {
        log('Dio exception: ${e.response?.data}');
        return left(ServerFailure.fromDioError(e));
      }
      log('Unexpected error: $e');
      return left(ServerFailure(e.toString()));
    }
  }
}
