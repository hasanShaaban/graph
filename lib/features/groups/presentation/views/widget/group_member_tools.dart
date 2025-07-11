
import 'package:flutter/material.dart';
import 'package:graph/core/functions/show_tools_bottom_sheet.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/groups/presentation/views/widget/add_button.dart';
import 'package:graph/features/groups/presentation/views/widget/group_member_tools_list_view.dart';
import 'package:graph/generated/l10n.dart';

class GroupMemberTools extends StatefulWidget {
  const GroupMemberTools({
    super.key,
    required this.lang,
    required this.width,
    required this.height,
  });
  final double width, height;

  final S lang;

  @override
  State<GroupMemberTools> createState() => _GroupMemberToolsState();
}

class _GroupMemberToolsState extends State<GroupMemberTools> {
  List<String> chosenTools = [];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.lang.tools,
          style: AppTextStyle.cairoRegular16.copyWith(
            color: Constants.darkSecondryColor,
          ),
        ),
        Spacer(),
        chosenTools.isNotEmpty
            ? GroupMemberToolsListView(lang: widget.lang, chosenTools: chosenTools, width: widget.width)
            : SizedBox(),
        AddButton(
          onTap: () async {
            final result = await showToolsBottomSheet(
              context: context,
              initialChosenTools: chosenTools,
              lang: widget.lang,
              tools: tools,
            );
            setState(() {
              chosenTools = result;
            });
          },
        ),
      ],
    );
  }

  List<String> tools = [
    Assets.imagesFlutter,
    Assets.imagesDart,
    Assets.imagesFigma,
    Assets.imagesFirebase,
    Assets.imagesGit,
    Assets.imagesPython,
    Assets.imagesJs,
    Assets.imagesFlutter,
    Assets.imagesDart,
    Assets.imagesFigma,
    Assets.imagesFirebase,
    Assets.imagesGit,
    Assets.imagesPython,
    Assets.imagesJs,
    Assets.imagesFlutter,
    Assets.imagesDart,
    Assets.imagesFigma,
    Assets.imagesFirebase,
    Assets.imagesGit,
    Assets.imagesPython,
    Assets.imagesJs,
    Assets.imagesFlutter,
    Assets.imagesDart,
    Assets.imagesFigma,
    Assets.imagesFirebase,
    Assets.imagesGit,
    Assets.imagesPython,
    Assets.imagesJs,
    Assets.imagesFlutter,
    Assets.imagesDart,
    Assets.imagesFigma,
    Assets.imagesFirebase,
    Assets.imagesGit,
    Assets.imagesPython,
    Assets.imagesJs,
  ];
}

