import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/features/followers&following/domain/entity/friend_entity.dart';

import '../../../../../core/utils/constants.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';

class FollowListViewItem extends StatelessWidget {
  const FollowListViewItem({super.key, required this.friend});
  final FriendEntity friend;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // <<<<<<< HEAD:lib/features/follow/presentation/views/widgets/follow_list_view_item.dart
          //           CustomUserListView(),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(friend.profileImageUrl),
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                friend.name,
                style: AppTextStyle.cairoRegular18.copyWith(height: 1),
              ),
              Text(
                friend.role,
                style: AppTextStyle.cairoRegular14.copyWith(
                  color: Constants2.darkSecondaryColor(context),
                ),
              ),
            ],
          ),

          Spacer(),
          SvgPicture.asset(
            Assets.iconsDots,
            color: Constants2.darkSecondaryColor(context),
          ),
        ],
      ),
    );
  }
}
