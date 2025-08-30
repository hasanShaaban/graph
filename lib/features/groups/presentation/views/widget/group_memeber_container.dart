import 'package:flutter/material.dart';
import 'package:graph/features/groups/domain/entity/group_member_entity.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/profile_image.dart';
import '../../../../../generated/l10n.dart';
import 'group_member_container_header.dart';
import 'group_member_tools.dart';
import 'personal_info_column.dart';

class GroupMemberContainer extends StatefulWidget {
  const GroupMemberContainer({
    super.key,
    required this.lang,
    required this.width,
    required this.height,
    this.skill,
    required this.name,
    this.image,required this.isAdmin, this.onSkillSelected, this.returnedSkillId,
  });

  final S lang;
  final double width;
  final double height;
  final String name;
  final String? image;
  final SkillEntity? skill;
  final bool isAdmin;
  final ValueChanged<SkillEntity>? onSkillSelected;
  final ValueChanged<int>? returnedSkillId;

  @override
  State<GroupMemberContainer> createState() => _GroupMemberContainerState();
}

class _GroupMemberContainerState extends State<GroupMemberContainer> {
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
          GroupMemberContainerHeader(lang: widget.lang, isAdmin: widget.isAdmin,),
          SizedBox(height: 5),
          Row(
            children: [
              ProfileImage(
                width: widget.width,
                height: widget.height,
                imageWidth: 65,
                imageHeight: 65,
                borderThick: 2,
                image:
                    widget.image!.startsWith('http')
                        ? widget.image
                        : 'http://127.0.0.1:8000${widget.image}',
              ),
              SizedBox(width: 10),
              PesronalInfoColumn(name: widget.name),
            ],
          ),
          SizedBox(height: 5),
          // GroupMemberRole(lang: lang, width: width, height: height),
          SizedBox(height: 5),
          GroupMemberTools(
            lang: widget.lang,
            width: widget.width,
            height: widget.height,
            tool: widget.skill,
            onToolSelected: widget.onSkillSelected,
            returnedSkillId: widget.returnedSkillId,
          ),
        ],
      ),
    );
  }
}
