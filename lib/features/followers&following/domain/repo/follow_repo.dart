import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entity/friend_entity.dart';

abstract class FollowRepo {
  Future<Either<Failures, List<FriendEntity>>> getFollowers();
  Future<Either<Failures, List<FriendEntity>>> getFollowing();
}