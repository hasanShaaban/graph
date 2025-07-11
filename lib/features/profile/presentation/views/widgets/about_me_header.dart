import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/profile/presentation/views/edit_profile_view.dart';
import 'package:graph/generated/l10n.dart';

class AboutMeHeader extends StatelessWidget {
  const AboutMeHeader({super.key, required this.lang});

  final S lang;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lang.aboutMe,
          style: AppTextStyle.cairoRegular14.copyWith(
            color: Constants.darkSecondryColor,
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Constants.primaryColor.withOpacity(0.4),
            onTap: () {
              Navigator.pushNamed(context, EditProfileView.name);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  lang.editProfile,
                  style: AppTextStyle.cairoRegular14.copyWith(
                    color: Constants.primaryColor,
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
