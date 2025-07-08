import 'package:flutter/material.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/tech_tool_container.dart';
import 'package:graph/generated/l10n.dart';

class GroupMemberToolsListView extends StatelessWidget {
  const GroupMemberToolsListView({
    super.key,
    required this.lang,
    required this.chosenTools, required this.width,
  });

final S lang;
  final List<String> chosenTools;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 250 / 412,
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chosenTools.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: lang.lang == 'en' ? 10 : 0,
              left: lang.lang == 'ar' ? 10 : 0,
            ),
            child: TechToolContainer(
              width: 40,
              height: 40,
              color: Constants.lightPrimaryColor,
              icon: chosenTools[index],
            ),
          );
        },
      ),
    );
  }
}
