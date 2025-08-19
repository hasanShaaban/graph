import 'package:flutter/widgets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/profile/domain/entity/profile_entity.dart';
import 'package:graph/features/profile/presentation/views/widgets/add_post_button.dart';
import 'package:graph/features/profile/presentation/views/widgets/followers_and_following_section.dart';
import 'package:graph/generated/l10n.dart';

class NameBioFollowSection extends StatelessWidget {
  const NameBioFollowSection({
    super.key,
    required this.lang,
    required this.width,
    required this.model,
  });

  final S lang;
  final double width;
  final ProfileEntity model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),

        //Name
        Text(
          model.name,
          style: AppTextStyle.cairoSemiBold24.copyWith(
            color: Constants2.darkPrimaryColor(context),
          ),
        ),

        //Bio
        Text(
          model.bio == null || model.bio == '' ? lang.noBioYet : model.bio!,
          style: AppTextStyle.cairoSemiBold16.copyWith(
            height: 1.2,
            color: Constants2.darkSecondaryColor(context),
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
      ],
    );
  }
}
