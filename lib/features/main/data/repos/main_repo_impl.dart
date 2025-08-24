import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/core/functions/pritty_log.dart';
import 'package:graph/features/main/data/models/user_image_model.dart';
import 'package:graph/features/main/domain/entity/user_image_entity.dart';
import 'package:graph/features/main/domain/repos/main_repo.dart';

class MainRepoImpl extends MainRepo{

  final SecureApiService apiService;

  MainRepoImpl(this.apiService);

  @override
  Future<Either<Failures, UserImageEntity>> getUserProfileImage() async {
    try {
      var data = await apiService.get(endPoints: 'get/user_profile/info?');
      UserImageModel response = UserImageModel.fromJson(data);
      prettyLog(response.toJson());
      return right(response);
    } catch (e) {
      if (e is DioException) {
        prettyLog(e.message);
        return left(ServerFailure.fromDioError(e));

      }
      return left(ServerFailure(e.toString()));
    }
  }

}

