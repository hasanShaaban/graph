import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../edit_profile_view.dart';
import '../../../../../generated/l10n.dart';

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
            color: Constants2.darkSecondaryColor(context),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Constants2.primaryColor(context).withOpacity(0.4),
            onTap: () {
              Navigator.pushNamed(context, EditProfileView.name);
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
