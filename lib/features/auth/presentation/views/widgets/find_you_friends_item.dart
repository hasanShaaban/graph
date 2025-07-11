
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/follow/presentation/views/widgets/custom_user_list_view.dart';

class FindYouFriendsItem extends StatelessWidget {
  const FindYouFriendsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomUserListView()),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 83,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Constants.deviderColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  Assets.iconsUserAdd,
                  color: Constants.primaryColor,
                ),
                Text(
                  'follow',
                  style: AppTextStyle.cairoRegular16.copyWith(
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
