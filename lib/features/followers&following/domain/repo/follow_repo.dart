import 'package:dartz/dartz.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/features/followers&following/data/models/follow_data.dart';
import 'package:graph/features/followers&following/domain/entity/friend_entity.dart';

abstract class FollowRepo {
  Future<Either<Failures, List<FriendEntity>>> getFollowers();
  Future<Either<Failures, List<FriendEntity>>> getFollowing();
  Future<Either<Failures, FollowData>> getFollowData();

}