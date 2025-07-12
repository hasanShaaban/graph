import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/profile/presentation/views/widgets/group_profile_list_view.dart';
import 'package:graph/features/profile/presentation/views/widgets/groups_drop_down_button.dart';
import 'package:graph/features/profile/presentation/views/widgets/see_all_groups_button.dart';
import 'package:graph/generated/l10n.dart';

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
