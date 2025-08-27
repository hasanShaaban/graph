import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entity/friend_entity.dart';

import 'package:graph/features/followers&following/data/models/follow_data.dart';

abstract class FollowRepo {
  Future<Either<Failures, List<FriendEntity>>> getFollowers();
  Future<Either<Failures, List<FriendEntity>>> getFollowing();
  Future<Either<Failures, FollowData>> getFollowData();

}