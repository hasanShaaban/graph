import 'package:flutter/material.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/posts/public_post_widgets/post_activities.dart';
import 'package:graph/core/widgets/posts/public_post_widgets/post_header.dart';
import 'package:graph/core/widgets/posts/public_post_widgets/public_post_conent.dart';
import 'package:graph/core/widgets/posts/public_post_widgets/react_button.dart';
import 'package:graph/generated/l10n.dart';

class PublicPost extends StatelessWidget {
  const PublicPost({
    super.key,
    required this.lang,
    required this.width,
    required this.height,
    this.onTap,
  });
  final S lang;
  final double width, height;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Constants2.lightSecondaryColor(context),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              children: [
                // This row includes the profile image, the user name, and the
                // post's actions including save button.
                PostHeader(width: width, height: height),
                PublicPostContent(),
                Divider(color: Constants2.dividerColor(context), thickness: 1),
                // This row includes the post's comments and shares. It
                // also includes a spacer to align the share button to the
                // right of the row.
                Row(
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: PostActivities(
                        icon: Assets.iconsCommentDots,
                        count: '234',
                      ),
                    ),
                    Spacer(),
                    PostActivities(icon: Assets.iconsShare, count: '234'),
                  ],
                ),
              ],
            ),
          ),
        ),
        ReactButton(
          height: height,
          width: width,
          buttonColor: Constants2.lightSecondaryColor(context),
          circleColor: Constants2.lightPrimaryColor(context),
        ),
      ],
    );
  }
}
