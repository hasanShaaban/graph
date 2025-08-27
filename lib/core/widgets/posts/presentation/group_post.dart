import 'package:flutter/material.dart';
import 'group_post_widgets/group_member_list_view.dart';

import 'package:graph/core/widgets/posts/presentation/group_post_widgets/group_member_list_view.dart';
import '../../../utils/appAssets.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/constants.dart';
import 'group_post_widgets/group_post_header.dart';
import 'group_post_widgets/text_section.dart';
import '../../../../features/profile/presentation/views/widgets/group_member_info.dart';
import '../../../../generated/l10n.dart';

class GroupPost extends StatelessWidget {
  const GroupPost({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var lang = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        GroupPostHeader(width: width, height: height, lang: lang),
        SizedBox(height: 10),
        TextSection(lang: lang),
        SizedBox(height: 10),
        GroupMembersListView(height: height, width: width, lang: lang),
        SizedBox(height: 5),
        Divider(height: 1, color: Constants2.dividerColor(context),thickness: 1,)
      ],
    );
  }
}

