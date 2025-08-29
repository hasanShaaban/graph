import 'package:flutter/material.dart';
import 'package:graph/features/groups/domain/entity/group_member_entity.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/profile_image.dart';
import 'group_member_container_header.dart';
import 'group_member_tools.dart';
import 'personal_info_column.dart';
import '../../../../../generated/l10n.dart';

class GroupMemberContainer extends StatelessWidget {
  const GroupMemberContainer({
    super.key,
    required this.lang,
    required this.width,
    required this.height,
    this.skill,
    required this.name,
    this.image,
  });

  final S lang;
  final double width;
  final double height;
  final String name;
  final String? image;
  final SkillEntity? skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Constants2.lightSecondaryColor(context),
        borderRadius: BorderRadius.circular(17),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
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
                image:
                    image!.startsWith('http')
                        ? image
                        : 'http://127.0.0.1:8000$image',
              ),
              SizedBox(width: 10),
              PesronalInfoColumn(name: name),
            ],
          ),
          SizedBox(height: 5),
          // GroupMemberRole(lang: lang, width: width, height: height),
          SizedBox(height: 5),
          GroupMemberTools(
            lang: lang,
            width: width,
            height: height,
            tool: skill
          ),
        ],
      ),
    );
  }
}
