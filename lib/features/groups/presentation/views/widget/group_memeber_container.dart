import 'package:flutter/material.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/profile_image.dart';
import 'package:graph/features/groups/presentation/views/widget/group_member_container_header.dart';
import 'package:graph/features/groups/presentation/views/widget/group_member_role.dart';
import 'package:graph/features/groups/presentation/views/widget/group_member_tools.dart';
import 'package:graph/features/groups/presentation/views/widget/personal_info_column.dart';
import 'package:graph/generated/l10n.dart';

class GroupMemberContainer extends StatelessWidget {
  const GroupMemberContainer({
    super.key,
    required this.lang,
    required this.width,
    required this.height,
  });

  final S lang;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Constants2.lightSecondaryColor(context),
        borderRadius: BorderRadius.circular(17),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GroupMemberContainerHeader(lang: lang),
          SizedBox(height: 5),
          Row(
            children: [
              ProfileImage(
                width: width,
                height: height,
                imageWidth: 65,
                imageHeight: 65,
                borderThick: 2,
              ),
              SizedBox(width: 10),
              PesronalInfoColumn(),
            ],
          ),
          SizedBox(height: 5),
          GroupMemberRole(lang: lang, width: width, height: height),
          SizedBox(height: 5),
          GroupMemberTools(lang: lang, width: width, height: height),
        ],
      ),
    );
  }
}
