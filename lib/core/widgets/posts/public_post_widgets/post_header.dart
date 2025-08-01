// ignore_for_file: deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/profile_image.dart';
import 'package:intl/intl.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileImage(
          width: width,
          height: height,
          imageWidth: 55,
          imageHeight: 55,
          borderThick: 1,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hasan Shaaban',
                  style: AppTextStyle.cairoSemiBold18.copyWith(
                    color: Constants2.darkPrimaryColor(context),
                    height: 1.1,
                  ),
                ),
                SizedBox(width: 7),
                SvgPicture.asset(
                  Assets.iconsEarthAfrica,
                  width: 12,
                  color: Constants2.darkSecondaryColor(context),
                ),
              ],
            ),
            Text(
              DateFormat(
                'MMM d, yyyy – h:mm a',
              ).format(DateTime.parse("2024-06-20T12:30:00")),
              style: AppTextStyle.cairoRegular12.copyWith(
                color: Constants2.darkSecondaryColor(context),
                height: 0.9,
              ),
            ),
          ],
        ),
        Spacer(),
        //TODO: implemet save button
        SvgPicture.asset(
          Assets.iconsBookmark,
          color: Constants2.darkSecondaryColor(context),
        ),
        SizedBox(width: 10),
        //TODO: implemet more button
        SvgPicture.asset(
          Assets.iconsDots,
          color: Constants2.darkSecondaryColor(context),
        ),
      ],
    );
  }
}
