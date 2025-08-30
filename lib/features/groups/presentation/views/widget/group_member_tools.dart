import 'package:flutter/material.dart';
import 'package:graph/core/functions/fix_skill_url.dart';
import 'package:graph/core/functions/pritty_log.dart';
import 'package:graph/core/functions/show_chose_single_tool.dart';
import 'package:graph/core/widgets/tech_tool_container.dart';
import 'package:graph/features/groups/domain/entity/group_member_entity.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import 'add_button.dart';
import '../../../../../generated/l10n.dart';

class GroupMemberTools extends StatefulWidget {
  const GroupMemberTools({
    super.key,
    required this.lang,
    required this.width,
    required this.height,
    this.tool,
    this.onToolSelected, this.returnedSkillId,
  });
  final double width, height;
  final SkillEntity? tool;
  final ValueChanged<SkillEntity>? onToolSelected;
  final ValueChanged<int>? returnedSkillId;

  final S lang;

  @override
  State<GroupMemberTools> createState() => _GroupMemberToolsState();
}

class _GroupMemberToolsState extends State<GroupMemberTools> {
  @override
  void initState() {
    widget.tool != null
        ? widget.tool!.skillLogo != ''
            ? chosenTools = widget.tool!
            : chosenTools = null
        : chosenTools = null;
    super.initState();
  }

  SkillEntity? chosenTools;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.lang.tools,
          style: AppTextStyle.cairoRegular16.copyWith(
            color: Constants2.darkSecondaryColor(context),
          ),
        ),
        SizedBox(width: 10),
        chosenTools != null
            ? TechToolContainer(
              name: chosenTools!.skillName,
              width: 40,
              height: 40,
              color: Constants2.lightPrimaryColor(context),
              icon: fixSkillUrl(chosenTools!.skillLogo),
            )
            : SizedBox(),
        Spacer(),
        AddButton(
          onTap: () async {
            final result = await showSingleToolBottomSheet(
              context: context,
              initialChosenTool: chosenTools,
              lang: widget.lang,
              returnedSkillId: widget.returnedSkillId,
            );
            prettyLog(result?.skillLogo);
            if (result != null) {
              setState(() {
                chosenTools = result;
              });
              widget.onToolSelected?.call(result);
            }
          },
        ),
      ],
    );
  }
}
