import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/generated/l10n.dart';

class FollowersAndFollowingSection extends StatelessWidget {
  const FollowersAndFollowingSection({
    super.key,
    required this.width,
    required this.lang,
  });

  final double width;
  final S lang;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width * 272 / 412 - 24,
      decoration: BoxDecoration(
        color: Constants.lightSecondryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            lang.followers,
            style: AppTextStyle.cairoRegular14.copyWith(
              color: Constants.darkSecondryColor,
            ),
          ),
          SizedBox(width: 10),
          Text(
            '314',
            style: AppTextStyle.cairoSemiBold18.copyWith(
              color: Constants.secondryColor,
            ),
          ),
          SizedBox(width: 15),
          VerticalDivider(
            color: Constants.deviderColor,
            width: 1,
            thickness: 1.5,
            indent: 7,
            endIndent: 7,
          ),
          SizedBox(width: 15),
          Text(
            lang.following,
            style: AppTextStyle.cairoRegular14.copyWith(
              color: Constants.darkSecondryColor,
            ),
          ),
          SizedBox(width: 10),
          Text(
            '314',
            style: AppTextStyle.cairoSemiBold18.copyWith(
              color: Constants.secondryColor,
            ),
          ),
        ],
      ),
    );
  }
}