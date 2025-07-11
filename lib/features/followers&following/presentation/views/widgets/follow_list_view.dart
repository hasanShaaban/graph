import 'package:flutter/material.dart';
import 'package:graph/features/followers&following/presentation/views/widgets/follow_list_view_item.dart';

class FollowListView extends StatelessWidget {
  const FollowListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => FollowListViewItem(key: ValueKey(index)),
      itemCount: 20,
    );
  }
}
