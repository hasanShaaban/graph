import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/core/functions/pritty_log.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/core/widgets/posts/domain/repos/public_post_repo.dart';

class PublicPostRepoImpl extends PublicPostRepo {
  final SecureApiService secureApiService;

  PublicPostRepoImpl(this.secureApiService);
  @override
  Future<Either<Failures, Map<String, dynamic>>> addReact({
    required int postId,
    required int reactId,
  }) async {

    try {
      var data = await secureApiService.post(
        endPoint: 'reaction/make?',
        data: {'post_id': postId, 'reaction_id': reactId},
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Project Response ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Project Response ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failures, Map<String, dynamic>>> removeReact({required int postId}) async{
    try {
      var data = await secureApiService.delete(
        endPoint: 'reaction/delete/$postId?',
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Delete React Dio Exception ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Delete React Exception ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failures, Map<String, dynamic>>> updateReact({required int postId, required int reactId}) async{
    try {
      var data = await secureApiService.post(
        endPoint: 'reaction/update?',
        data: {'post_id': postId, 'reaction_id': reactId},
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Reaction update Response ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Reaction update Response ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }
}

