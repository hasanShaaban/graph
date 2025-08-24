import 'package:flutter/material.dart';
import 'package:graph/features/main/domain/entity/noraml_post_entity.dart';
import '../../../utils/appAssets.dart';
import '../../../utils/constants.dart';
import 'public_post_widgets/post_activities.dart';
import 'public_post_widgets/post_header.dart';
import 'public_post_widgets/public_post_conent.dart';
import 'public_post_widgets/react_button.dart';
import '../../../../generated/l10n.dart';

class PublicPost extends StatelessWidget {
  const PublicPost({
    super.key,
    required this.lang,
    required this.width,
    required this.height,
    this.onTap,
    this.data,
  });
  final S lang;
  final double width, height;
  final VoidCallback? onTap;
  final NormalPostEntity? data;
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
                PostHeader(
                  width: width,
                  height: height,
                  user:
                      data?.users ??
                      [
                        UserEntity(
                          id: 1,
                          name: 'userName',
                          profileImageUrl: '',
                        ),
                      ],
                  date: data?.createdAt ?? 'january-1-1999',
                  privecy: data?.privacy ?? 'public',
                  imageUrl:
                      data?.users[0].profileImageUrl ??
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                ),
                data?.project != null
                    ? Text('project')
                    : PublicPostContent(
                      text: data?.description ?? '',
                      images: data?.files ?? [],
                    ),
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
                        count: data?.commentsCount.toString() ?? '0',
                      ),
                    ),
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
          reactsCount: data?.reactionsCount.toString() ?? '0',
        ),
      ],
    );
  }
}
