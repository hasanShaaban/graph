import 'package:flutter/material.dart';
import 'package:graph/features/followers&following/domain/entity/friend_entity.dart';
import 'follow_list_view_item.dart';

class FollowListView extends StatelessWidget {
  const FollowListView({super.key, required this.friends});

  final List<FriendEntity> friends;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => FollowListViewItem(key: ValueKey(index), friend: friends[index],),
      itemCount: friends.length,
    );
  }
}
