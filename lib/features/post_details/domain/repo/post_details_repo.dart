import 'package:dartz/dartz.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/features/post_details/domain/entity/comment_entity.dart';
import 'package:graph/features/post_details/domain/entity/reaction_entity.dart';

abstract class PostDetailsRepo {
  Future<Either<Failures, List<ReactionEntity>>> getPostReactions({required int postId});
  Future<Either<Failures, List<CommentEntity>>> getPostComments({required int postId});
  Future<Either<Failures, Map<String, dynamic>>> addComment({required int postId, required String comment});
}