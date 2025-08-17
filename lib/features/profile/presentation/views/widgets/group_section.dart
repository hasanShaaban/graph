import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import 'group_profile_list_view.dart';
import 'groups_drop_down_button.dart';
import 'see_all_groups_button.dart';
import '../../../../../generated/l10n.dart';

class GroupSection extends StatelessWidget {
  const GroupSection({
    super.key,
    required this.lang,
    required this.height,
    required this.width,
  });

  final S lang;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              lang.currentGroup,
              style: AppTextStyle.cairoSemiBold14.copyWith(
                color: Constants2.darkPrimaryColor(context),
              ),
            ),
            Spacer(),
            GroupsDropDownButton(),
            SizedBox(width: 10),
            SeeAllGroupsButton(lang: lang),
          ],
        ),
        SizedBox(height: 10),
        GroupProfileListView(height: height, width: width, lang: lang),
      ],
    );
  }
}
