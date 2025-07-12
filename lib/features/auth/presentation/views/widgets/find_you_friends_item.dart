import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

import 'package:graph/features/followers&following/presentation/views/widgets/follow_search_text_field.dart';
import 'package:graph/generated/l10n.dart';

class FindYouFriendsItem extends StatelessWidget {
  const FindYouFriendsItem({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Row(
      children: [
        Expanded(child: FollowSearchTextField(lang: lang)),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 83,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Constants2.dividerColor(context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  Assets.iconsUserAdd,
                  color: Constants2.primaryColor(context),
                ),
                Text(
                  'follow',
                  style: AppTextStyle.cairoRegular16.copyWith(
                    color: Constants2.primaryColor(context),
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
