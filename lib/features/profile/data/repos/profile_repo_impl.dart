
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/core/utils/pritty_log.dart';
import 'package:graph/features/auth/data/repos/auth_local_data_source.dart';
import 'package:graph/features/profile/data/models/profile_model.dart';
import 'package:graph/features/profile/domain/entity/profile_entity.dart';
import 'package:graph/features/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final SecureApiService apiService;
  final AuthLocalDataSource authLocalDataSource;

  ProfileRepoImpl(this.apiService, this.authLocalDataSource);
  @override
  Future<Either<Failures, ProfileEntity>> getProfileData() async {
    int id = await authLocalDataSource.getUserId();
    try {
      var data = await apiService.get(endPoints: 'user/info/$id?');
      ProfileModel response = ProfileModel.fromJson(data['data']);
      prettyLog(response.toJson());
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
