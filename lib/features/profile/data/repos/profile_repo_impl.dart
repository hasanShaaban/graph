import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/features/profile/data/models/profile_model.dart';
import 'package:graph/features/profile/domain/entity/profile_entity.dart';
import 'package:graph/features/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final SecureApiService apiService;

  ProfileRepoImpl(this.apiService);
  @override
  Future<Either<Failures, ProfileEntity>> getProfileData() async {
    try {
      var data = await apiService.get(endPoints: 'user/info?');
      ProfileModel response = ProfileModel.fromJson(data);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
