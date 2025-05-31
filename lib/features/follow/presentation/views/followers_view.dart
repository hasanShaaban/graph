import 'package:flutter/material.dart';

import 'package:graph/features/follow/presentation/views/widgets/custom_search_text_feild.dart';
import 'package:graph/features/follow/presentation/views/widgets/follow_list_view_item.dart';
import 'package:graph/features/follow/presentation/views/widgets/follow_number_section.dart';
import 'package:graph/generated/l10n.dart';

import 'widgets/custom_app_bar.dart';

class FollowersView extends StatelessWidget {
  const FollowersView({super.key});
  static const name = 'followers';
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(text1: lang.followers, onPressed: () {}),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              CustomSearchTextField(),
              FollowNumberSection(text: 'Follower'),

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
