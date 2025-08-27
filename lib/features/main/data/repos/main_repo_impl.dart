import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/features/main/data/models/change_password_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/api_service.dart';
//import '../../../../core/utils/pritty_log.dart';
import '../models/user_image_model.dart';
import '../../domain/entity/user_image_entity.dart';
import '../../domain/repos/main_repo.dart';

import 'package:graph/core/functions/pritty_log.dart';


class MainRepoImpl extends MainRepo {
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

  @override
  Future<Either<Failures, Map<String, dynamic>>> changePassword({
    required ChangePasswordModel changePasswordModel,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'user/change-password',
        data: changePasswordModel.toJson(),
      );

      prettyLog(response.toString());

      return right(response);
    } catch (e) {
      if (e is DioException) {
        prettyLog("Dio exception: ${e.message}");
        prettyLog("Status code: ${e.response?.statusCode}");

        prettyLog('Dio exception: ${e.response?.data}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Unexpected error: $e');

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> logout() async {
    try {
      var response = await apiService.get(endPoints: 'logout');

      //  prettyLog(response.toJson());
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
