import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/posts/public_post_widgets/post_activities.dart';
import 'package:graph/core/widgets/posts/public_post_widgets/react_button.dart';
import 'package:graph/core/widgets/profile_image.dart';
import 'package:graph/generated/l10n.dart';
import 'package:intl/intl.dart';

class PublicPost extends StatelessWidget {
  const PublicPost({
    super.key,
    required this.lang,
    required this.width,
    required this.height,
  });
  final S lang;
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Constants.lightSecondryColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              children: [
                Row(
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
                                color: Constants.darkPrimaryColor,
                                height: 1.1,
                              ),
                            ),
                            SizedBox(width: 7),
                            SvgPicture.asset(
                              Assets.iconsEarthAfrica,
                              width: 12,
                              color: Constants.darkSecondryColor,
                            ),
                          ],
                        ),
                        Text(
                          DateFormat(
                            'MMM d, yyyy – h:mm a',
                          ).format(DateTime.parse("2024-06-20T12:30:00")),
                          style: AppTextStyle.cairoRegular12.copyWith(
                            color: Constants.darkSecondryColor,
                            height: 0.9,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      Assets.iconsDots,
                      color: Constants.darkSecondryColor,
                    ),
                  ],
                ),
                SizedBox(height: 200),
                Divider(color: Constants.deviderColor, thickness: 1),
                Row(
                  children: [
                    PostActivities(icon: Assets.iconsCommentDots, count: '234'),
                    Spacer(),
                    PostActivities(icon: Assets.iconsShare, count: '234'),
                  ],
                ),
              ],
            ),
          ),
        ),
        ReactButton(height: height, width: width),
      ],
    );
  }
}


