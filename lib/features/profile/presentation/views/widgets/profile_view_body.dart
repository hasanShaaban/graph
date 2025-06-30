import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/posts/public_post.dart';
import 'package:graph/core/widgets/profile_image.dart';
import 'package:graph/features/profile/presentation/views/widgets/about_me_container.dart';
import 'package:graph/features/profile/presentation/views/widgets/add_post_button.dart';
import 'package:graph/features/profile/presentation/views/widgets/followers_and_following_section.dart';
import 'package:graph/features/profile/presentation/views/widgets/go_up_button.dart';
import 'package:graph/features/profile/presentation/views/widgets/group_section.dart';
import 'package:graph/features/profile/presentation/views/widgets/profile_app_bar.dart';
import 'package:graph/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var lang = S.of(context);
    return SingleChildScrollView(
      controller: scrollController,
      physics: BouncingScrollPhysics(
        decelerationRate: ScrollDecelerationRate.fast,
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ProfileAppBar(height: height),
              Positioned(
                right: lang.lang == 'ar' ? 22 : null,
                left: lang.lang == 'en' ? 22 : null,
                top: 28,
                child: ProfileImage(
                  width: width,
                  height: height,
                  imageWidth: 120,
                  imageHeight: 120,
                  borderThick: 5,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                //Name
                Text(
                  'Hasan shaaban',
                  style: AppTextStyle.cairoSemiBold24.copyWith(
                    color: Constants.darkPrimaryColor,
                  ),
                ),
                //Bio
                Text(
                  'Software engineering student exploring web dev, cloud, and AI. Code, coffee, and creativity.',
                  style: AppTextStyle.cairoSemiBold16.copyWith(
                    height: 1.2,
                    color: Constants.darkSecondryColor,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    FollowersAndFollowingSection(width: width, lang: lang),
                    SizedBox(width: 5),
                    AddPostButton(lang: lang),
                  ],
                ),

                Divider(thickness: 1, color: Constants.deviderColor),
                AboutMeContainer(width: width, height: height, lang: lang),
                Divider(thickness: 1, color: Constants.deviderColor),
                GroupSection(lang: lang, height: height, width: width),
                Divider(thickness: 1, color: Constants.deviderColor),
                SizedBox(height: 5),
                Text(lang.activities, style: AppTextStyle.cairoSemiBold14),
                PublicPost(lang: lang, width: width, height: height),
                SizedBox(height: 25),
                Divider(thickness: 1, color: Constants.deviderColor),
                GoUpButton(scrollController: scrollController, lang: lang),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
