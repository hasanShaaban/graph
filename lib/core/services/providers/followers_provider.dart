import 'package:flutter/material.dart';
import 'package:graph/features/followers&following/domain/entity/friend_entity.dart';

class FollowersProvider extends ChangeNotifier {
  final List<FriendEntity> _followers = [];

  List<FriendEntity> get followers => List.unmodifiable(_followers);

  void setFollowers(List<FriendEntity> newFollowers) {
    _followers
      ..clear()
      ..addAll(newFollowers);
    notifyListeners();
  }

  void addFollower(FriendEntity follower) {
    if (!_followers.contains(follower)) {
      _followers.add(follower);
      notifyListeners();
    }
  }

  void removeFollower(FriendEntity follower) {
    if (_followers.remove(follower)) {
      notifyListeners();
    }
  }

  bool isFollower(FriendEntity follower) => _followers.contains(follower);
}
