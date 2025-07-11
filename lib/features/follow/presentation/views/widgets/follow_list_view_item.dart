import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/features/follow/presentation/views/widgets/custom_user_list_view.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';

class FollowListViewItem extends StatefulWidget {
  const FollowListViewItem({super.key});

  @override
  State<FollowListViewItem> createState() => _FollowListViewItemState();
}

class _FollowListViewItemState extends State<FollowListViewItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CustomUserListView(),

          Spacer(),
          SvgPicture.asset(
            Assets.iconsDots,
            color: const Color.fromARGB(255, 41, 41, 41),
          ),
        ],
      ),
    );
  }
}
