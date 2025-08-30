
import 'package:flutter/material.dart';
import 'package:graph/features/followers&following/domain/entity/friend_entity.dart';
import 'package:graph/features/followers&following/presentation/views/widgets/follow_list_view_item.dart';

Future<FriendEntity?> showFriendsBottomSheet(
    BuildContext context,
    List<FriendEntity> friends,
    FriendEntity? selectedFriend,
  ) {
    return showModalBottomSheet<FriendEntity>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: friends.length,
                      itemBuilder: (context, index) {
                        final friend = friends[index];
                        final isSelected = selectedFriend == friend;

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // Your custom friend item
                              Expanded(
                                child: FollowListViewItem(friend: friend),
                              ),

                              // Checkbox
                              Checkbox(
                                value: isSelected,
                                onChanged: (_) {
                                  setState(() {
                                    if (isSelected) {
                                      selectedFriend = null; // unselect
                                    } else {
                                      selectedFriend =
                                          friend; // select only one
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // Invite button at bottom
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            selectedFriend != null
                                ? () {
                                  // Handle invite action
                                  Navigator.pop(context, selectedFriend);
                                }
                                : null,
                        child: const Text("add"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
    
  }