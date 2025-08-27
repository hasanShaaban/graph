import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../domain/entity/profile_entity.dart';
import '../../../domain/entity/skill_entity.dart';
import '../../../domain/entity/social_link_entity.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../edit_profile_view.dart';
import '../../../../../generated/l10n.dart';

class AboutMeHeader extends StatelessWidget {
  const AboutMeHeader({
    super.key,
    required this.lang,
    required this.year,
    required this.major,
    this.skills,
    this.links,
    this.cv,
    required this.model,
  });

  final String year, major;
  final List<SkillEntity>? skills;
  final List<SocialLinkEntity>? links;
  final String? cv;
  final ProfileEntity model;
  final S lang;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lang.aboutMe,
          style: AppTextStyle.cairoRegular14.copyWith(
            color: Constants2.darkSecondaryColor(context),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Constants2.primaryColor(context).withOpacity(0.4),
            onTap: () {
              Navigator.pushNamed(
                context,
                EditProfileView.name,
                arguments: [model],
              //  arguments: [year, major, skills, links, cv, model.image,model.bio,model.gender, model.name],
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  lang.editProfile,
                  style: AppTextStyle.cairoRegular14.copyWith(
                    color: Constants2.primaryColor(context),
                  ),
                ),
                SvgPicture.asset(Assets.iconsUserPen),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
