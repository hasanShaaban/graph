import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/generated/l10n.dart';

class GroupMemberContainerHeader extends StatelessWidget {
  const GroupMemberContainerHeader({super.key, required this.lang});

  final S lang;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          lang.groupAdmin,
          style: AppTextStyle.cairoRegular14.copyWith(
            color: Constants2.darkSecondaryColor(context),
            height: 1,
          ),
        ),
        Spacer(),
        SvgPicture.asset(Assets.iconsRemove),
      ],
    );
  }
}
