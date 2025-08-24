import 'package:flutter/material.dart';
import 'package:graph/features/followers&following/domain/entity/friend_entity.dart';
import '../../../../../core/widgets/custom_stateless_appbar.dart';
import 'count_and_divider.dart';
import 'follow_list_view.dart';
import 'follow_search_text_field.dart';
import '../../../../../generated/l10n.dart';

class FollowViewBody extends StatelessWidget {
  const FollowViewBody({super.key, required this.type, required this.friends});

  final String type;
  final List<FriendEntity> friends;

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Column(
      children: [
        CustomStatelessAppbar(lang: lang, title: type),
        FollowSearchTextField(lang: lang),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CountAndDivider(
                    lang: lang,
                    type: type,
                    count: friends.length,
                  ),
                  friends.isNotEmpty
                      ? FollowListView(friends: friends)
                      : Center(child: Text('No friends yet!')),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
