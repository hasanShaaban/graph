import 'package:flutter/material.dart';
import 'package:graph/features/followers&following/presentation/views/widgets/follow_list_view_item.dart';
import '../../../groups/presentation/views/my_group_view.dart';
import '../../../../generated/l10n.dart';

import 'widgets/custom_search_text_feild.dart';
import 'widgets/follow_list_view_item.dart';
import 'widgets/follow_number_section.dart';

import 'widgets/custom_app_bar.dart';

class FollowingView extends StatelessWidget {
  const FollowingView({super.key});
  static const name = 'following';
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text1: lang.following,
          onPressed: () {
            Navigator.pushNamed(context, MyGroupView.name);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomSearchTextField(),
              FollowNumberSection(text: 'Following'),

              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) => FollowListViewItem(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
