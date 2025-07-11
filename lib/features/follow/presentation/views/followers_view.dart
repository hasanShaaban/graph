import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../generated/l10n.dart';
import 'following_view.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_search_text_feild.dart';
import 'widgets/follow_list_view_item.dart';
import 'widgets/follow_number_section.dart';

class FollowersView extends StatefulWidget {
  const FollowersView({super.key});
  static const name = 'followers';

  @override
  State<FollowersView> createState() => _FollowersViewState();
}

class _FollowersViewState extends State<FollowersView> {
  bool isLoaded = false;
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text1: lang.followers,
          onPressed: () {
            Navigator.pushNamed(context, FollowingView.name);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              CustomSearchTextField(),
              FollowNumberSection(text: lang.follower),

              Expanded(child: isLoaded ? BuildListView() : getShimmerLoading()),
            ],
          ),
        ),
      ),
    );
  }

  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: 100, height: 15, color: Colors.white),
                      const SizedBox(height: 5),
                      Container(width: 60, height: 10, color: Colors.white),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.more_vert, color: Colors.grey[400]),
                ],
              ),
            ),
      ),
    );
  }
}

class BuildListView extends StatelessWidget {
  const BuildListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => FollowListViewItem(),
    );
  }
}
