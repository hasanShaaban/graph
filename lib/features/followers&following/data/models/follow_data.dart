import 'package:graph/features/followers&following/domain/entity/friend_entity.dart';

class FollowData {
  final List<FriendEntity> followers;
  final List<FriendEntity> followings;

  FollowData({
    required this.followers,
    required this.followings,
  });
}