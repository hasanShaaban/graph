import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/features/auth/data/repos/auth_local_data_source.dart';
import 'package:graph/features/create_post/data/models/new_post_model.dart';
import 'package:graph/features/create_post/domain/repos/create_post_repo.dart';

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
        if (newPostModel.mentionIds != null) 'ids[]': newPostModel.mentionIds,
        if (files != null) 'files[]': files,
      });
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'posts/make',
        data: formData, // <-- هنا نرسل FormData بدل toJson
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
}
