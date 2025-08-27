import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/pritty_log.dart';
import '../../../auth/data/repos/auth_local_data_source.dart';
import '../models/profile_model.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/repos/profile_repo.dart';

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
