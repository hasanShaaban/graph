import 'package:flutter/material.dart';
import 'package:graph/features/auth/presentation/views/widgets/find_you_friends_app_bar.dart';
import 'package:graph/features/auth/presentation/views/widgets/find_you_friends_list_view.dart';
import 'package:graph/features/follow/presentation/views/widgets/follow_number_section.dart';
import 'package:graph/features/followers&following/presentation/views/widgets/follow_search_text_field.dart';
import 'package:graph/generated/l10n.dart';

class SignupFindFriends extends StatelessWidget {
  const SignupFindFriends({super.key});
  static const name = 'findFriends';
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FindYouFriendsAppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: Column(
                children: [
                  FollowSearchTextField(lang: lang,),
                  FollowNumberSection(text: lang.following),
                ],
              ),
            ),
            FindYouFriendsListView(),
          ],
        ),
      ),
    );
  }
}
