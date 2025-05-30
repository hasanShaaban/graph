import 'package:flutter/material.dart';

import 'package:graph/features/follow/presentation/views/widgets/custom_search_text_feild.dart';
import 'package:graph/features/follow/presentation/views/widgets/follow_list_view_item.dart';
import 'package:graph/features/follow/presentation/views/widgets/follow_number_section.dart';

import 'widgets/custom_app_bar.dart';

class FollowingView extends StatelessWidget {
  const FollowingView({super.key});
  static const name = 'following';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(text1: 'Following', onPressed: () {}),
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
