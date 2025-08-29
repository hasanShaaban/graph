
import 'package:flutter/material.dart';
import '../../../domain/entity/skill_entity.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/tech_tool_container.dart';
import '../../../../../generated/l10n.dart';

class TechToolsListView extends StatelessWidget {
  const TechToolsListView({
    super.key,
    required this.lang,
    required this.width,
    required this.iconSize,
    required this.listPadding,
    required this.borderRadius,
    this.skills,
  });
  final S lang;
  final double width, iconSize, listPadding, borderRadius;
  final List<SkillEntity>? skills;
  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: iconSize,
      width: width,
      child:
          skills != null
              ? skills!.isNotEmpty
                  ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: skills!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          right: lang.lang == 'en' ? listPadding : 0,
                          left: lang.lang == 'ar' ? listPadding : 0,
                        ),

                        child: TechToolContainer(
                          name: skills![index].name,
                          width: iconSize,
                          height: iconSize,
                          color: Constants2.lightPrimaryColor(context),
                          icon: skills![index].logoUrl,
                        ),
                      );
                    },
                  )
                  : Row(children: [Text('the list is empty')])
              : Row(children: [Text('no tools yet')]),
    );
  }
}
