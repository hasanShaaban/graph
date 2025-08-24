
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/widgets/error_page.dart';
import 'package:graph/features/profile/presentation/manager/profile/profile_cubit.dart';
import 'package:graph/features/profile/presentation/views/widgets/name_bio_follow_section.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/posts/public_post.dart';
import '../../../../../core/widgets/profile_image.dart';
import '../../../../post_details/presentation/view/post_details_view.dart';
import 'about_me_container.dart';
import 'go_up_button.dart';
import 'group_section.dart';
import 'profile_app_bar.dart';
import '../../../../../generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var lang = S.of(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileError) {
          return ErrorPage(lang: lang, width: width, state: state);
        } else if (state is ProfileSuccess) {
          var profileModel = state.profileEntity;
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
                        image: profileModel.image,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NameBioFollowSection(
                        lang: lang,
                        width: width,
                        model: profileModel,
                      ),

                      Divider(
                        thickness: 1,
                        color: Constants2.dividerColor(context),
                      ),
                      AboutMeContainer(
                        width: width,
                        height: height,
                        lang: lang,
                        year: profileModel.year[0],
                        major: profileModel.major[0],
                        skills: profileModel.skills,
                        links: profileModel.socialLinks,
                        cv: profileModel.cv,
                        model: profileModel,
                      ),
                      Divider(
                        thickness: 1,
                        color: Constants2.dividerColor(context),
                      ),
                      GroupSection(lang: lang, height: height, width: width),
                      Divider(
                        thickness: 1,
                        color: Constants2.dividerColor(context),
                      ),
                      SizedBox(height: 5),
                      Text(
                        lang.activities,
                        style: AppTextStyle.cairoSemiBold14,
                      ),
                      PublicPost(
                        lang: lang,
                        width: width,
                        height: height,
                        onTap: () {
                          Navigator.pushNamed(context, PostDetailsView.name);
                        },
                      ),
                      SizedBox(height: 25),
                      Divider(
                        thickness: 1,
                        color: Constants2.dividerColor(context),
                      ),
                      GoUpButton(
                        scrollController: scrollController,
                        lang: lang,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

