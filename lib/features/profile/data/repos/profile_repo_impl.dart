import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/api_service.dart';
//import '../../../../core/utils/pritty_log.dart';
import '../../../auth/data/repos/auth_local_data_source.dart';
import '../models/profile_model.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/repos/profile_repo.dart';

import 'package:graph/core/functions/pritty_log.dart';
import 'package:graph/core/utils/years_and_major.dart';
import 'package:graph/features/main/data/models/noraml_post_model.dart';
import 'package:graph/features/main/domain/entity/noraml_post_entity.dart';
import 'package:graph/features/profile/data/repos/profile_local_data_source.dart';

class ProfileRepoImpl implements ProfileRepo {
  final SecureApiService apiService;
  final AuthLocalDataSource authLocalDataSource;
  final ProfileLocalDataSource profileLocalDataSource;

  ProfileRepoImpl(
    this.apiService,
    this.authLocalDataSource,
    this.profileLocalDataSource,
  );
  @override
  Future<Either<Failures, ProfileEntity>> getProfileData() async {
    int id = await authLocalDataSource.getUserId();
    try {
      var data = await apiService.get(endPoints: 'user/info/$id?');
      ProfileModel response = ProfileModel.fromJson(data['data']);
      int year = await profileLocalDataSource.getStudentYear();

      if (year == 0) {
        profileLocalDataSource.setStudentYear(
          Year.yearbyName[response.year[0]]!,
        );
        int major = await profileLocalDataSource.getStudentMajor();
        if (response.major.isNotEmpty && major == 0) {
          profileLocalDataSource.setStudentMajor(
            Major.major[response.major[0]],
          );
        }
        profileLocalDataSource.setStudentName(response.name);
        if(response.image != null) {
          profileLocalDataSource.setUserImage(response.image!);
        }
        
      }
      prettyLog(response.toJson());
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<NormalPostEntity>>> getProfilePosts() async {
    int id = await authLocalDataSource.getUserId();
    try {
      var data = await apiService.get(endPoints: 'user/posts/$id?');

      final List<NormalPostModel> response =
          (data['data'] as List)
              .map((e) => NormalPostModel.fromJson(e as Map<String, dynamic>))
              .toList();

      prettyLog(response[0].toJson());
      return right(response);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Dio exception: ${e.response?.data}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Unexpected error: $e');
      return left(ServerFailure(e.toString()));
    }
  }
}
