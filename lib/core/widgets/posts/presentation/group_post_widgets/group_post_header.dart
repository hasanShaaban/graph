import 'package:flutter/material.dart';
import 'package:graph/core/functions/fix_skill_url.dart';
import 'package:graph/core/widgets/tech_tool_container.dart';

import '../../../../utils/app_text_style.dart';
import '../../../../utils/constants.dart';
import '../../../profile_image.dart';
import '../../../../../generated/l10n.dart';

class GroupPostHeader extends StatelessWidget {
  const GroupPostHeader({
    super.key,
    required this.width,
    required this.height,
    required this.lang,
    required this.skillName,
    required this.skillIcon,
  });
  final double width;
  final double height;
  final S lang;
  final String skillName, skillIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TechToolContainer(
          width: 45,
          height: 45,
          color: Constants2.lightSecondaryColor(context),
          icon: fixSkillUrl(skillIcon),
          name: skillName,
        ),
        SizedBox(width: 10),
        Text(
          '$skillName Developer',
          style: AppTextStyle.cairoSemiBold18.copyWith(
            color: Constants2.primaryColor(context),
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            elevation: 2,
            backgroundColor: Constants2.lightSecondaryColor(context),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          child: Text(
            lang.join,
            style: AppTextStyle.cairoSemiBold16.copyWith(
              color: Constants2.darkSecondaryColor(context),
            ),
          ),
        ),
      ],
    );
  }
}
