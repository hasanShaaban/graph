import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';

class GroupMemberContainerHeader extends StatelessWidget {
  const GroupMemberContainerHeader({super.key, required this.lang,required this.isAdmin});

  final S lang;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isAdmin ?
          lang.groupAdmin : 'Group Member',
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
