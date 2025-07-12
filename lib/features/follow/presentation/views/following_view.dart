import 'package:flutter/material.dart';
import 'package:graph/features/followers&following/presentation/views/widgets/follow_list_view_item.dart';
import 'package:graph/features/followers&following/presentation/views/widgets/follow_search_text_field.dart';
import '../../../../generated/l10n.dart';

import 'widgets/follow_number_section.dart';



class FollowingView extends StatelessWidget {
  const FollowingView({super.key});
  static const name = 'following';
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        // appBar: CustomAppBar(
        //   text1: lang.following,
        //   onPressed: () {
        //     Navigator.pushNamed(context, MyGroupView.name);
        //   },
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              FollowSearchTextField(lang: lang,),
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
