import 'package:flutter/material.dart';
import 'package:graph/core/widgets/posts/group_post_widgets/group_member_list_view.dart';
import 'package:graph/features/main/domain/entity/group_post_entity.dart';
import '../../../utils/constants.dart';
import 'group_post_widgets/group_post_header.dart';
import 'group_post_widgets/text_section.dart';
import '../../../../generated/l10n.dart';

class GroupPost extends StatelessWidget {
  const GroupPost({super.key, required this.post});
  final GroupPostEntity post;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var lang = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        GroupPostHeader(
          width: width,
          height: height,
          lang: lang,
          skillName: post.skills[0].name,
          skillIcon: post.skills[0].logoUrl,
        ),
        SizedBox(height: 10),
        TextSection(
          lang: lang,
          project: post.group.project,
          discreption: post.description,
        ),
        SizedBox(height: 10),
        GroupMembersListView(
          height: height,
          width: width,
          lang: lang,
          members: post.groupMembers,
        ),
        SizedBox(height: 5),
        Divider(
          height: 1,
          color: Constants2.dividerColor(context),
          thickness: 1,
        ),
      ],
    );
  }
}
