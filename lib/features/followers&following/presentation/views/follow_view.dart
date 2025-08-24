import 'package:flutter/material.dart';
import 'package:graph/features/followers&following/domain/entity/friend_entity.dart';
import 'widgets/follow_view_body.dart';

class FollowView extends StatelessWidget {
  const FollowView({super.key, required this.type, required this.data});
  static const String name = 'FollowersView';
  final String type;
  final List<FriendEntity> data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: FollowViewBody(type: type, friends: data,)));
  }
}


