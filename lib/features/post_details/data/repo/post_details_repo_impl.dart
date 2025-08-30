import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/core/functions/pritty_log.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/features/post_details/data/models/comment_model.dart';
import 'package:graph/features/post_details/data/models/reaction_model.dart';
import 'package:graph/features/post_details/domain/entity/comment_entity.dart';
import 'package:graph/features/post_details/domain/entity/reaction_entity.dart';
import 'package:graph/features/post_details/domain/repo/post_details_repo.dart';

class PostDetailsRepoImpl extends PostDetailsRepo {
  final SecureApiService secureApiService;

  PostDetailsRepoImpl(this.secureApiService);

  @override
  Future<Either<Failures, List<ReactionEntity>>> getPostReactions({
    required int postId,
  }) async {
    try {
      var data = await secureApiService.get(endPoints: 'reaction/get/$postId?');
      final List<ReactionModel> response =
          (data['data'] as List)
              .map((e) => ReactionModel.fromJson(e as Map<String, dynamic>))
              .toList();
      return right(response);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Dio Exception ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Exception ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<CommentEntity>>> getPostComments({
    required int postId,
  }) async {
    try {
      var data = await secureApiService.get(
        endPoints: 'post/comment/get/$postId',
      );
      final List<CommentModel> response =
          (data['data'] as List)
              .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
              .toList();
      prettyLog('Comment Response ${response[0].toJson()}');
      return right(response);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Dio Exception ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Exception ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> addComment({
    required int postId,
    required String comment,
  }) async {
    try {
      var data = await secureApiService.post(
        endPoint: 'comment/make?',
        data: {'comment': comment, 'post_id': postId},
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        prettyLog('Dio Exception ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      prettyLog('Exception ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }
}
