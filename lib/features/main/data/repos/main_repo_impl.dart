import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/core/functions/pritty_log.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/features/auth/data/repos/auth_local_data_source.dart';
import 'package:graph/features/main/data/models/noraml_post_model.dart';
import 'package:graph/features/main/data/models/pending_invitation_model.dart';
import 'package:graph/features/main/data/models/user_image_model.dart';
import 'package:graph/features/main/domain/entity/noraml_post_entity.dart';
import 'package:graph/features/main/domain/entity/pending_invitation_entity.dart';
import 'package:graph/features/main/domain/entity/user_image_entity.dart';
import 'package:graph/features/main/domain/repos/main_repo.dart';

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
  Future<Either<Failures, List<NormalPostEntity>>> getMainPagePosts() async {
    AuthLocalDataSource authLocalDataSource = getIt<AuthLocalDataSource>();
    int id = await authLocalDataSource.getUserId();
    try {
      var data = await apiService.get(endPoints: 'posts/all/$id?');
      final List<NormalPostModel> response =
          (data['data'] as List)
              .map((e) => NormalPostModel.fromJson(e as Map<String, dynamic>))
              .toList();

      prettyLog(response[0].toJson());
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
  Future<Either<Failures, List<PendingInvitationEntity>>>
  getPendingInvitations() async {
    try {
      var data = await apiService.get(endPoints: 'invitations?');
      final List<PendingInvitationModel> response =
          (data['data'] as List)
              .map(
                (e) =>
                    PendingInvitationModel.fromJson(e as Map<String, dynamic>),
              )
              .toList();
      // prettyLog(response[0].toJson());
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
  Future<Either<Failures, Map<String, dynamic>>> invitationResponse({
    required int invitationId,
    required String response,
  }) async {
    try {
      var data = await apiService.post(
        endPoint: 'invitations/1?',
        data: {
          'response': response,
          'invitation_id': invitationId,
          'skill_id': 20,
        },
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        prettyLog(e.message);
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
