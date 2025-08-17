
import 'package:flutter/material.dart';
import 'find_you_friends_item.dart';

class FindYouFriendsListView extends StatelessWidget {
  const FindYouFriendsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: FindYouFriendsItem(),
              ),
        ),
      ),
    );
  }
}
